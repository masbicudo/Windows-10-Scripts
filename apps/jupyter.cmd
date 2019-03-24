call require apps\choco.cmd
call require apps\python.cmd

:: NOTE: cannot install latest because of this bug:
:: - https://github.com/jupyter/help/issues/537
:: - https://github.com/jupyter/notebook/issues/4467

::conda install -y jupyter
conda install -y -c anaconda notebook=5.7.4

call set-where where_jupyter "jupyter"
shortcut-create "%where_shortcuts%\jn.lnk" "%where_jupyter%" -wd "" -a notebook

conda install -y -c "conda-forge" jupyter_contrib_nbextensions
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

:: nbstripout
conda install -y -c conda-forge nbstripout

:: jupyter debugger
pip install pixiedust
pip install log_progress