(function(globalScope) {
    'use strict';
    if (WScript.fullName.slice(-12).toLowerCase() !== '\\cscript.exe')
        throw new Error("Must run using cscript");
    
    if(WScript.arguments.length == 0)
        return;
    
    var fso = new ActiveXObject("Scripting.FileSystemObject");
    var args = WScript.arguments;
    var prev = "";
    var sourceText = [];
    var sourceLang = "auto", targetLang = "";
    for (var i = 0; i < args.length; i++) {
        a = args(i);
        if (a == "-stdin") {
            while (!WScript.StdIn.AtEndOfStream)
                sourceText.push(WScript.StdIn.ReadLine().replace(/^\s+|\s+$/g, ''));
            prev = "";
            continue;
        }
        else if (prev == "-sl") {
            sourceLang = a;
            prev = "";
            continue;
        }
        else if (prev == "-tl") {
            targetLang = a;
            prev = "";
            continue;
        }
        else if (prev == "-in") {
            var stream = fso.OpenTextFile(a, 1, true);
            try {
                while (!stream.AtEndOfStream)
                    sourceText.push(stream.ReadLine().replace(/^\s+|\s+$/g, ''));
            }
            catch(e) {
                stream.close();
            }
            prev = "";
            continue;
        }
        else {
            sourceText.push(prev);
        }
        prev = a;
    }

    if (prev != "")
        sourceText.push(prev);

    if (targetLang == "") {
		// chrome-extension://klbibkeccnjlkjkiokjodocebajanakg/suspended.html#ttl=Windows%20Locales%20%7C%20SS64.com&pos=17926&uri=https://ss64.com/locale.html
        var wsh = new ActiveXObject("WScript.Shell");
        var SystemRoot = wsh.Environment("PROCESS").Item("SystemRoot")
        var command = "\""+SystemRoot+"\\System32\\WindowsPowerShell\\v1.0\\powershell.exe\" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command \"[cultureinfo]::GetCultures('NeutralCultures,SpecificCultures') | where {$_.LCID -eq 1046} | select IetfLanguageTag\"";
        var oExec = wsh.Exec(command);
        var strOutput = oExec.StdOut.ReadAll();
        targetLang = strOutput.split("\n")[3];
    }
 

    var url = "https://translate.googleapis.com/translate_a/single?"
              +"client="+"gtx"+"&"
              +"sl="+sourceLang+"&"
              +"tl="+targetLang+"&"
              +"dt="+"t"+"&"
              +"q="+encodeURI(sourceText.join("\n"));
//WScript.Echo(url);
//return;
    var baseURL = url;
    var xmlHttpRequest = new ActiveXObject("MSXML2.ServerXMLHTTP.3.0");
    xmlHttpRequest.setOption(2,13056); // Ignore SSL error
    xmlHttpRequest.open("GET", baseURL, false);
    xmlHttpRequest.setRequestHeader("User-Agent","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36");
    xmlHttpRequest.send();

    // example response:
    // [
    //   [
    //     [
    //       "Algo para traduzir!\n",
    //       "Something to translate!\n",
    //       null,
    //       null,
    //       3
    //     ],
    //     [
    //       "Algo mais",
    //       "Anything else",
    //       null,
    //       null,
    //       1
    //     ]
    //   ],
    //   null,
    //   "en",
    //   null,
    //   null,
    //   null,
    //   1,
    //   null,
    //   [
    //     [
    //       "en"
    //     ],
    //     null,
    //     [
    //       1
    //     ],
    //     [
    //       "en"
    //     ]
    //   ]
    // ]

    var htmlfile = WSH.CreateObject('htmlfile');
    htmlfile.write('<meta http-equiv="x-ua-compatible" content="IE=9" />');
    var JSON = htmlfile.parentWindow.JSON;
    htmlfile.close();
    var json = JSON.parse(xmlHttpRequest.responseText);
//WScript.Echo(JSON.stringify(json, null, 2));
    for (var i = 0; i < json[0].length; i++)
        WScript.Echo(json[0][i][0].toString().replace(/^\s+|\s+$/g, ''));
}(this));