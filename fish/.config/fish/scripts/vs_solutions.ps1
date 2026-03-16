# Enumerates all open Visual Studio instances via the COM Running Object Table (ROT)
# and prints their solution paths and window captions, one per line, as:
#   <WindowsPath>|<Caption>
#
# Called from the vs-pick Fish function.

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
using System.Runtime.InteropServices.ComTypes;
using System.Collections.Generic;
using System.Reflection;

public class VSRotHelper {
    [DllImport("ole32.dll")] static extern int GetRunningObjectTable(int r, out IRunningObjectTable t);
    [DllImport("ole32.dll")] static extern int CreateBindCtx(int r, out IBindCtx c);

    static string GetProp(object obj, string path) {
        foreach (var part in path.Split('.')) {
            if (obj == null) return null;
            obj = obj.GetType().InvokeMember(
                part,
                BindingFlags.GetProperty | BindingFlags.Public | BindingFlags.Instance,
                null, obj, null);
        }
        if (obj == null) return null;
        return obj.ToString();
    }

    public static string[] GetSolutions() {
        var result = new List<string>();
        IRunningObjectTable rot;
        if (GetRunningObjectTable(0, out rot) != 0) return result.ToArray();

        IEnumMoniker e;
        rot.EnumRunning(out e);
        e.Reset();

        var arr = new IMoniker[1];
        while (e.Next(1, arr, IntPtr.Zero) == 0) {
            IBindCtx ctx;
            CreateBindCtx(0, out ctx);
            string name;
            arr[0].GetDisplayName(ctx, null, out name);

            if (name != null && name.StartsWith("!VisualStudio.DTE")) {
                object obj = null;
                if (rot.GetObject(arr[0], out obj) == 0 && obj != null) {
                    try {
                        string sln = GetProp(obj, "Solution.FullName");
                        string cap = GetProp(obj, "MainWindow.Caption");
                        if (sln == null) sln = "";
                        if (cap == null) cap = "";
                        result.Add(sln + "|" + cap);
                    } catch {}
                }
            }
        }
        return result.ToArray();
    }
}
"@

[VSRotHelper]::GetSolutions()
