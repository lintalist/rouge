# Info: started with vb.rb, removed sections to keep it working,
# added AutoHotkey specific keywords and rules
# Highlights: commands, functions, hotkeys, hotstrings, labels, builtin variables, user %variables%, keys
# - bug: User variables starting with 'a' are not highlighted as other user variables

module Rouge
  module Lexers
    class AutoHotkey < RegexLexer
      title "AutoHotkey"
      desc "AutoHotkey, Windows scripting language (http://autohotkey.com/)"
      tag 'ahk'
      aliases 'autohotkey'
      filenames '*.ahk'
      mimetypes 'text/plain'

      def self.commands_functions
        @commands_functions ||= Set.new %w(
          __call __delete __get __new __set _newenum
          abs acos array asc asin atan autotrim
          blockinput break
          catch ceil chr clipboardtimeout clipwait clone clone commentflag comobjactive comobjarray
          comobjconnect comobjcreate comobjenwrap comobjerror comobjflags comobjget comobjmissing
          comobjparameter comobjquery comobjtype comobjunwrap comobjvalue continue control controlclick
          controlfocus controlget controlgetfocus controlgetpos controlgettext controlmove controlsend
          controlsendraw controlsettext coordmode cos critical
          detecthiddentext detecthiddenwindows dllcall drive driveget drivespacefree
          edit else envadd envdiv envget envmult envset envsub envupdate errorstdout escapechar
          exception exit exitapp exp
          fileappend filecopy filecopydir filecreatedir filecreateshortcut filedelete fileencoding
          fileexist filegetattrib filegetshortcut filegetsize filegettime filegetversion fileinstall
          filemove filemovedir fileopen fileread filereadline filerecycle filerecycleempty fileremovedir
          fileselectfile fileselectfolder filesetattrib filesettime finally floor format formattime func
          getaddress getaddress getcapacity getcapacity getkeyname getkeysc getkeystate getkeystate
          getkeyvk gosub goto groupactivate groupadd groupclose groupdeactivate gui guicontrol
          guicontrolget haskey haskey hotkey hotkeyinterval hotkeymodifiertimeout hotstring
          if ifequal ifexist ifgreater ifgreaterorequal ifinstring ifless iflessorequal ifmsgbox
          ifnotequal ifnotexist ifnotinstring iftimeout ifwinactive ifwinactive ifwinexist ifwinexist
          ifwinnotactive ifwinnotactive ifwinnotexist ifwinnotexist il_add il_create il_destroy
          imagesearch include includeagain inidelete iniread iniwrite input inputbox inputlevel
          installkeybdhook installmousehook instr isbyref isfunc islabel isobject isoptional isoptional
          keyhistory keyhistory keywait
          listhotkeys listlines listvars ln log loop ltrim ltrim lv_add lv_delete lv_deletecol lv_getcount
          lv_getnext lv_gettext lv_insert lv_insertcol lv_modify lv_modifycol lv_setimagelist
          maxhotkeysperinterval maxindex maxindex maxmem maxthreads maxthreadsbuffer maxthreadsperhotkey
          menu menumaskkey minindex minindex mod mouseclick mouseclickdrag mousegetpos mousemove msgbox
          newenum newenum noenv notrayicon numget numput
          objaddref objclone object objgetaddress objgetcapacity objhaskey objinsert objmaxindex
          objminindex objnewenum objrelease objremove objsetcapacity onexit onmessage outputdebug
          persistent pixelgetcolor pixelsearch pop postmessage process progress push
          random rawread rawwrite readchar readdouble readfloat readint readint64 readline readshort
          readuchar readuint readushort regdelete regexmatch regexreplace registercallback regread
          regwrite reload remove remove removeat return round rtrim run runas runwait
          sb_seticon sb_setparts sb_settext seek send sendevent sendinput sendlevel sendmessage
          sendmode sendplay sendraw setbatchlines setcapacity setcapacity setcapslockstate
          setcontroldelay setdefaultmousespeed setenv setformat setkeydelay setmousedelay
          setnumlockstate setregview setscrolllockstate setstorecapslockmode settimer
          settitlematchmode setwindelay setworkingdir shutdown sin singleinstance sleep sort
          soundbeep soundget soundgetwavevolume soundplay soundset soundsetwavevolume splashimage
          splashtextoff splashtexton splitpath sqrt statusbargettext statusbarwait strget
          stringcasesense stringgetpos stringleft stringlen stringlower stringmid stringreplace
          stringright stringsplit stringtrimleft stringtrimright stringupper strlen strput strsplit
          substr suspend sysget
          tan tell tell thread throw tooltip transform traytip trim try tv_add tv_delete tv_get
          tv_getchild tv_getcount tv_getnext tv_getparent tv_getprev tv_getselection tv_gettext
          tv_modify tv_setimagelist
          until urldownloadtofile usehook
          varsetcapacity
          warn while winactivate winactivatebottom winactivateforce winactive winclose winexist
          winget wingetactivestats wingetactivetitle wingetclass wingetpos wingettext wingettitle
          winhide winkill winmaximize winmenuselectitem winminimize winminimizeall winminimizeallundo
          winmove winrestore winset winsettitle winshow winwait winwaitactive winwaitclose
          winwaitnotactive write writechar writedouble writefloat writeint writeint64 writeline
          writeshort writeuchar writeuint writeushort
        )
      end

      def self.keywords
        @keywords ||= Set.new %w(
          abort abovenormal activex add ahk_class ahk_exe ahk_group ahk_id ahk_pid all alnum alpha
          altsubmit alttab alttabandmenu alttabmenu alttabmenudismiss alwaysontop and autosize
          background backgroundtrans belownormal between bitand bitnot bitor bitshiftleft
          bitshiftright bitxor bold border bottom bottom button buttons byref
          cancel cancel capacity caption caret center center check check3 checkbox checked checkedgray
          choose choosestring class click close close color combobox contains controllist count csv
          custom date datetime days
          ddl default delete deleteall delimiter deref destroy digit disable disabled dpiscale dropdownlist
          eject enable enabled error exist expand exstyle extends
          filesystem first flash float focus font fromcodepage
          global grid group groupbox
          hdr hidden hide high hkcc hkcr hkcu hkey_classes_root hkey_current_config hkey_current_user
          hkey_local_machine hkey_users hklm hku hours hscroll
          icon iconsmall id idlast ignore imagelist in integer interrupt is italic
          join
          label label lastfound lastfoundexist limit lines link list listbox listview local lock logoff
          low lower lowercase ltrim
          mainwindow margin maximize maximizebox maxsize menu minimize minimizebox minmax minsize
          minutes monthcal mouse move multi
          na new no noactivate nodefault nohide noicon nomainwindow norm normal nosort nosorthdr
          nostandard not notab notimers number number
          off ok on or owndialogs owner
          parse password password pic picture pixel pos priority processname
          radio range read readonly realtime redraw reg_binary reg_dword reg_expand_sz reg_multi_sz
          reg_sz region relative rename report resize restore retry rgb rtrim
          screen seconds section section serial setlabel shiftalttab show single slider sortdesc
          standard static status statusbar statuscd strike style submit sysmenu
          tab tab2 tabstop text text theme tile time tip tocodepage togglecheck toggleenable
          toolwindow top top topmost transcolor transparent tray treeview tryagain type
          uncheck underline unicode unlock updown upper uppercase useerrorlevel
          vis visfirst visible vscroll
          wait waitclose wantctrla wantf2 wantreturn wrap
          xdigit xm xp xs yes ym yp ys
        )
      end

      def self.variables
        @variables ||= Set.new %w(
          a_ahkpath a_ahkversion a_appdata a_appdatacommon a_autotrim a_batchlines
          a_caretx a_carety a_computername a_controldelay a_cursor
          a_dd a_ddd a_dddd a_defaultmousespeed a_desktop a_desktopcommon
          a_detecthiddentext a_detecthiddenwindows a_endchar
          a_eventinfo a_exitreason a_formatfloat a_formatinteger a_gui a_guievent
          a_guicontrol a_guicontrolevent a_guiheight a_guiwidth a_guix a_guiy a_hour
          a_iconfile a_iconhidden a_iconnumber a_icontip a_index
          a_ipaddress1 a_ipaddress2 a_ipaddress3 a_ipaddress4 a_isadmin a_iscompiled
          a_issuspended a_keydelay a_language a_lasterror a_linefile a_linenumber
          a_loopfield a_loopfileattrib a_loopfiledir a_loopfileext a_loopfilefullpath
          a_loopfilelongpath a_loopfilename a_loopfileshortname a_loopfileshortpath
          a_loopfilesize a_loopfilesizekb a_loopfilesizemb a_loopfiletimeaccessed
          a_loopfiletimecreated a_loopfiletimemodified a_loopreadline a_loopregkey
          a_loopregname a_loopregsubkey a_loopregtimemodified a_loopregtype
          a_mday a_min a_mm a_mmm a_mmmm a_mon a_mousedelay a_msec a_mydocuments
          a_now a_nowutc a_numbatchlines a_ostype a_osversion a_priorhotkey
          a_programfiles a_programs a_programscommon a_screenheight a_screenwidth
          a_scriptdir a_scriptfullpath a_scriptname a_sec a_space a_startmenu
          a_startmenucommon a_startup a_startupcommon a_stringcasesense a_tab a_temp
          a_thishotkey a_thismenu a_thismenuitem a_thismenuitempos a_tickcount
          a_timeidle a_timeidlephysical a_timesincepriorhotkey a_timesincethishotkey
          a_titlematchmode a_titlematchmodespeed a_username a_wday a_windelay a_windir
          a_workingdir a_yday a_year a_yweek a_yyyy
          a_thisfunc a_thislabel a_ispaused a_iscritical a_isunicode a_ptrsize
          a_scripthwnd a_priorkey a_is64bitos a_regview a_screendpi a_fileencoding
          clipboard clipboardall comspec errorlevel programfiles
          true false
        )
      end

      def self.keys
        @keys ||= Set.new %w(
          shift lshift rshift alt lalt ralt control lcontrol rcontrol
          ctrl lctrl rctrl lwin rwin appskey
          altdown altup shiftdown shiftup ctrldown ctrlup
          lwindown lwinup rwindown rwinup
          lbutton rbutton mbutton wheelup wheeldown xbutton1 xbutton2
          joy1 joy2 joy3 joy4 joy5 joy6 joy7 joy8 joy9 joy10 joy11 joy12 joy13 joy14
          joy15 joy16 joy17 joy18 joy19 joy20 joy21 joy22 joy23 joy24 joy25 joy26 joy27
          joy28 joy29 joy30 joy31 joy32
          joyx joyy joyz joyr joyu joyv joypov joyname joybuttons joyaxes joyinfo
          space tab enter escape esc backspace bs delete del insert ins pgup pgdn
          home end up down left right
          printscreen ctrlbreak pause scrolllock capslock numlock
          numpad0 numpad1 numpad2 numpad3 numpad4 numpad5 numpad6 numpad7 numpad8 numpad9
          numpadmult numpadadd numpadsub numpaddiv numpaddot numpaddel numpadins
          numpadclear numpadup numpaddown numpadleft numpadright numpadhome numpadend
          numpadpgup numpadpgdn numpadenter
          f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12
          f13 f14 f15 f16 f17 f18 f19 f20 f21 f22 f23 f24
          browser_back browser_forward browser_refresh browser_stop browser_search
          browser_favorites browser_home volume_mute volume_down volume_up
          media_next media_prev media_stop media_play_pause
          launch_mail launch_media launch_app1 launch_app2
          blind click raw wheelleft wheelright
        )
      end

      id = /[A-Za-z_]\w*/i

      state :whitespace do
        rule /\s+/, Text
        rule /\n/, Text, :bol
        rule %r(/(\\\n)?[*].*?[*](\\\n)?/)m, Comment::Multiline
        rule /;.*$/, Comment::Single
      end

      state :bol do
        rule /\s+/, Text
        rule(//) { :pop! }
      end

      state :root do
	    ident = '(?:[\w_][\w\d_]*)'
        mixin :whitespace

        rule %r((==|~=|!=|<=|>=|\.\.\.|\.\.|->|=>|[=+\-*/^<>!\\\.,{}():'`#&~\[\]\|\?$])), Operator
        rule %r(#{ident}:\s), Name::Variable::Instance
        rule %r(#{ident}::), Operator::Word
        rule %r(%[^Aa_]\w+%), Name::Tag

        rule id do |m|
          match = m[0].downcase
          if self.class.commands_functions.include? match
            token Keyword
          elsif self.class.variables.include? match
            token Keyword::Type
          elsif self.class.keywords.include? match
            token Generic::Emph
          elsif self.class.keys.include? match
            token Operator::Word
          else
            token Name
          end
        end

        rule /%/, Name::Tag
        rule /"/, Str, :string
        rule /#{id}[%&@!#\$]?/, Name
        rule /0x[0-9a-fA-F]+/, Num::Hex
        rule /\d+/, Num::Integer
        rule /(\d+\.\d*|\d*\.\d+)(f[+-]?\d+)?/i, Num::Float

        rule /_\n/, Keyword
      end

      state :string do
        rule /""/, Str::Escape
        rule /"C?/, Str, :pop!
        rule /[^"]+/, Str
      end

    end
  end
end
