#!/bin/bash
ver=v0.3.1

function set_colors {
  eval $(echo_colors "$@")
}

function echo_colors {
  local __NS
  local __temp

  [ ! -v NS_YAN ] && local NS_YAN=yan_
  [ ! -v NS_YON ] && local NS_YON=yon_
  [ ! -v NS_WEB ] && local NS_WEB=web_
  [ ! -v NS_ABBR ] && local NS_ABBR=
  [ ! -v NS_COM ] && local NS_COM=
  [ ! -v NS_ISO ] && local NS_ISO=
  [ ! -v NS_YON_ABBR ] && local NS_YON_ABBR=

  if [ "$#" = "0" ]
  then
    common
    return
  fi

  for i in "$@"
  do
    case $i in
      --ns=*)          __NS=${i#"--ns="}                       ; continue;;
      --ns-yandex=*)   local NS_YAN=${i#"--ns-yandex="}        ; continue;;
      --ns-yonex=*)    local NS_YON=${i#"--ns-yonex="}         ; continue;;
      --ns-web=*)      local NS_WEB=${i#"--ns-web="}           ; continue;;
      --ns-abbr=*)     local NS_ABBR=${i#"--ns-abbr="}         ; continue;;
      --ns-com=*)      local NS_COM=${i#"--ns-com="}           ; continue;;
      --ns-iso=*)      local NS_ISO=${i#"--ns-iso="}           ; continue;;
      --ns-yon-abbr=*) local NS_YON_ABBR=${i#"--ns-yon-abbr="} ; continue;;
      Abbr|abbr)
      abbr
      ;;
      Iso-Abbr|iso-abbr)
      iso_abbr
      ;;
      Yonex-Abbr|yonex-abbr)
      yon_abbr
      ;;
      Yandex|yandex)
      yan
      ;;
      Yonex|yonex)
      yon
      ;;
      Web|web)
      webred
      weborange
      webyellow
      webgreen
      webcyan
      webblue
      webpurple
      webpink
      webwhite
      webgray
      webbrown
      ;;
      Web-Red|WebRed|web-red|webred)
      webred
      ;;
      Web-Orange|WebOrange|web-orange|weborange)
      weborange
      ;;
      Web-Yellow|WebYellow|web-yellow|webyellow)
      webyellow
      ;;
      Web-Green|WebGreen|web-green|webgreen)
      webgreen
      ;;
      Web-Cyan|WebCyan|web-cyan|webcyan)
      webcyan
      ;;
      Web-Blue|WebBlue|web-blue|webblue)
      webblue
      ;;
      Web-Purple|WebPurple|web-purple|webpurple)
      webpurple
      ;;
      Web-Pink|WebPink|web-pink|webpink)
      webpink
      ;;
      Web-White|WebWhite|web-white|webwhite)
      webwhite
      ;;
      Web-Gray|WebGray|web-gray|webgray)
      webgray
      ;;
      Web-Brown|WebBrown|web-brown|webbrown)
      webbrown
      ;;
      Common|common)
      common
      ;;
      All|all)
      __temp="$__NS"
      __NS="$__temp""$NS_YAN" yan
      __NS="$__temp""$NS_YON" yon
      __NS="$__temp""$NS_WEB" webred
      __NS="$__temp""$NS_WEB" weborange
      __NS="$__temp""$NS_WEB" webyellow
      __NS="$__temp""$NS_WEB" webgreen
      __NS="$__temp""$NS_WEB" webcyan
      __NS="$__temp""$NS_WEB" webblue
      __NS="$__temp""$NS_WEB" webpurple
      __NS="$__temp""$NS_WEB" webpink
      __NS="$__temp""$NS_WEB" webwhite
      __NS="$__temp""$NS_WEB" webgray
      __NS="$__temp""$NS_WEB" webbrown
      __NS="$__temp""$NS_YON_ABBR" yon_abbr
      __NS="$__temp""$NS_ISO" iso_abbr
      __NS="$__temp""$NS_ABBR" abbr
      __NS="$__temp""$NS_COM" common
      ;;
      *)
      ;;
    esac
    unset -v __NS
    shift
  done
}

#Yandex ( https://gurov.github.io/yandex-colors/index.html )

# function extract() {
#   output = []
#   list = document.querySelectorAll("body > div > div > div > div")
#   for (x of list) {
#     text = x.innerText
#     split = text.split(/[\r\n]+/g)
#     label = split[1].toLowerCase().replace(/[^\w\d]+/g,"_")
#     rgb_hex = /^#(..)(..)(..)$/.exec(/#[\dabcdef]+/i.exec(x.innerText)[0].toUpperCase()).slice(1)
#     h2d = (h => "0123456789ABCDEF".indexOf(h))
#     rgb_dec = rgb_hex.map(hex => h2d(hex[0])*16 + h2d(hex[1]))
#     line = label+'="[38;2;'+rgb_dec.join(";")+'m"'
#     output.push(line)
#   }
#   output.sort()
#   return output.join("\n")
# }

function yan {
[ ! -v __NS ] && local __NS="$NS_YAN"
echo 'alizarin="[38;2;227;38;54m"
amber="[38;2;255;191;0m"
amethyst="[38;2;153;102;204m"
anthracite="[38;2;70;68;81m"
aqua="[38;2;0;240;240m"
aquamarine="[38;2;127;255;212m"
asparagus="[38;2;123;160;91m"
azure="[38;2;0;127;255m"
beige="[38;2;245;245;220m"
bistre="[38;2;61;43;31m"
black="[38;2;0;0;0m"
blue="[38;2;0;0;255m"
bondi_blue="[38;2;0;149;182m"
brass="[38;2;181;166;66m"
brick="[38;2;136;69;53m"
bright_green="[38;2;102;255;0m"
bright_turquoise="[38;2;8;232;222m"
bright_violet="[38;2;205;0;205m"
bronze="[38;2;205;127;50m"
brown="[38;2;150;75;0m"
buff="[38;2;240;220;130m"
burgundy="[38;2;144;0;32m"
burnt_orange="[38;2;204;85;0m"
burnt_siena="[38;2;233;116;81m"
burnt_umber="[38;2;138;51;36m"
camouflage_green="[38;2;120;134;107m"
cardinal="[38;2;196;30;58m"
carmine="[38;2;150;0;24m"
carmine_red="[38;2;255;0;51m"
carrot="[38;2;243;98;35m"
celadon="[38;2;172;225;175m"
cerise="[38;2;222;49;99m"
cerulean_blue="[38;2;42;82;190m"
cerulean_grey="[38;2;0;123;167m"
chartreuse="[38;2;153;255;153m"
cherry="[38;2;214;43;96m"
chestnut="[38;2;205;92;92m"
child_s_surprise="[38;2;247;242;26m"
chocolate="[38;2;210;105;30m"
cinnamon="[38;2;123;63;0m"
cobalt="[38;2;0;71;171m"
coffee="[38;2;68;45;37m"
copper="[38;2;184;115;51m"
coral="[38;2;255;127;80m"
corn="[38;2;251;236;93m"
cornflower_blue="[38;2;100;149;237m"
cream="[38;2;242;221;198m"
crimson="[38;2;220;20;60m"
cyan="[38;2;0;255;255m"
dark_brown="[38;2;101;67;33m"
dark_cerulean="[38;2;8;69;126m"
dark_chestnut="[38;2;152;105;96m"
dark_coral="[38;2;205;91;69m"
dark_goldenrod="[38;2;184;134;11m"
dark_green="[38;2;1;50;32m"
dark_indigo="[38;2;49;0;98m"
dark_khaki="[38;2;76;60;24m"
dark_olive="[38;2;85;104;50m"
dark_pastel_green="[38;2;3;192;60m"
dark_peach="[38;2;255;218;185m"
dark_pear="[38;2;216;169;3m"
dark_pink="[38;2;231;84;128m"
dark_salmon="[38;2;233;150;122m"
dark_scarlet="[38;2;86;3;25m"
dark_slate_gray="[38;2;47;79;79m"
dark_spring_green="[38;2;23;114;69m"
dark_tan="[38;2;145;129;81m"
dark_tangerine="[38;2;234;117;0m"
dark_tea_green="[38;2;186;219;173m"
dark_turquoise="[38;2;17;96;98m"
dark_violet="[38;2;66;49;137m"
denim="[38;2;21;96;189m"
dodger_blue="[38;2;30;144;255m"
eggplant="[38;2;153;0;102m"
electric="[38;2;125;249;255m"
emerald="[38;2;80;200;120m"
fainted_frog="[38;2;123;145;123m"
fern_green="[38;2;79;121;66m"
flax="[38;2;238;220;130m"
fuchsia="[38;2;247;84;225m"
fulvous="[38;2;69;22;28m"
gamboge="[38;2;228;155;15m"
gold="[38;2;255;215;0m"
goldenrod="[38;2;218;165;32m"
grass="[38;2;93;161;48m"
gray="[38;2;128;128;128m"
gray_asparagus="[38;2;70;89;69m"
gray_tea_green="[38;2;202;218;186m"
green="[38;2;0;255;0m"
green_yellow="[38;2;173;255;47m"
heliotrope="[38;2;223;115;255m"
hot_pink="[38;2;252;15;192m"
indigo="[38;2;75;0;130m"
international_orange="[38;2;255;79;0m"
ivory="[38;2;255;253;223m"
jade="[38;2;0;168;107m"
khaki="[38;2;128;107;42m"
klein_blue="[38;2;58;117;196m"
lavender="[38;2;230;230;250m"
lavender_blush="[38;2;255;240;245m"
lemon="[38;2;253;233;16m"
lemon_cream="[38;2;255;250;205m"
light_blue="[38;2;66;170;255m"
light_brown="[38;2;205;133;63m"
light_cream="[38;2;242;232;201m"
light_grey="[38;2;187;187;187m"
lilac="[38;2;200;162;200m"
lime="[38;2;204;255;0m"
linen="[38;2;250;240;230m"
magenta="[38;2;255;0;255m"
malachite="[38;2;11;218;81m"
marengo="[38;2;76;88;102m"
maroon="[38;2;128;0;0m"
mauve="[38;2;153;51;102m"
midnight_blue="[38;2;0;51;102m"
mint_green="[38;2;152;255;152m"
moray="[38;2;28;107;114m"
moss_green="[38;2;173;223;173m"
mountbatten_pink="[38;2;153;122;141m"
mustard="[38;2;255;219;88m"
navajo_white="[38;2;255;222;173m"
navy_blue="[38;2;0;0;128m"
ochre="[38;2;204;119;34m"
old_gold="[38;2;207;181;59m"
olive="[38;2;128;128;0m"
olive_drab="[38;2;107;142;35m"
orange="[38;2;255;165;0m"
orchid="[38;2;218;112;214m"
pale_blue="[38;2;175;238;238m"
pale_brown="[38;2;152;118;84m"
pale_carmine="[38;2;175;64;53m"
pale_chestnut="[38;2;221;173;175m"
pale_cornflower_blue="[38;2;171;205;239m"
pale_green="[38;2;119;221;119m"
pale_magenta="[38;2;249;132;229m"
pale_mauve="[38;2;153;102;102m"
pale_pink="[38;2;250;218;221m"
pale_red_violet="[38;2;219;112;147m"
pale_sandy_brown="[38;2;253;234;168m"
pang="[38;2;199;252;236m"
papaya_whip="[38;2;255;239;213m"
peach="[38;2;255;229;180m"
peach_orange="[38;2;255;204;153m"
peach_yellow="[38;2;250;223;173m"
pear="[38;2;239;211;52m"
periwinkle="[38;2;204;204;255m"
persian_blue="[38;2;102;0;255m"
pine_green="[38;2;1;121;111m"
pink="[38;2;255;192;203m"
pink_orange="[38;2;255;153;102m"
pistachio="[38;2;190;245;116m"
plum="[38;2;102;0;102m"
powder_blue="[38;2;0;51;153m"
prussian_blue="[38;2;0;49;83m"
puce="[38;2;204;136;153m"
pumpkin="[38;2;255;117;24m"
purple="[38;2;102;0;153m"
red="[38;2;255;0;0m"
red_violet="[38;2;199;21;133m"
reddish_brown="[38;2;215;125;49m"
robin_egg_blue="[38;2;0;204;204m"
royal_blue="[38;2;65;105;225m"
russet="[38;2;117;90;87m"
rust="[38;2;183;65;14m"
safety_orange="[38;2;255;153;0m"
saffron="[38;2;244;196;48m"
salmon="[38;2;255;140;105m"
sandy_brown="[38;2;252;221;118m"
sanguine="[38;2;146;0;10m"
sapphire="[38;2;8;37;103m"
scared_nymph="[38;2;250;238;221m"
scarlet="[38;2;255;36;0m"
school_bus_yellow="[38;2;255;216;0m"
sea_green="[38;2;46;139;87m"
seashell="[38;2;255;245;238m"
selective_yellow="[38;2;255;186;0m"
sepia="[38;2;112;66;20m"
siena="[38;2;226;139;0m"
silver="[38;2;192;192;192m"
sky="[38;2;127;199;255m"
slate_gray="[38;2;112;128;144m"
spring_green="[38;2;0;255;127m"
steel_blue="[38;2;70;130;180m"
swamp_green="[38;2;172;183;142m"
tan="[38;2;210;180;140m"
tangerine="[38;2;255;136;0m"
tea_green="[38;2;208;240;192m"
teal="[38;2;0;128;128m"
tenne="[38;2;205;87;0m"
terracotta="[38;2;144;77;48m"
thistle="[38;2;216;191;216m"
titian="[38;2;213;62;7m"
turquoise="[38;2;48;213;200m"
ultramarine="[38;2;18;10;143m"
umber="[38;2;115;74;18m"
vermilion="[38;2;255;77;0m"
violaceous="[38;2;234;141;247m"
violet="[38;2;139;0;255m"
violet_eggplant="[38;2;153;17;153m"
viridian="[38;2;127;255;0m"
wet_asphalt="[38;2;80;80;80m"
wheat="[38;2;245;222;179m"
white="[38;2;255;255;255m"
wine_red="[38;2;155;45;48m"
wisteria="[38;2;201;160;220m"
yandex="[38;2;255;204;0m"
yellow="[38;2;255;255;0m"
yellow_pink="[38;2;255;228;178m"
zinnwaldite="[38;2;235;194;175m"' | sed "s/^/$__NS/"
}

#Simple colors (Abbreviations)

function abbr {
[ ! -v __NS ] && local __NS="$NS_ABBR"
echo 'R="[91m"
G="[92m"
Y="[93m"
B="[94m"
M="[95m"
C="[96m"
W="[97m"
N="[0m"
K="[90m"
LK="[90m"
LR="[91m"
LG="[92m"
LY="[93m"
LB="[94m"
LM="[95m"
LC="[96m"
LW="[97m"
DK="[30m"
DR="[31m"
DG="[32m"
DY="[33m"
DB="[34m"
DM="[35m"
DC="[36m"
DW="[37m"' | sed "s/^/$__NS/"
}

#ISO (Abbreviations)

function iso_abbr {
[ ! -v __NS ] && local __NS="$NS_ISO"
echo 'BK="[38;2;0;0;0m"
BN="[38;2;128;84;47m"
RD="[38;2;171;37;36m"
OG="[38;2;250;132;43m"
YE="[38;2;238;201;0m"
GN="[38;2;72;164;63m"
BU="[38;2;40;116;178m"
VT="[38;2;131;99;157m"
GY="[38;2;126;139;146m"
WH="[38;2;255;255;255m"
PK="[38;2;215;160;166m"
TK="[38;2;129;192;187m"' | sed "s/^/$__NS/"
}

#Yonex Color Chart (Abbreviations) ( http://shuttle-house.com/page_top_ENGLISH/Guide/color_chart.html )

function yon_abbr {
[ ! -v __NS ] && local __NS="$NS_YON_ABBR"
echo 'R="[38;2;255;0;0m"
BL="[38;2;0;0;187m"
G="[38;2;0;128;0m"
Y="[38;2;255;255;0m"
OR="[38;2;239;129;15m"
BK="[38;2;0;0;0m"
LG="[38;2;50;205;50m"
IV="[38;2;221;222;211m"
GR="[38;2;113;120;110m"
AM="[38;2;214;182;65m"
PW="[38;2;196;197;182m"
BR="[38;2;109;76;51m"
GO="[38;2;248;199;1m"
SI="[38;2;136;146;141m"
SB="[38;2;0;195;207m"
NB="[38;2;16;48;132m"
WI="[38;2;112;0;61m"
LV="[38;2;91;145;242m"
SG="[38;2;164;164;164m"
PE="[38;2;220;140;160m"
P="[38;2;200;140;180m"
SX="[38;2;70;72;184m"
LTG="[38;2;44;209;175m"
SE="[38;2;20;15;7m"
DG="[38;2;0;47;0m" # DarkGreen was DC in the original index, but DarknessCharcoal was DC too
LB="[38;2;3;177;121m"
MEGT="[38;2;0;255;153m"
MB="[38;2;2;159;212m"
CGR="[38;2;37;52;56m"
WR="[38;2;128;39;63m"
MU="[38;2;226;184;38m"
PU="[38;2;38;0;140m"
DBR="[38;2;128;0;0m"
SP="[38;2;235;164;149m"
EM="[38;2;0;89;38m"
VI="[38;2;51;25;229m"
CR="[38;2;255;232;175m"
LY="[38;2;217;202;0m"
PM="[38;2;100;39;76m"
WG="[38;2;178;178;151m"
CB="[38;2;41;113;182m"
COB="[38;2;0;153;255m"
RB="[38;2;19;68;157m"
MEB="[38;2;200;202;225m"
C="[38;2;41;40;41m"
PG="[38;2;222;214;198m"
MEBK="[38;2;41;32;35m"
AB="[38;2;0;183;223m"
DB="[38;2;0;0;139m" # DarkBlue was DBR in the original index, but DarkBrown was DBR too
IKBL="[38;2;14;27;60m" # InkBlue was IBL in the original index, but IndigoBlue was IBL too
BPU="[38;2;178;0;255m"
BB="[38;2;25;51;140m"
MER="[38;2;238;79;111m"
BP="[38;2;253;50;239m"
ROP="[38;2;238;142;160m"
RUP="[38;2;254;39;128m"
FP="[38;2;255;50;95m"
MIG="[38;2;0;145;92m"
BG="[38;2;0;197;150m"
MS="[38;2;90;199;41m"
RG="[38;2;33;162;123m"
LBR="[38;2;206;110;64m"
MEGR="[38;2;172;203;195m"
DGR="[38;2;63;70;70m"
SAB="[38;2;210;147;93m"
BE="[38;2;159;130;87m"
LGR="[38;2;244;236;248m"
OL="[38;2;153;153;0m"
MHG="[38;2;31;39;31m"
BY="[38;2;239;254;154m"
BO="[38;2;200;57;41m"
TQ="[38;2;64;224;208m"
FBL="[38;2;42;70;145m"
LPU="[38;2;206;117;223m"
PBL="[38;2;0;110;123m"
BLGR="[38;2;103;117;126m"
IBL="[38;2;54;127;159m"
MN="[38;2;0;0;51m"
MOC="[38;2;71;78;69m"
CM="[38;2;149;92;58m"
BZ="[38;2;122;89;47m"
ABK="[38;2;79;32;35m"
PMT="[38;2;136;179;110m"
K="[38;2;66;63;21m"
OM="[38;2;228;215;194m"
CMGO="[38;2;244;215;175m"
SDBE="[38;2;165;150;123m"
MO="[38;2;168;107;65m"
NOR="[38;2;255;123;44m"
MBBL="[38;2;74;189;239m"
LSX="[38;2;76;229;255m"
OW="[38;2;255;255;230m"
CL="[38;2;222;222;222m"
NA="[38;2;255;250;210m"
BRR="[38;2;187;13;2m"
FUC="[38;2;255;0;255m"
CP="[38;2;211;88;137m"
LI="[38;2;213;132;224m"
PO="[38;2;247;191;177m"
YM="[38;2;217;142;25m"
LTO="[38;2;255;174;90m"
RE="[38;2;141;30;22m"
SMR="[38;2;145;60;73m"
DR="[38;2;139;0;0m"
DPU="[38;2;107;14;104m"
OLGR="[38;2;119;113;119m"
MDGR="[38;2;90;113;116m"
DP="[38;2;231;33;82m"
CLBK="[38;2;90;90;99m"
NEWR="[38;2;221;17;0m"
NEWBU="[38;2;85;89;159m"
NEWG="[38;2;99;181;107m"
NEWOR="[38;2;252;74;48m"
NEWTQ="[38;2;104;187;201m"
DWI="[38;2;103;45;50m"
GRG="[38;2;91;164;162m"
OLG="[38;2;23;69;20m"
DEG="[38;2;16;73;41m"
GRNB="[38;2;51;68;136m"
GRBEN="[38;2;205;222;231m"
GRM="[38;2;148;132;148m"
BEM="[38;2;172;158;152m"
DGU="[38;2;63;70;70m"
GT="[38;2;69;50;46m"
LTY="[38;2;255;255;224m"
SOY="[38;2;255;250;195m"
LM="[38;2;0;255;0m"
WGR="[38;2;195;195;189m"
COR="[38;2;204;51;0m"
CHP="[38;2;233;215;163m"
RTR="[38;2;145;23;38m"
COP="[38;2;244;210;204m"
AQA="[38;2;0;255;255m"
GRP="[38;2;247;226;0m"
GRB="[38;2;196;206;208m"
PP="[38;2;206;142;156m"
PRO="[38;2;238;157;189m"
ICB="[38;2;178;229;242m"
CTG="[38;2;143;163;74m"
RTBK="[38;2;119;69;36m"
SIM="[38;2;214;210;208m"
WAR="[38;2;186;56;79m"
AGR="[38;2;143;143;143m"
COOR="[38;2;247;190;107m"
PRLGW="[38;2;206;40;44m"
VBL="[38;2;98;217;225m"
DM="[38;2;35;36;40m"
LOL="[38;2;201;211;197m"
PY="[38;2;255;255;0m"
ICGR="[38;2;216;219;222m"
MG="[38;2;204;0;204m"
DOL="[38;2;85;107;47m"
SP_HB="[38;2;0;76;97m"
RBYR="[38;2;185;11;80m"
MNPA="[38;2;87;77;88m"
MBFP="[38;2;255;222;255m"
MBSX="[38;2;206;222;255m"
PLG="[38;2;206;213;172m"
LBE="[38;2;255;232;181m"
CA="[38;2;205;48;48m"
PK="[38;2;255;63;0m"
SF="[38;2;247;158;33m"
INB="[38;2;0;51;102m"
MPU="[38;2;230;204;230m"
SMC="[38;2;85;121;145m"
FLG="[38;2;20;230;74m"
BRBK="[38;2;0;0;1m"
JPR="[38;2;144;37;29m"
DIR="[38;2;206;40;41m"
AMB="[38;2;77;26;230m"
PLY="[38;2;246;225;134m"
SHO="[38;2;231;138;132m"
GN="[38;2;159;172;178m"
CTO="[38;2;235;168;75m"
SMBL="[38;2;85;119;145m"
SK="[38;2;110;190;205m"
PDBL="[38;2;160;175;232m"
PDG="[38;2;181;210;130m"
MAOR="[38;2;255;83;43m"
GM="[38;2;98;86;86m"
MT="[38;2;104;152;112m"
BD="[38;2;35;0;10m"
PSD="[38;2;102;102;102m"
OK="[38;2;227;165;98m"
SHIY="[38;2;255;245;0m"
FRBL="[38;2;187;201;209m"
DPR="[38;2;160;41;95m"
IRG="[38;2;126;144;154m"
MBL="[38;2;114;229;204m"
MPI="[38;2;232;158;183m" # MistoPink was MPU in the original index, but MistPurple was MPU too
FY="[38;2;241;232;157m"
MSI="[38;2;214;198;189m"
PDP="[38;2;246;228;224m"
DES="[38;2;99;78;109m"
PLP="[38;2;195;112;122m"
MR="[38;2;16;90;172m"
DSK="[38;2;0;191;255m"
MUP="[38;2;249;192;211m"
AMT="[38;2;0;203;195m"
FAO="[38;2;232;109;29m"
PLB="[38;2;77;188;192m"
MEW="[38;2;240;239;234m"
SHIS="[38;2;129;129;129m"
ASH="[38;2;196;202;207m"
SW="[38;2;240;240;240m"
SSO="[38;2;223;147;32m"
CTY="[38;2;234;168;75m"
AP="[38;2;216;159;109m"
BGD="[38;2;102;0;0m"
CBL="[38;2;6;88;190m"
CY="[38;2;239;208;22m"
DOR="[38;2;255;140;0m"
DC="[38;2;87;78;81m"
LPI="[38;2;255;182;193m" # LightPink was LPU in the original index, but LightPurple was LPU too
LFG="[38;2;109;224;81m"
ICBE="[38;2;217;192;181m"
RO="[38;2;255;0;55m"
IMR="[38;2;60;51;82m"' | sed "s/^/$__NS/"
}

#Yonex Color Chart ( http://shuttle-house.com/page_top_ENGLISH/Guide/color_chart.html )

function yon {
[ ! -v __NS ] && local __NS="$NS_YON"
echo 'red="[38;2;255;0;0m"
blue="[38;2;0;0;187m"
green="[38;2;0;128;0m"
yellow="[38;2;255;255;0m"
orange="[38;2;239;129;15m"
black="[38;2;0;0;0m"
limegreen="[38;2;50;205;50m"
ivory="[38;2;221;222;211m"
gray="[38;2;113;120;110m"
american="[38;2;214;182;65m"
pearlwhite="[38;2;196;197;182m"
brown="[38;2;109;76;51m"
gold="[38;2;248;199;1m"
silver="[38;2;136;146;141m"
skyblue="[38;2;0;195;207m"
navyblue="[38;2;16;48;132m"
wine="[38;2;112;0;61m"
lavender="[38;2;91;145;242m"
silvergray="[38;2;164;164;164m"
peach="[38;2;220;140;160m"
pink="[38;2;200;140;180m"
sax="[38;2;70;72;184m"
lightgreen="[38;2;44;209;175m"
sepia="[38;2;20;15;7m"
darkgreen="[38;2;0;47;0m"
lightblue="[38;2;3;177;121m"
metallicgreen="[38;2;0;255;153m"
marineblue="[38;2;2;159;212m"
charcoalgray="[38;2;37;52;56m"
winered="[38;2;128;39;63m"
mustard="[38;2;226;184;38m"
purple="[38;2;38;0;140m"
darkbrown="[38;2;128;0;0m"
salmonpink="[38;2;235;164;149m"
emerald="[38;2;0;89;38m"
violet="[38;2;51;25;229m"
cream="[38;2;255;232;175m"
lemonyellow="[38;2;217;202;0m"
plum="[38;2;100;39;76m"
watergreen="[38;2;178;178;151m"
crystalblue="[38;2;41;113;182m"
cobaltblue="[38;2;0;153;255m"
royalblue="[38;2;19;68;157m"
metallicblue="[38;2;200;202;225m"
charcoal="[38;2;41;40;41m"
platinumgold="[38;2;222;214;198m"
metallicblack="[38;2;41;32;35m"
aquabule="[38;2;0;183;223m"
darkblue="[38;2;0;0;139m"
inkblue="[38;2;14;27;60m"
bluepurple="[38;2;178;0;255m"
blueberry="[38;2;25;51;140m"
metallicred="[38;2;238;79;111m"
blightpink="[38;2;253;50;239m"
rosepink="[38;2;238;142;160m"
rougepink="[38;2;254;39;128m"
frenchpink="[38;2;255;50;95m"
mintgreen="[38;2;0;145;92m"
blightgreen="[38;2;0;197;150m"
muscat="[38;2;90;199;41m"
royalgreen="[38;2;33;162;123m"
lightbrown="[38;2;206;110;64m"
metallicgray="[38;2;172;203;195m"
darkgray="[38;2;63;70;70m"
sable="[38;2;210;147;93m"
beige="[38;2;159;130;87m"
lightgray="[38;2;244;236;248m"
olive="[38;2;153;153;0m"
mahogany="[38;2;31;39;31m"
blightyellow="[38;2;239;254;154m"
blightorange="[38;2;200;57;41m"
turquoise="[38;2;64;224;208m"
frenchblue="[38;2;42;70;145m"
lightpurple="[38;2;206;117;223m"
peacockblue="[38;2;0;110;123m"
bluegray="[38;2;103;117;126m"
indigoblue="[38;2;54;127;159m"
midnight="[38;2;0;0;51m"
mossgreen="[38;2;71;78;69m"
camel="[38;2;149;92;58m"
bronze="[38;2;122;89;47m"
ashgray="[38;2;79;32;35m"
peppermint="[38;2;136;179;110m"
khaki="[38;2;66;63;21m"
oatmeal="[38;2;228;215;194m"
camelgold="[38;2;244;215;175m"
sandbeige="[38;2;165;150;123m"
mocha="[38;2;168;107;65m"
neonorange="[38;2;255;123;44m"
marbleblue="[38;2;74;189;239m"
lightsax="[38;2;76;229;255m"
offwhite="[38;2;255;255;230m"
clear="[38;2;222;222;222m"
natural="[38;2;255;250;210m"
blightred="[38;2;187;13;2m"
fuchira="[38;2;255;0;255m"
cherrypink="[38;2;211;88;137m"
lilac="[38;2;213;132;224m"
paleorange="[38;2;247;191;177m"
japaneseyellowrose="[38;2;217;142;25m"
lightorange="[38;2;255;174;90m"
brick="[38;2;141;30;22m"
smokered="[38;2;145;60;73m"
darkred="[38;2;139;0;0m"
darkpurple="[38;2;107;14;104m"
olivegray="[38;2;119;113;119m"
middlegray="[38;2;90;113;116m"
darkpink="[38;2;231;33;82m"
clearblack="[38;2;90;90;99m"
newred="[38;2;221;17;0m"
newblue="[38;2;85;89;159m"
newgreen="[38;2;99;181;107m"
neworange="[38;2;252;74;48m"
newturquoise="[38;2;104;187;201m"
darkwine="[38;2;103;45;50m"
grayishgreen="[38;2;91;164;162m"
olivegreen="[38;2;23;69;20m"
deepgreen="[38;2;16;73;41m"
grayishnavy="[38;2;51;68;136m"
grayishblue="[38;2;205;222;231m"
heathergray="[38;2;148;132;148m"
heatherbeige="[38;2;172;158;152m"
darkgun="[38;2;63;70;70m"
grafight="[38;2;69;50;46m"
lightyellow="[38;2;255;255;224m"
softyellow="[38;2;255;250;195m"
lime="[38;2;0;255;0m"
warmgray="[38;2;195;195;189m"
copperorange="[38;2;204;51;0m"
champagne="[38;2;233;215;163m"
rustyred="[38;2;145;23;38m"
coralpink="[38;2;244;210;204m"
aqua="[38;2;0;255;255m"
grape="[38;2;247;226;0m"
grayishwhite="[38;2;196;206;208m"
pearlpink="[38;2;206;142;156m"
pearlrose="[38;2;238;157;189m"
iceblue="[38;2;178;229;242m"
citrusgreen="[38;2;143;163;74m"
lastblack="[38;2;119;69;36m"
heathersilver="[38;2;214;210;208m"
warmred="[38;2;186;56;79m"
ashgray="[38;2;143;143;143m"
coralorange="[38;2;247;190;107m"
pearlred="[38;2;206;40;44m"
venusblue="[38;2;98;217;225m"
darkmarine="[38;2;35;36;40m"
lightolive="[38;2;201;211;197m"
purpleyellow="[38;2;255;255;0m"
icegray="[38;2;216;219;222m"
magenta="[38;2;204;0;204m"
darkolive="[38;2;85;107;47m"
sapphireblue="[38;2;0;76;97m"
rubyred="[38;2;185;11;80m"
midnightpurple="[38;2;87;77;88m"
marblefrenchpink="[38;2;255;222;255m"
marblesax="[38;2;206;222;255m"
palegreen="[38;2;206;213;172m"
lightbeige="[38;2;255;232;181m"
camelot="[38;2;205;48;48m"
pumpkin="[38;2;255;63;0m"
saffron="[38;2;247;158;33m"
indigonavy="[38;2;0;51;102m"
mistpurple="[38;2;230;204;230m"
smokegreen="[38;2;85;121;145m"
freshgreen="[38;2;20;230;74m"
brilliantblack="[38;2;0;0;1m"
japanred="[38;2;144;37;29m"
diamondred="[38;2;206;40;41m"
americanblue="[38;2;77;26;230m"
paleyellow="[38;2;246;225;134m"
sherbetorange="[38;2;231;138;132m"
gun="[38;2;159;172;178m"
citrusorange="[38;2;235;168;75m"
smokeblue="[38;2;85;119;145m"
sky="[38;2;110;190;205m"
powderblue="[38;2;160;175;232m"
powdergreen="[38;2;181;210;130m"
mandarinorange="[38;2;255;83;43m"
gunmetallic="[38;2;98;86;86m"
mint="[38;2;104;152;112m"
bordeaux="[38;2;35;0;10m"
palesand="[38;2;102;102;102m"
Oak="[38;2;227;165;98m"
shineyellow="[38;2;255;245;0m"
frostyblue="[38;2;187;201;209m"
deepred="[38;2;160;41;95m"
irongray="[38;2;126;144;154m"
mistoblue="[38;2;114;229;204m"
mistopink="[38;2;232;158;183m"
frenchyellow="[38;2;241;232;157m"
madsilver="[38;2;214;198;189m"
powderpink="[38;2;246;228;224m"
deepsee="[38;2;99;78;109m"
perpink="[38;2;195;112;122m"
marine="[38;2;16;90;172m"
deepsky="[38;2;0;191;255m"
maddepink="[38;2;249;192;211m"
aquamint="[38;2;0;203;195m"
finenessorange="[38;2;232;109;29m"
perblue="[38;2;77;188;192m"
metallicwhite="[38;2;240;239;234m"
shinesilver="[38;2;129;129;129m"
ash="[38;2;196;202;207m"
snowwhite="[38;2;240;240;240m"
sunsetorange="[38;2;223;147;32m"
citrusyellow="[38;2;234;168;75m"
apricot="[38;2;216;159;109m"
burgundy="[38;2;102;0;0m"
ceruleanblue="[38;2;6;88;190m"
cornyellow="[38;2;239;208;22m"
darknessorange="[38;2;255;140;0m"
darknesscharcoal="[38;2;87;78;81m"
lightpink="[38;2;255;182;193m"
leafgreen="[38;2;109;224;81m"
icebeige="[38;2;217;192;181m"
rose="[38;2;255;0;55m"
Indigomarine="[38;2;60;51;82m"' | sed "s/^/$__NS/"
}

#Web Colors

function webred {
#Red colors
[ ! -v __NS ] && local __NS="$NS_WEB"
echo 'web_lightsalmon="[38;2;255;160;122m"
salmon="[38;2;250;128;114m"
darksalmon="[38;2;233;150;122m"
lightcoral="[38;2;240;128;128m"
indianred="[38;2;205;92;92m"
crimson="[38;2;220;20;60m"
firebrick="[38;2;178;34;34m"
red="[38;2;255;0;0m"
darkred="[38;2;139;0;0m"' | sed "s/^/$__NS/"
}

function weborange {
#Orange colors
[ ! -v __NS ] && local __NS="$NS_WEB"
echo 'web_coral="[38;2;255;127;80m"
tomato="[38;2;255;99;71m"
orangered="[38;2;255;69;0m"
gold="[38;2;255;215;0m"
orange="[38;2;255;165;0m"
darkorange="[38;2;255;140;0m"' | sed "s/^/$__NS/"
}

function webyellow {
#Yellow colors
[ ! -v __NS ] && local __NS="$NS_WEB"
echo 'web_lightyellow="[38;2;255;255;224m"
lemonchiffon="[38;2;255;250;205m"
lightgoldenrodyellow="[38;2;250;250;210m"
papayawhip="[38;2;255;239;213m"
moccasin="[38;2;255;228;181m"
peachpuff="[38;2;255;218;185m"
palegoldenrod="[38;2;238;232;170m"
khaki="[38;2;240;230;140m"
darkkhaki="[38;2;189;183;107m"
yellow="[38;2;255;255;0m"' | sed "s/^/$__NS/"
}

function webgreen {
#Green colors
[ ! -v __NS ] && local __NS="$NS_WEB"
echo 'web_lawngreen="[38;2;124;252;0m"
chartreuse="[38;2;127;255;0m"
limegreen="[38;2;50;205;50m"
lime="[38;2;0;255;0m"
forestgreen="[38;2;34;139;34m"
green="[38;2;0;128;0m"
darkgreen="[38;2;0;100;0m"
greenyellow="[38;2;173;255;47m"
yellowgreen="[38;2;154;205;50m"
springgreen="[38;2;0;255;127m"
mediumspringgreen="[38;2;0;250;154m"
lightgreen="[38;2;144;238;144m"
palegreen="[38;2;152;251;152m"
darkseagreen="[38;2;143;188;143m"
mediumseagreen="[38;2;60;179;113m"
seagreen="[38;2;46;139;87m"
olive="[38;2;128;128;0m"
darkolivegreen="[38;2;85;107;47m"
olivedrab="[38;2;107;142;35m"' | sed "s/^/$__NS/"
}

function webcyan {
#Cyan colors
[ ! -v __NS ] && local __NS="$NS_WEB"
echo 'web_lightcyan="[38;2;224;255;255m"
cyan="[38;2;0;255;255m"
aqua="[38;2;0;255;255m"
aquamarine="[38;2;127;255;212m"
mediumaquamarine="[38;2;102;205;170m"
paleturquoise="[38;2;175;238;238m"
turquoise="[38;2;64;224;208m"
mediumturquoise="[38;2;72;209;204m"
darkturquoise="[38;2;0;206;209m"
lightseagreen="[38;2;32;178;170m"
cadetblue="[38;2;95;158;160m"
darkcyan="[38;2;0;139;139m"
teal="[38;2;0;128;128m"' | sed "s/^/$__NS/"
}

function webblue {
#Blue colors
[ ! -v __NS ] && local __NS="$NS_WEB"
echo 'web_powderblue="[38;2;176;224;230m"
lightblue="[38;2;173;216;230m"
lightskyblue="[38;2;135;206;250m"
skyblue="[38;2;135;206;235m"
deepskyblue="[38;2;0;191;255m"
lightsteelblue="[38;2;176;196;222m"
dodgerblue="[38;2;30;144;255m"
cornflowerblue="[38;2;100;149;237m"
steelblue="[38;2;70;130;180m"
royalblue="[38;2;65;105;225m"
blue="[38;2;0;0;255m"
mediumblue="[38;2;0;0;205m"
darkblue="[38;2;0;0;139m"
navy="[38;2;0;0;128m"
midnightblue="[38;2;25;25;112m"
mediumslateblue="[38;2;123;104;238m"
slateblue="[38;2;106;90;205m"
darkslateblue="[38;2;72;61;139m"' | sed "s/^/$__NS/"
}

function webpurple {
#Purple colors
[ ! -v __NS ] && local __NS="$NS_WEB"
echo 'web_lavender="[38;2;230;230;250m"
thistle="[38;2;216;191;216m"
plum="[38;2;221;160;221m"
violet="[38;2;238;130;238m"
orchid="[38;2;218;112;214m"
fuchsia="[38;2;255;0;255m"
magenta="[38;2;255;0;255m"
mediumorchid="[38;2;186;85;211m"
mediumpurple="[38;2;147;112;219m"
blueviolet="[38;2;138;43;226m"
darkviolet="[38;2;148;0;211m"
darkorchid="[38;2;153;50;204m"
darkmagenta="[38;2;139;0;139m"
purple="[38;2;128;0;128m"
indigo="[38;2;75;0;130m"' | sed "s/^/$__NS/"
}

function webpink {
#Pink colors
[ ! -v __NS ] && local __NS="$NS_WEB"
echo 'web_pink="[38;2;255;192;203m"
lightpink="[38;2;255;182;193m"
hotpink="[38;2;255;105;180m"
deeppink="[38;2;255;20;147m"
palevioletred="[38;2;219;112;147m"
mediumvioletred="[38;2;199;21;133m"' | sed "s/^/$__NS/"
}

function webwhite {
#White colors
[ ! -v __NS ] && local __NS="$NS_WEB"
echo 'web_white="[38;2;255;255;255m"
snow="[38;2;255;250;250m"
honeydew="[38;2;240;255;240m"
mintcream="[38;2;245;255;250m"
azure="[38;2;240;255;255m"
aliceblue="[38;2;240;248;255m"
ghostwhite="[38;2;248;248;255m"
whitesmoke="[38;2;245;245;245m"
seashell="[38;2;255;245;238m"
beige="[38;2;245;245;220m"
oldlace="[38;2;253;245;230m"
floralwhite="[38;2;255;250;240m"
ivory="[38;2;255;255;240m"
antiquewhite="[38;2;250;235;215m"
linen="[38;2;250;240;230m"
lavenderblush="[38;2;255;240;245m"
mistyrose="[38;2;255;228;225m"' | sed "s/^/$__NS/"
}

function webgray {
#Gray colors
[ ! -v __NS ] && local __NS="$NS_WEB"
echo 'web_gainsboro="[38;2;220;220;220m"
lightgray="[38;2;211;211;211m"
silver="[38;2;192;192;192m"
darkgray="[38;2;169;169;169m"
gray="[38;2;128;128;128m"
dimgray="[38;2;105;105;105m"
lightslategray="[38;2;119;136;153m"
slategray="[38;2;112;128;144m"
darkslategray="[38;2;47;79;79m"
black="[38;2;0;0;0m"' | sed "s/^/$__NS/"
}

function webbrown {
#Brown colors
[ ! -v __NS ] && local __NS="$NS_WEB"
echo 'web_cornsilk="[38;2;255;248;220m"
blanchedalmond="[38;2;255;235;205m"
bisque="[38;2;255;228;196m"
navajowhite="[38;2;255;222;173m"
wheat="[38;2;245;222;179m"
burlywood="[38;2;222;184;135m"
tan="[38;2;210;180;140m"
rosybrown="[38;2;188;143;143m"
sandybrown="[38;2;244;164;96m"
goldenrod="[38;2;218;165;32m"
peru="[38;2;205;133;63m"
chocolate="[38;2;210;105;30m"
saddlebrown="[38;2;139;69;19m"
sienna="[38;2;160;82;45m"
brown="[38;2;165;42;42m"
maroon="[38;2;128;0;0m"' | sed "s/^/$__NS/"
}

function common {
[ ! -v __NS ] && local __NS="$NS_COM"
echo 'dkgray="[90m"
red="[91m"
green="[92m"
yellow="[93m"
blue="[94m"
magenta="[95m"
cyan="[96m"
white="[97m"
black="[30m"
dkred="[31m"
dkgreen="[32m"
dkyellow="[33m"
dkblue="[34m"
dkmagenta="[35m"
dkcyan="[36m"
gray="[37m"
cdef="[0m"' | sed "s/^/$__NS/"
}
