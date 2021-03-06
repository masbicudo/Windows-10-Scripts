@ECHO OFF

::Common colors
if /i "%1"=="" call :common

:args_loop

  if /i "%1"=="" goto :eof

  ::Simple colors (Abbreviations)
  if /i "%1"=="Abbr" call :abbr

  ::ISO (Abbreviations)
  if /i "%1"=="Iso-Abbr" call :iso_abbr

  ::Yonex Color Chart (Abbreviations)
  if /i "%1"=="Yonex-Abbr" call :yon_abbr

  ::Yonex Color Chart
  if /i "%1"=="Yandex" call :yan

  ::Yonex Color Chart
  if /i "%1"=="Yonex" call :yon

  ::Web Colors
  if /i "%1"=="Web" (
    call :webred
    call :weborange
    call :webyellow
    call :webgreen
    call :webcyan
    call :webblue
    call :webpurple
    call :webpink
    call :webwhite
    call :webgray
    call :webbrown
  )

  if /i "%1"=="webred" call :webred
  if /i "%1"=="weborange" call :weborange
  if /i "%1"=="webyellow" call :webyellow
  if /i "%1"=="webgreen" call :webgreen
  if /i "%1"=="webcyan" call :webcyan
  if /i "%1"=="webblue" call :webblue
  if /i "%1"=="webpurple" call :webpurple
  if /i "%1"=="webpink" call :webpink
  if /i "%1"=="webwhite" call :webwhite
  if /i "%1"=="webgray" call :webgray
  if /i "%1"=="webbrown" call :webbrown

  if /i "%1"=="common" call :common
  
  if /i "%1"=="all-abbr" (
    call :yon_abbr
    call :iso_abbr
    call :abbr
    goto :eof
  )

  if /i "%1"=="all" (
    call :yon
    call :yan
    call :webred
    call :weborange
    call :webyellow
    call :webgreen
    call :webcyan
    call :webblue
    call :webpurple
    call :webpink
    call :webwhite
    call :webgray
    call :webbrown
    call :yon_abbr
    call :iso_abbr
    call :abbr
    call :common
    goto :eof
  )

  shift

goto :args_loop

::Yandex ( https://gurov.github.io/yandex-colors/index.html )

:yan
  SET "yan_black=[38;2;0;0;0m"
  SET "yan_navy_blue=[38;2;0;0;0m"
  SET "yan_blue=[38;2;0;0;0m"
  SET "yan_prussian_blue=[38;2;0;0;0m"
  SET "yan_midnight_blue=[38;2;0;0;0m"
  SET "yan_powder_blue=[38;2;0;0;0m"
  SET "yan_cobalt=[38;2;0;0;0m"
  SET "yan_cerulean_grey=[38;2;0;0;0m"
  SET "yan_azure=[38;2;0;0;0m"
  SET "yan_teal=[38;2;0;0;0m"
  SET "yan_bondi_blue=[38;2;0;0;0m"
  SET "yan_jade=[38;2;0;0;0m"
  SET "yan_robin_egg_blue=[38;2;0;0;0m"
  SET "yan_aqua=[38;2;0;0;0m"
  SET "yan_green=[38;2;0;0;0m"
  SET "yan_spring_green=[38;2;0;0;0m"
  SET "yan_cyan=[38;2;0;0;0m"
  SET "yan_dark_green=[38;2;1;1;1m"
  SET "yan_pine_green=[38;2;1;1;1m"
  SET "yan_dark_pastel_green=[38;2;3;3;3m"
  SET "yan_sapphire=[38;2;8;8;8m"
  SET "yan_dark_cerulean=[38;2;8;8;8m"
  SET "yan_bright_turquoise=[38;2;8;8;8m"
  SET "yan_malachite=[38;2;11;11;11m"
  SET "yan_dark_turquoise=[38;2;17;17;17m"
  SET "yan_ultramarine=[38;2;18;18;18m"
  SET "yan_denim=[38;2;21;21;21m"
  SET "yan_dark_spring_green=[38;2;23;23;23m"
  SET "yan_moray=[38;2;28;28;28m"
  SET "yan_dodger_blue=[38;2;30;30;30m"
  SET "yan_cerulean_blue=[38;2;42;42;42m"
  SET "yan_sea_green=[38;2;46;46;46m"
  SET "yan_dark_slate_gray=[38;2;47;47;47m"
  SET "yan_turquoise=[38;2;48;48;48m"
  SET "yan_dark_indigo=[38;2;49;49;49m"
  SET "yan_klein_blue=[38;2;58;58;58m"
  SET "yan_bistre=[38;2;61;61;61m"
  SET "yan_royal_blue=[38;2;65;65;65m"
  SET "yan_dark_violet=[38;2;66;66;66m"
  SET "yan_light_blue=[38;2;66;66;66m"
  SET "yan_coffee=[38;2;68;68;68m"
  SET "yan_fulvous=[38;2;69;69;69m"
  SET "yan_anthracite=[38;2;70;70;70m"
  SET "yan_gray_asparagus=[38;2;70;70;70m"
  SET "yan_steel_blue=[38;2;70;70;70m"
  SET "yan_indigo=[38;2;75;75;75m"
  SET "yan_dark_khaki=[38;2;76;76;76m"
  SET "yan_marengo=[38;2;76;76;76m"
  SET "yan_fern_green=[38;2;79;79;79m"
  SET "yan_wet_asphalt=[38;2;80;80;80m"
  SET "yan_emerald=[38;2;80;80;80m"
  SET "yan_dark_olive=[38;2;85;85;85m"
  SET "yan_dark_scarlet=[38;2;86;86;86m"
  SET "yan_grass=[38;2;93;93;93m"
  SET "yan_cornflower_blue=[38;2;100;100;100m"
  SET "yan_dark_brown=[38;2;101;101;101m"
  SET "yan_plum=[38;2;102;102;102m"
  SET "yan_purple=[38;2;102;102;102m"
  SET "yan_persian_blue=[38;2;102;102;102m"
  SET "yan_bright_green=[38;2;102;102;102m"
  SET "yan_olive_drab=[38;2;107;107;107m"
  SET "yan_sepia=[38;2;112;112;112m"
  SET "yan_slate_gray=[38;2;112;112;112m"
  SET "yan_umber=[38;2;115;115;115m"
  SET "yan_russet=[38;2;117;117;117m"
  SET "yan_pale_green=[38;2;119;119;119m"
  SET "yan_camouflage_green=[38;2;120;120;120m"
  SET "yan_cinnamon=[38;2;123;123;123m"
  SET "yan_fainted_frog=[38;2;123;123;123m"
  SET "yan_asparagus=[38;2;123;123;123m"
  SET "yan_electric=[38;2;125;125;125m"
  SET "yan_sky=[38;2;127;127;127m"
  SET "yan_viridian=[38;2;127;127;127m"
  SET "yan_aquamarine=[38;2;127;127;127m"
  SET "yan_maroon=[38;2;128;128;128m"
  SET "yan_khaki=[38;2;128;128;128m"
  SET "yan_olive=[38;2;128;128;128m"
  SET "yan_gray=[38;2;128;128;128m"
  SET "yan_brick=[38;2;136;136;136m"
  SET "yan_burnt_umber=[38;2;138;138;138m"
  SET "yan_violet=[38;2;139;139;139m"
  SET "yan_burgundy=[38;2;144;144;144m"
  SET "yan_terracotta=[38;2;144;144;144m"
  SET "yan_dark_tan=[38;2;145;145;145m"
  SET "yan_sanguine=[38;2;146;146;146m"
  SET "yan_carmine=[38;2;150;150;150m"
  SET "yan_brown=[38;2;150;150;150m"
  SET "yan_dark_chestnut=[38;2;152;152;152m"
  SET "yan_pale_brown=[38;2;152;152;152m"
  SET "yan_mint_green=[38;2;152;152;152m"
  SET "yan_eggplant=[38;2;153;153;153m"
  SET "yan_violet_eggplant=[38;2;153;153;153m"
  SET "yan_mauve=[38;2;153;153;153m"
  SET "yan_pale_mauve=[38;2;153;153;153m"
  SET "yan_amethyst=[38;2;153;153;153m"
  SET "yan_mountbatten_pink=[38;2;153;153;153m"
  SET "yan_chartreuse=[38;2;153;153;153m"
  SET "yan_wine_red=[38;2;155;155;155m"
  SET "yan_pale_cornflower_blue=[38;2;171;171;171m"
  SET "yan_swamp_green=[38;2;172;172;172m"
  SET "yan_celadon=[38;2;172;172;172m"
  SET "yan_moss_green=[38;2;173;173;173m"
  SET "yan_green_yellow=[38;2;173;173;173m"
  SET "yan_pale_carmine=[38;2;175;175;175m"
  SET "yan_pale_blue=[38;2;175;175;175m"
  SET "yan_brass=[38;2;181;181;181m"
  SET "yan_rust=[38;2;183;183;183m"
  SET "yan_copper=[38;2;184;184;184m"
  SET "yan_dark_goldenrod=[38;2;184;184;184m"
  SET "yan_dark_tea_green=[38;2;186;186;186m"
  SET "yan_light_grey=[38;2;187;187;187m"
  SET "yan_pistachio=[38;2;190;190;190m"
  SET "yan_silver=[38;2;192;192;192m"
  SET "yan_cardinal=[38;2;196;196;196m"
  SET "yan_red_violet=[38;2;199;199;199m"
  SET "yan_pang=[38;2;199;199;199m"
  SET "yan_lilac=[38;2;200;200;200m"
  SET "yan_wisteria=[38;2;201;201;201m"
  SET "yan_gray_tea_green=[38;2;202;202;202m"
  SET "yan_burnt_orange=[38;2;204;204;204m"
  SET "yan_ochre=[38;2;204;204;204m"
  SET "yan_puce=[38;2;204;204;204m"
  SET "yan_periwinkle=[38;2;204;204;204m"
  SET "yan_lime=[38;2;204;204;204m"
  SET "yan_bright_violet=[38;2;205;205;205m"
  SET "yan_tenne=[38;2;205;205;205m"
  SET "yan_dark_coral=[38;2;205;205;205m"
  SET "yan_chestnut=[38;2;205;205;205m"
  SET "yan_bronze=[38;2;205;205;205m"
  SET "yan_light_brown=[38;2;205;205;205m"
  SET "yan_old_gold=[38;2;207;207;207m"
  SET "yan_tea_green=[38;2;208;208;208m"
  SET "yan_chocolate=[38;2;210;210;210m"
  SET "yan_tan=[38;2;210;210;210m"
  SET "yan_titian=[38;2;213;213;213m"
  SET "yan_cherry=[38;2;214;214;214m"
  SET "yan_reddish_brown=[38;2;215;215;215m"
  SET "yan_dark_pear=[38;2;216;216;216m"
  SET "yan_thistle=[38;2;216;216;216m"
  SET "yan_orchid=[38;2;218;218;218m"
  SET "yan_goldenrod=[38;2;218;218;218m"
  SET "yan_pale_red_violet=[38;2;219;219;219m"
  SET "yan_crimson=[38;2;220;220;220m"
  SET "yan_pale_chestnut=[38;2;221;221;221m"
  SET "yan_cerise=[38;2;222;222;222m"
  SET "yan_heliotrope=[38;2;223;223;223m"
  SET "yan_siena=[38;2;226;226;226m"
  SET "yan_alizarin=[38;2;227;227;227m"
  SET "yan_gamboge=[38;2;228;228;228m"
  SET "yan_lavender=[38;2;230;230;230m"
  SET "yan_dark_pink=[38;2;231;231;231m"
  SET "yan_burnt_siena=[38;2;233;233;233m"
  SET "yan_dark_salmon=[38;2;233;233;233m"
  SET "yan_dark_tangerine=[38;2;234;234;234m"
  SET "yan_violaceous=[38;2;234;234;234m"
  SET "yan_zinnwaldite=[38;2;235;235;235m"
  SET "yan_flax=[38;2;238;238;238m"
  SET "yan_pear=[38;2;239;239;239m"
  SET "yan_buff=[38;2;240;240;240m"
  SET "yan_cream=[38;2;242;242;242m"
  SET "yan_light_cream=[38;2;242;242;242m"
  SET "yan_carrot=[38;2;243;243;243m"
  SET "yan_saffron=[38;2;244;244;244m"
  SET "yan_wheat=[38;2;245;245;245m"
  SET "yan_beige=[38;2;245;245;245m"
  SET "yan_fuchsia=[38;2;247;247;247m"
  SET "yan_childs_surprise=[38;2;247;247;247m"
  SET "yan_pale_magenta=[38;2;249;249;249m"
  SET "yan_pale_pink=[38;2;250;250;250m"
  SET "yan_peach_yellow=[38;2;250;250;250m"
  SET "yan_scared_nymph=[38;2;250;250;250m"
  SET "yan_linen=[38;2;250;250;250m"
  SET "yan_corn=[38;2;251;251;251m"
  SET "yan_hot_pink=[38;2;252;252;252m"
  SET "yan_sandy_brown=[38;2;252;252;252m"
  SET "yan_lemon=[38;2;253;253;253m"
  SET "yan_pale_sandy_brown=[38;2;253;253;253m"
  SET "yan_red=[38;2;255;255;255m"
  SET "yan_carmine_red=[38;2;255;255;255m"
  SET "yan_magenta=[38;2;255;255;255m"
  SET "yan_scarlet=[38;2;255;255;255m"
  SET "yan_vermilion=[38;2;255;255;255m"
  SET "yan_international_orange=[38;2;255;255;255m"
  SET "yan_pumpkin=[38;2;255;255;255m"
  SET "yan_coral=[38;2;255;255;255m"
  SET "yan_tangerine=[38;2;255;255;255m"
  SET "yan_salmon=[38;2;255;255;255m"
  SET "yan_safety_orange=[38;2;255;255;255m"
  SET "yan_pink_orange=[38;2;255;255;255m"
  SET "yan_orange=[38;2;255;255;255m"
  SET "yan_selective_yellow=[38;2;255;255;255m"
  SET "yan_amber=[38;2;255;255;255m"
  SET "yan_pink=[38;2;255;255;255m"
  SET "yan_yandex=[38;2;255;255;255m"
  SET "yan_peach_orange=[38;2;255;255;255m"
  SET "yan_gold=[38;2;255;255;255m"
  SET "yan_school_bus_yellow=[38;2;255;255;255m"
  SET "yan_dark_peach=[38;2;255;255;255m"
  SET "yan_mustard=[38;2;255;255;255m"
  SET "yan_navajo_white=[38;2;255;255;255m"
  SET "yan_yellow_pink=[38;2;255;255;255m"
  SET "yan_peach=[38;2;255;255;255m"
  SET "yan_papaya_whip=[38;2;255;255;255m"
  SET "yan_lavender_blush=[38;2;255;255;255m"
  SET "yan_seashell=[38;2;255;255;255m"
  SET "yan_lemon_cream=[38;2;255;255;255m"
  SET "yan_ivory=[38;2;255;255;255m"
  SET "yan_yellow=[38;2;255;255;255m"
  SET "yan_white=[38;2;255;255;255m"
goto :eof

::Simple colors (Abbreviations)

:abbr
  SET R=[91m
  SET G=[92m
  SET Y=[93m
  SET B=[94m
  SET M=[95m
  SET C=[96m
  SET W=[97m
  SET N=[0m
  
  SET K=[90m

  SET LK=[90m
  SET LR=[91m
  SET LG=[92m
  SET LY=[93m
  SET LB=[94m
  SET LM=[95m
  SET LC=[96m
  SET LW=[97m

  SET DK=[30m
  SET DR=[31m
  SET DG=[32m
  SET DY=[33m
  SET DB=[34m
  SET DM=[35m
  SET DC=[36m
  SET DW=[37m
goto :eof

::ISO (Abbreviations)

:iso_abbr
  SET BK=[38;2;0;0;0m
  SET BN=[38;2;128;84;47m
  SET RD=[38;2;171;37;36m
  SET OG=[38;2;250;132;43m
  SET YE=[38;2;238;201;0m
  SET GN=[38;2;72;164;63m
  SET BU=[38;2;40;116;178m
  SET VT=[38;2;131;99;157m
  SET GY=[38;2;126;139;146m
  SET WH=[38;2;255;255;255m
  SET PK=[38;2;215;160;166m
  SET TK=[38;2;129;192;187m
goto :eof

::Yonex Color Chart (Abbreviations) ( http://shuttle-house.com/page_top_ENGLISH/Guide/color_chart.html )

:yon_abbr
  set "R=[38;2;255;0;0m"
  set "BL=[38;2;0;0;187m"
  set "G=[38;2;0;128;0m"
  set "Y=[38;2;255;255;0m"
  set "OR=[38;2;239;129;15m"
  set "BK=[38;2;0;0;0m"
  set "LG=[38;2;50;205;50m"
  set "IV=[38;2;221;222;211m"
  set "GR=[38;2;113;120;110m"
  set "AM=[38;2;214;182;65m"
  set "PW=[38;2;196;197;182m"
  set "BR=[38;2;109;76;51m"
  set "GO=[38;2;248;199;1m"
  set "SI=[38;2;136;146;141m"
  set "SB=[38;2;0;195;207m"
  set "NB=[38;2;16;48;132m"
  set "WI=[38;2;112;0;61m"
  set "LV=[38;2;91;145;242m"
  set "SG=[38;2;164;164;164m"
  set "PE=[38;2;220;140;160m"
  set "P=[38;2;200;140;180m"
  set "SX=[38;2;70;72;184m"
  set "LTG=[38;2;44;209;175m"
  set "SE=[38;2;20;15;7m"
  :: DarkGreen was DC in the original index, but DarknessCharcoal was DC too
  set "DG=[38;2;0;47;0m"
  set "LB=[38;2;3;177;121m"
  set "MEGT=[38;2;0;255;153m"
  set "MB=[38;2;2;159;212m"
  set "CGR=[38;2;37;52;56m"
  set "WR=[38;2;128;39;63m"
  set "MU=[38;2;226;184;38m"
  set "PU=[38;2;38;0;140m"
  set "DBR=[38;2;128;0;0m"
  set "SP=[38;2;235;164;149m"
  set "EM=[38;2;0;89;38m"
  set "VI=[38;2;51;25;229m"
  set "CR=[38;2;255;232;175m"
  set "LY=[38;2;217;202;0m"
  set "PM=[38;2;100;39;76m"
  set "WG=[38;2;178;178;151m"
  set "CB=[38;2;41;113;182m"
  set "COB=[38;2;0;153;255m"
  set "RB=[38;2;19;68;157m"
  set "MEB=[38;2;200;202;225m"
  set "C=[38;2;41;40;41m"
  set "PG=[38;2;222;214;198m"
  set "MEBK=[38;2;41;32;35m"
  set "AB=[38;2;0;183;223m"
  :: DarkBlue was DBR in the original index, but DarkBrown was DBR too
  set "DB=[38;2;0;0;139m"
  :: InkBlue was IBL in the original index, but IndigoBlue was IBL too
  set "IKBL=[38;2;14;27;60m"
  set "BPU=[38;2;178;0;255m"
  set "BB=[38;2;25;51;140m"
  set "MER=[38;2;238;79;111m"
  set "BP=[38;2;253;50;239m"
  set "ROP=[38;2;238;142;160m"
  set "RUP=[38;2;254;39;128m"
  set "FP=[38;2;255;50;95m"
  set "MIG=[38;2;0;145;92m"
  set "BG=[38;2;0;197;150m"
  set "MS=[38;2;90;199;41m"
  set "RG=[38;2;33;162;123m"
  set "LBR=[38;2;206;110;64m"
  set "MEGR=[38;2;172;203;195m"
  set "DGR=[38;2;63;70;70m"
  set "SAB=[38;2;210;147;93m"
  set "BE=[38;2;159;130;87m"
  set "LGR=[38;2;244;236;248m"
  set "OL=[38;2;153;153;0m"
  set "MHG=[38;2;31;39;31m"
  set "BY=[38;2;239;254;154m"
  set "BO=[38;2;200;57;41m"
  set "TQ=[38;2;64;224;208m"
  set "FBL=[38;2;42;70;145m"
  set "LPU=[38;2;206;117;223m"
  set "PBL=[38;2;0;110;123m"
  set "BLGR=[38;2;103;117;126m"
  set "IBL=[38;2;54;127;159m"
  set "MN=[38;2;0;0;51m"
  set "MOC=[38;2;71;78;69m"
  set "CM=[38;2;149;92;58m"
  set "BZ=[38;2;122;89;47m"
  set "ABK=[38;2;79;32;35m"
  set "PMT=[38;2;136;179;110m"
  set "K=[38;2;66;63;21m"
  set "OM=[38;2;228;215;194m"
  set "CMGO=[38;2;244;215;175m"
  set "SDBE=[38;2;165;150;123m"
  set "MO=[38;2;168;107;65m"
  set "NOR=[38;2;255;123;44m"
  set "MBBL=[38;2;74;189;239m"
  set "LSX=[38;2;76;229;255m"
  set "OW=[38;2;255;255;230m"
  set "CL=[38;2;222;222;222m"
  set "NA=[38;2;255;250;210m"
  set "BRR=[38;2;187;13;2m"
  set "FUC=[38;2;255;0;255m"
  set "CP=[38;2;211;88;137m"
  set "LI=[38;2;213;132;224m"
  set "PO=[38;2;247;191;177m"
  set "YM=[38;2;217;142;25m"
  set "LTO=[38;2;255;174;90m"
  set "RE=[38;2;141;30;22m"
  set "SMR=[38;2;145;60;73m"
  set "DR=[38;2;139;0;0m"
  set "DPU=[38;2;107;14;104m"
  set "OLGR=[38;2;119;113;119m"
  set "MDGR=[38;2;90;113;116m"
  set "DP=[38;2;231;33;82m"
  set "CLBK=[38;2;90;90;99m"
  set "NEWR=[38;2;221;17;0m"
  set "NEWBU=[38;2;85;89;159m"
  set "NEWG=[38;2;99;181;107m"
  set "NEWOR=[38;2;252;74;48m"
  set "NEWTQ=[38;2;104;187;201m"
  set "DWI=[38;2;103;45;50m"
  set "GRG=[38;2;91;164;162m"
  set "OLG=[38;2;23;69;20m"
  set "DEG=[38;2;16;73;41m"
  set "GRNB=[38;2;51;68;136m"
  set "GRBEN=[38;2;205;222;231m"
  set "GRM=[38;2;148;132;148m"
  set "BEM=[38;2;172;158;152m"
  set "DGU=[38;2;63;70;70m"
  set "GT=[38;2;69;50;46m"
  set "LTY=[38;2;255;255;224m"
  set "SOY=[38;2;255;250;195m"
  set "LM=[38;2;0;255;0m"
  set "WGR=[38;2;195;195;189m"
  set "COR=[38;2;204;51;0m"
  set "CHP=[38;2;233;215;163m"
  set "RTR=[38;2;145;23;38m"
  set "COP=[38;2;244;210;204m"
  set "AQA=[38;2;0;255;255m"
  set "GRP=[38;2;247;226;0m"
  set "GRB=[38;2;196;206;208m"
  set "PP=[38;2;206;142;156m"
  set "PRO=[38;2;238;157;189m"
  set "ICB=[38;2;178;229;242m"
  set "CTG=[38;2;143;163;74m"
  set "RTBK=[38;2;119;69;36m"
  set "SIM=[38;2;214;210;208m"
  set "WAR=[38;2;186;56;79m"
  set "AGR=[38;2;143;143;143m"
  set "COOR=[38;2;247;190;107m"
  set "PRLGW=[38;2;206;40;44m"
  set "VBL=[38;2;98;217;225m"
  set "DM=[38;2;35;36;40m"
  set "LOL=[38;2;201;211;197m"
  set "PY=[38;2;255;255;0m"
  set "ICGR=[38;2;216;219;222m"
  set "MG=[38;2;204;0;204m"
  set "DOL=[38;2;85;107;47m"
  set "SP_HB=[38;2;0;76;97m"
  set "RBYR=[38;2;185;11;80m"
  set "MNPA=[38;2;87;77;88m"
  set "MBFP=[38;2;255;222;255m"
  set "MBSX=[38;2;206;222;255m"
  set "PLG=[38;2;206;213;172m"
  set "LBE=[38;2;255;232;181m"
  set "CA=[38;2;205;48;48m"
  set "PK=[38;2;255;63;0m"
  set "SF=[38;2;247;158;33m"
  set "INB=[38;2;0;51;102m"
  set "MPU=[38;2;230;204;230m"
  set "SMC=[38;2;85;121;145m"
  set "FLG=[38;2;20;230;74m"
  set "BRBK=[38;2;0;0;1m"
  set "JPR=[38;2;144;37;29m"
  set "DIR=[38;2;206;40;41m"
  set "AMB=[38;2;77;26;230m"
  set "PLY=[38;2;246;225;134m"
  set "SHO=[38;2;231;138;132m"
  set "GN=[38;2;159;172;178m"
  set "CTO=[38;2;235;168;75m"
  set "SMBL=[38;2;85;119;145m"
  set "SK=[38;2;110;190;205m"
  set "PDBL=[38;2;160;175;232m"
  set "PDG=[38;2;181;210;130m"
  set "MAOR=[38;2;255;83;43m"
  set "GM=[38;2;98;86;86m"
  set "MT=[38;2;104;152;112m"
  set "BD=[38;2;35;0;10m"
  set "PSD=[38;2;102;102;102m"
  set "OK=[38;2;227;165;98m"
  set "SHIY=[38;2;255;245;0m"
  set "FRBL=[38;2;187;201;209m"
  set "DPR=[38;2;160;41;95m"
  set "IRG=[38;2;126;144;154m"
  set "MBL=[38;2;114;229;204m"
  :: MistoPink was MPU in the original index, but MistPurple was MPU too
  set "MPI=[38;2;232;158;183m"
  set "FY=[38;2;241;232;157m"
  set "MSI=[38;2;214;198;189m"
  set "PDP=[38;2;246;228;224m"
  set "DES=[38;2;99;78;109m"
  set "PLP=[38;2;195;112;122m"
  set "MR=[38;2;16;90;172m"
  set "DSK=[38;2;0;191;255m"
  set "MUP=[38;2;249;192;211m"
  set "AMT=[38;2;0;203;195m"
  set "FAO=[38;2;232;109;29m"
  set "PLB=[38;2;77;188;192m"
  set "MEW=[38;2;240;239;234m"
  set "SHIS=[38;2;129;129;129m"
  set "ASH=[38;2;196;202;207m"
  set "SW=[38;2;240;240;240m"
  set "SSO=[38;2;223;147;32m"
  set "CTY=[38;2;234;168;75m"
  set "AP=[38;2;216;159;109m"
  set "BGD=[38;2;102;0;0m"
  set "CBL=[38;2;6;88;190m"
  set "CY=[38;2;239;208;22m"
  set "DOR=[38;2;255;140;0m"
  set "DC=[38;2;87;78;81m"
  :: LightPink was LPU in the original index, but LightPurple was LPU too
  set "LPI=[38;2;255;182;193m"
  set "LFG=[38;2;109;224;81m"
  set "ICBE=[38;2;217;192;181m"
  set "RO=[38;2;255;0;55m"
  set "IMR=[38;2;60;51;82m"
goto :eof

::Yonex Color Chart ( http://shuttle-house.com/page_top_ENGLISH/Guide/color_chart.html )

:yon
  set "yon_red=[38;2;255;0;0m"
  set "yon_blue=[38;2;0;0;187m"
  set "yon_green=[38;2;0;128;0m"
  set "yon_yellow=[38;2;255;255;0m"
  set "yon_orange=[38;2;239;129;15m"
  set "yon_black=[38;2;0;0;0m"
  set "yon_limegreen=[38;2;50;205;50m"
  set "yon_ivory=[38;2;221;222;211m"
  set "yon_gray=[38;2;113;120;110m"
  set "yon_american=[38;2;214;182;65m"
  set "yon_pearlwhite=[38;2;196;197;182m"
  set "yon_brown=[38;2;109;76;51m"
  set "yon_gold=[38;2;248;199;1m"
  set "yon_silver=[38;2;136;146;141m"
  set "yon_skyblue=[38;2;0;195;207m"
  set "yon_navyblue=[38;2;16;48;132m"
  set "yon_wine=[38;2;112;0;61m"
  set "yon_lavender=[38;2;91;145;242m"
  set "yon_silvergray=[38;2;164;164;164m"
  set "yon_peach=[38;2;220;140;160m"
  set "yon_pink=[38;2;200;140;180m"
  set "yon_sax=[38;2;70;72;184m"
  set "yon_lightgreen=[38;2;44;209;175m"
  set "yon_sepia=[38;2;20;15;7m"
  set "yon_darkgreen=[38;2;0;47;0m"
  set "yon_lightblue=[38;2;3;177;121m"
  set "yon_metallicgreen=[38;2;0;255;153m"
  set "yon_marineblue=[38;2;2;159;212m"
  set "yon_charcoalgray=[38;2;37;52;56m"
  set "yon_winered=[38;2;128;39;63m"
  set "yon_mustard=[38;2;226;184;38m"
  set "yon_purple=[38;2;38;0;140m"
  set "yon_darkbrown=[38;2;128;0;0m"
  set "yon_salmonpink=[38;2;235;164;149m"
  set "yon_emerald=[38;2;0;89;38m"
  set "yon_violet=[38;2;51;25;229m"
  set "yon_cream=[38;2;255;232;175m"
  set "yon_lemonyellow=[38;2;217;202;0m"
  set "yon_plum=[38;2;100;39;76m"
  set "yon_watergreen=[38;2;178;178;151m"
  set "yon_crystalblue=[38;2;41;113;182m"
  set "yon_cobaltblue=[38;2;0;153;255m"
  set "yon_royalblue=[38;2;19;68;157m"
  set "yon_metallicblue=[38;2;200;202;225m"
  set "yon_charcoal=[38;2;41;40;41m"
  set "yon_platinumgold=[38;2;222;214;198m"
  set "yon_metallicblack=[38;2;41;32;35m"
  set "yon_aquabule=[38;2;0;183;223m"
  set "yon_darkblue=[38;2;0;0;139m"
  set "yon_inkblue=[38;2;14;27;60m"
  set "yon_bluepurple=[38;2;178;0;255m"
  set "yon_blueberry=[38;2;25;51;140m"
  set "yon_metallicred=[38;2;238;79;111m"
  set "yon_blightpink=[38;2;253;50;239m"
  set "yon_rosepink=[38;2;238;142;160m"
  set "yon_rougepink=[38;2;254;39;128m"
  set "yon_frenchpink=[38;2;255;50;95m"
  set "yon_mintgreen=[38;2;0;145;92m"
  set "yon_blightgreen=[38;2;0;197;150m"
  set "yon_muscat=[38;2;90;199;41m"
  set "yon_royalgreen=[38;2;33;162;123m"
  set "yon_lightbrown=[38;2;206;110;64m"
  set "yon_metallicgray=[38;2;172;203;195m"
  set "yon_darkgray=[38;2;63;70;70m"
  set "yon_sable=[38;2;210;147;93m"
  set "yon_beige=[38;2;159;130;87m"
  set "yon_lightgray=[38;2;244;236;248m"
  set "yon_olive=[38;2;153;153;0m"
  set "yon_mahogany=[38;2;31;39;31m"
  set "yon_blightyellow=[38;2;239;254;154m"
  set "yon_blightorange=[38;2;200;57;41m"
  set "yon_turquoise=[38;2;64;224;208m"
  set "yon_frenchblue=[38;2;42;70;145m"
  set "yon_lightpurple=[38;2;206;117;223m"
  set "yon_peacockblue=[38;2;0;110;123m"
  set "yon_bluegray=[38;2;103;117;126m"
  set "yon_indigoblue=[38;2;54;127;159m"
  set "yon_midnight=[38;2;0;0;51m"
  set "yon_mossgreen=[38;2;71;78;69m"
  set "yon_camel=[38;2;149;92;58m"
  set "yon_bronze=[38;2;122;89;47m"
  set "yon_ashgray=[38;2;79;32;35m"
  set "yon_peppermint=[38;2;136;179;110m"
  set "yon_khaki=[38;2;66;63;21m"
  set "yon_oatmeal=[38;2;228;215;194m"
  set "yon_camelgold=[38;2;244;215;175m"
  set "yon_sandbeige=[38;2;165;150;123m"
  set "yon_mocha=[38;2;168;107;65m"
  set "yon_neonorange=[38;2;255;123;44m"
  set "yon_marbleblue=[38;2;74;189;239m"
  set "yon_lightsax=[38;2;76;229;255m"
  set "yon_offwhite=[38;2;255;255;230m"
  set "yon_clear=[38;2;222;222;222m"
  set "yon_natural=[38;2;255;250;210m"
  set "yon_blightred=[38;2;187;13;2m"
  set "yon_fuchira=[38;2;255;0;255m"
  set "yon_cherrypink=[38;2;211;88;137m"
  set "yon_lilac=[38;2;213;132;224m"
  set "yon_paleorange=[38;2;247;191;177m"
  set "yon_japaneseyellowrose=[38;2;217;142;25m"
  set "yon_lightorange=[38;2;255;174;90m"
  set "yon_brick=[38;2;141;30;22m"
  set "yon_smokered=[38;2;145;60;73m"
  set "yon_darkred=[38;2;139;0;0m"
  set "yon_darkpurple=[38;2;107;14;104m"
  set "yon_olivegray=[38;2;119;113;119m"
  set "yon_middlegray=[38;2;90;113;116m"
  set "yon_darkpink=[38;2;231;33;82m"
  set "yon_clearblack=[38;2;90;90;99m"
  set "yon_newred=[38;2;221;17;0m"
  set "yon_newblue=[38;2;85;89;159m"
  set "yon_newgreen=[38;2;99;181;107m"
  set "yon_neworange=[38;2;252;74;48m"
  set "yon_newturquoise=[38;2;104;187;201m"
  set "yon_darkwine=[38;2;103;45;50m"
  set "yon_grayishgreen=[38;2;91;164;162m"
  set "yon_olivegreen=[38;2;23;69;20m"
  set "yon_deepgreen=[38;2;16;73;41m"
  set "yon_grayishnavy=[38;2;51;68;136m"
  set "yon_grayishblue=[38;2;205;222;231m"
  set "yon_heathergray=[38;2;148;132;148m"
  set "yon_heatherbeige=[38;2;172;158;152m"
  set "yon_darkgun=[38;2;63;70;70m"
  set "yon_grafight=[38;2;69;50;46m"
  set "yon_lightyellow=[38;2;255;255;224m"
  set "yon_softyellow=[38;2;255;250;195m"
  set "yon_lime=[38;2;0;255;0m"
  set "yon_warmgray=[38;2;195;195;189m"
  set "yon_copperorange=[38;2;204;51;0m"
  set "yon_champagne=[38;2;233;215;163m"
  set "yon_rustyred=[38;2;145;23;38m"
  set "yon_coralpink=[38;2;244;210;204m"
  set "yon_aqua=[38;2;0;255;255m"
  set "yon_grape=[38;2;247;226;0m"
  set "yon_grayishwhite=[38;2;196;206;208m"
  set "yon_pearlpink=[38;2;206;142;156m"
  set "yon_pearlrose=[38;2;238;157;189m"
  set "yon_iceblue=[38;2;178;229;242m"
  set "yon_citrusgreen=[38;2;143;163;74m"
  set "yon_lastblack=[38;2;119;69;36m"
  set "yon_heathersilver=[38;2;214;210;208m"
  set "yon_warmred=[38;2;186;56;79m"
  set "yon_ashgray=[38;2;143;143;143m"
  set "yon_coralorange=[38;2;247;190;107m"
  set "yon_pearlred=[38;2;206;40;44m"
  set "yon_venusblue=[38;2;98;217;225m"
  set "yon_darkmarine=[38;2;35;36;40m"
  set "yon_lightolive=[38;2;201;211;197m"
  set "yon_purpleyellow=[38;2;255;255;0m"
  set "yon_icegray=[38;2;216;219;222m"
  set "yon_magenta=[38;2;204;0;204m"
  set "yon_darkolive=[38;2;85;107;47m"
  set "yon_sapphireblue=[38;2;0;76;97m"
  set "yon_rubyred=[38;2;185;11;80m"
  set "yon_midnightpurple=[38;2;87;77;88m"
  set "yon_marblefrenchpink=[38;2;255;222;255m"
  set "yon_marblesax=[38;2;206;222;255m"
  set "yon_palegreen=[38;2;206;213;172m"
  set "yon_lightbeige=[38;2;255;232;181m"
  set "yon_camelot=[38;2;205;48;48m"
  set "yon_pumpkin=[38;2;255;63;0m"
  set "yon_saffron=[38;2;247;158;33m"
  set "yon_indigonavy=[38;2;0;51;102m"
  set "yon_mistpurple=[38;2;230;204;230m"
  set "yon_smokegreen=[38;2;85;121;145m"
  set "yon_freshgreen=[38;2;20;230;74m"
  set "yon_brilliantblack=[38;2;0;0;1m"
  set "yon_japanred=[38;2;144;37;29m"
  set "yon_diamondred=[38;2;206;40;41m"
  set "yon_americanblue=[38;2;77;26;230m"
  set "yon_paleyellow=[38;2;246;225;134m"
  set "yon_sherbetorange=[38;2;231;138;132m"
  set "yon_gun=[38;2;159;172;178m"
  set "yon_citrusorange=[38;2;235;168;75m"
  set "yon_smokeblue=[38;2;85;119;145m"
  set "yon_sky=[38;2;110;190;205m"
  set "yon_powderblue=[38;2;160;175;232m"
  set "yon_powdergreen=[38;2;181;210;130m"
  set "yon_mandarinorange=[38;2;255;83;43m"
  set "yon_gunmetallic=[38;2;98;86;86m"
  set "yon_mint=[38;2;104;152;112m"
  set "yon_bordeaux=[38;2;35;0;10m"
  set "yon_palesand=[38;2;102;102;102m"
  set "yon_oak=[38;2;227;165;98m"
  set "yon_shineyellow=[38;2;255;245;0m"
  set "yon_frostyblue=[38;2;187;201;209m"
  set "yon_deepred=[38;2;160;41;95m"
  set "yon_irongray=[38;2;126;144;154m"
  set "yon_mistoblue=[38;2;114;229;204m"
  set "yon_mistopink=[38;2;232;158;183m"
  set "yon_frenchyellow=[38;2;241;232;157m"
  set "yon_madsilver=[38;2;214;198;189m"
  set "yon_powderpink=[38;2;246;228;224m"
  set "yon_deepsee=[38;2;99;78;109m"
  set "yon_perpink=[38;2;195;112;122m"
  set "yon_marine=[38;2;16;90;172m"
  set "yon_deepsky=[38;2;0;191;255m"
  set "yon_maddepink=[38;2;249;192;211m"
  set "yon_aquamint=[38;2;0;203;195m"
  set "yon_finenessorange=[38;2;232;109;29m"
  set "yon_perblue=[38;2;77;188;192m"
  set "yon_metallicwhite=[38;2;240;239;234m"
  set "yon_shinesilver=[38;2;129;129;129m"
  set "yon_ash=[38;2;196;202;207m"
  set "yon_snowwhite=[38;2;240;240;240m"
  set "yon_sunsetorange=[38;2;223;147;32m"
  set "yon_citrusyellow=[38;2;234;168;75m"
  set "yon_apricot=[38;2;216;159;109m"
  set "yon_burgundy=[38;2;102;0;0m"
  set "yon_ceruleanblue=[38;2;6;88;190m"
  set "yon_cornyellow=[38;2;239;208;22m"
  set "yon_darknessorange=[38;2;255;140;0m"
  set "yon_darknesscharcoal=[38;2;87;78;81m"
  set "yon_lightpink=[38;2;255;182;193m"
  set "yon_leafgreen=[38;2;109;224;81m"
  set "yon_icebeige=[38;2;217;192;181m"
  set "yon_rose=[38;2;255;0;55m"
  set "yon_indigomarine=[38;2;60;51;82m"
goto :eof

::Web Colors

:webred
::Red colors
  set "web_lightsalmon=[38;2;255;160;122m"
  set "web_salmon=[38;2;250;128;114m"
  set "web_darksalmon=[38;2;233;150;122m"
  set "web_lightcoral=[38;2;240;128;128m"
  set "web_indianred=[38;2;205;92;92m"
  set "web_crimson=[38;2;220;20;60m"
  set "web_firebrick=[38;2;178;34;34m"
  set "web_red=[38;2;255;0;0m"
  set "web_darkred=[38;2;139;0;0m"
goto :eof

:weborange
::Orange colors
  set "web_coral=[38;2;255;127;80m"
  set "web_tomato=[38;2;255;99;71m"
  set "web_orangered=[38;2;255;69;0m"
  set "web_gold=[38;2;255;215;0m"
  set "web_orange=[38;2;255;165;0m"
  set "web_darkorange=[38;2;255;140;0m"
goto :eof

:webyellow
::Yellow colors
  set "web_lightyellow=[38;2;255;255;224m"
  set "web_lemonchiffon=[38;2;255;250;205m"
  set "web_lightgoldenrodyellow=[38;2;250;250;210m"
  set "web_papayawhip=[38;2;255;239;213m"
  set "web_moccasin=[38;2;255;228;181m"
  set "web_peachpuff=[38;2;255;218;185m"
  set "web_palegoldenrod=[38;2;238;232;170m"
  set "web_khaki=[38;2;240;230;140m"
  set "web_darkkhaki=[38;2;189;183;107m"
  set "web_yellow=[38;2;255;255;0m"
goto :eof

:webgreen
::Green colors
  set "web_lawngreen=[38;2;124;252;0m"
  set "web_chartreuse=[38;2;127;255;0m"
  set "web_limegreen=[38;2;50;205;50m"
  set "web_lime=[38;2;0;255;0m"
  set "web_forestgreen=[38;2;34;139;34m"
  set "web_green=[38;2;0;128;0m"
  set "web_darkgreen=[38;2;0;100;0m"
  set "web_greenyellow=[38;2;173;255;47m"
  set "web_yellowgreen=[38;2;154;205;50m"
  set "web_springgreen=[38;2;0;255;127m"
  set "web_mediumspringgreen=[38;2;0;250;154m"
  set "web_lightgreen=[38;2;144;238;144m"
  set "web_palegreen=[38;2;152;251;152m"
  set "web_darkseagreen=[38;2;143;188;143m"
  set "web_mediumseagreen=[38;2;60;179;113m"
  set "web_seagreen=[38;2;46;139;87m"
  set "web_olive=[38;2;128;128;0m"
  set "web_darkolivegreen=[38;2;85;107;47m"
  set "web_olivedrab=[38;2;107;142;35m"
goto :eof

:webcyan
::Cyan colors
  set "web_lightcyan=[38;2;224;255;255m"
  set "web_cyan=[38;2;0;255;255m"
  set "web_aqua=[38;2;0;255;255m"
  set "web_aquamarine=[38;2;127;255;212m"
  set "web_mediumaquamarine=[38;2;102;205;170m"
  set "web_paleturquoise=[38;2;175;238;238m"
  set "web_turquoise=[38;2;64;224;208m"
  set "web_mediumturquoise=[38;2;72;209;204m"
  set "web_darkturquoise=[38;2;0;206;209m"
  set "web_lightseagreen=[38;2;32;178;170m"
  set "web_cadetblue=[38;2;95;158;160m"
  set "web_darkcyan=[38;2;0;139;139m"
  set "web_teal=[38;2;0;128;128m"
goto :eof

:webblue
::Blue colors
  set "web_powderblue=[38;2;176;224;230m"
  set "web_lightblue=[38;2;173;216;230m"
  set "web_lightskyblue=[38;2;135;206;250m"
  set "web_skyblue=[38;2;135;206;235m"
  set "web_deepskyblue=[38;2;0;191;255m"
  set "web_lightsteelblue=[38;2;176;196;222m"
  set "web_dodgerblue=[38;2;30;144;255m"
  set "web_cornflowerblue=[38;2;100;149;237m"
  set "web_steelblue=[38;2;70;130;180m"
  set "web_royalblue=[38;2;65;105;225m"
  set "web_blue=[38;2;0;0;255m"
  set "web_mediumblue=[38;2;0;0;205m"
  set "web_darkblue=[38;2;0;0;139m"
  set "web_navy=[38;2;0;0;128m"
  set "web_midnightblue=[38;2;25;25;112m"
  set "web_mediumslateblue=[38;2;123;104;238m"
  set "web_slateblue=[38;2;106;90;205m"
  set "web_darkslateblue=[38;2;72;61;139m"
goto :eof

:webpurple
::Purple colors
  set "web_lavender=[38;2;230;230;250m"
  set "web_thistle=[38;2;216;191;216m"
  set "web_plum=[38;2;221;160;221m"
  set "web_violet=[38;2;238;130;238m"
  set "web_orchid=[38;2;218;112;214m"
  set "web_fuchsia=[38;2;255;0;255m"
  set "web_magenta=[38;2;255;0;255m"
  set "web_mediumorchid=[38;2;186;85;211m"
  set "web_mediumpurple=[38;2;147;112;219m"
  set "web_blueviolet=[38;2;138;43;226m"
  set "web_darkviolet=[38;2;148;0;211m"
  set "web_darkorchid=[38;2;153;50;204m"
  set "web_darkmagenta=[38;2;139;0;139m"
  set "web_purple=[38;2;128;0;128m"
  set "web_indigo=[38;2;75;0;130m"
goto :eof

:webpink
::Pink colors
  set "web_pink=[38;2;255;192;203m"
  set "web_lightpink=[38;2;255;182;193m"
  set "web_hotpink=[38;2;255;105;180m"
  set "web_deeppink=[38;2;255;20;147m"
  set "web_palevioletred=[38;2;219;112;147m"
  set "web_mediumvioletred=[38;2;199;21;133m"
goto :eof

:webwhite
::White colors
  set "web_white=[38;2;255;255;255m"
  set "web_snow=[38;2;255;250;250m"
  set "web_honeydew=[38;2;240;255;240m"
  set "web_mintcream=[38;2;245;255;250m"
  set "web_azure=[38;2;240;255;255m"
  set "web_aliceblue=[38;2;240;248;255m"
  set "web_ghostwhite=[38;2;248;248;255m"
  set "web_whitesmoke=[38;2;245;245;245m"
  set "web_seashell=[38;2;255;245;238m"
  set "web_beige=[38;2;245;245;220m"
  set "web_oldlace=[38;2;253;245;230m"
  set "web_floralwhite=[38;2;255;250;240m"
  set "web_ivory=[38;2;255;255;240m"
  set "web_antiquewhite=[38;2;250;235;215m"
  set "web_linen=[38;2;250;240;230m"
  set "web_lavenderblush=[38;2;255;240;245m"
  set "web_mistyrose=[38;2;255;228;225m"
goto :eof

:webgray
::Gray colors
  set "web_gainsboro=[38;2;220;220;220m"
  set "web_lightgray=[38;2;211;211;211m"
  set "web_silver=[38;2;192;192;192m"
  set "web_darkgray=[38;2;169;169;169m"
  set "web_gray=[38;2;128;128;128m"
  set "web_dimgray=[38;2;105;105;105m"
  set "web_lightslategray=[38;2;119;136;153m"
  set "web_slategray=[38;2;112;128;144m"
  set "web_darkslategray=[38;2;47;79;79m"
  set "web_black=[38;2;0;0;0m"
goto :eof

:webbrown
::Brown colors
  set "web_cornsilk=[38;2;255;248;220m"
  set "web_blanchedalmond=[38;2;255;235;205m"
  set "web_bisque=[38;2;255;228;196m"
  set "web_navajowhite=[38;2;255;222;173m"
  set "web_wheat=[38;2;245;222;179m"
  set "web_burlywood=[38;2;222;184;135m"
  set "web_tan=[38;2;210;180;140m"
  set "web_rosybrown=[38;2;188;143;143m"
  set "web_sandybrown=[38;2;244;164;96m"
  set "web_goldenrod=[38;2;218;165;32m"
  set "web_peru=[38;2;205;133;63m"
  set "web_chocolate=[38;2;210;105;30m"
  set "web_saddlebrown=[38;2;139;69;19m"
  set "web_sienna=[38;2;160;82;45m"
  set "web_brown=[38;2;165;42;42m"
  set "web_maroon=[38;2;128;0;0m"
goto :eof

::Common colors

:common
  set "dkgray=[90m"
  set "red=[91m"
  set "green=[92m"
  set "yellow=[93m"
  set "blue=[94m"
  set "magenta=[95m"
  set "cyan=[96m"
  set "white=[97m"

  set "black=[30m"
  set "dkred=[31m"
  set "dkgreen=[32m"
  set "dkyellow=[33m"
  set "dkblue=[34m"
  set "dkmagenta=[35m"
  set "dkcyan=[36m"
  set "gray=[37m"

  set "cdef=[0m"
goto :eof

