WScript.StdOut.WriteLine("ABC".charAt(0) == "A");
while (!WScript.StdIn.AtEndOfStream)
    WScript.StdOut.WriteLine(WScript.StdIn.ReadLine().replace(/^\s+|\s+$/g, ''));
