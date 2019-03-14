pip install jupyter
CALL set-where where_jupyter "jupyter"
CALL shortcut-create "%where_shortcuts%\jn.lnk" "%where_jupyter%" -wd "" -a notebook
pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --system
jupyter nbextensions_configurator enable --system
jupyter nbextension enable nbextensions_configurator/tree_tab/main
jupyter nbextension enable toc2/main
jupyter nbextension enable autosavetime/main
jupyter nbextension enable comment-uncomment/main
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable python-markdown/main
jupyter nbextension enable spellchecker/main
jupyter nbextension enable move_selected_cells/main
::jupyter nbextension enable some_ext
pip install nbstripout
:: jupyter debugger
pip install pixiedust
:: TODO: install other useful extenions
