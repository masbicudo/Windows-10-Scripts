@ECHO OFF
SETLOCAL
SET "user_agent=User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36"
SET "text=Something%%20to%%20be%%20translated"
SET source_lang=auto
SET target_lang=pt-BR
curl -H "%user_agent%" -v "https://translate.googleapis.com/translate_a/single?client=gtx&sl=%source_lang%&tl=%target_lang%&dt=t&q=%text%"
SET user_agent=
