# -*- coding: utf-8 -*- #
# Highlighs: hotkeys, labels, user %variables%, commands, functions, builtin variables, keys
# Bugs/TODO:
# - multiple quoted sections on one line fails
# - check command/functionlist for missing and/or duplicates

module Rouge
  module Lexers
    class AutoHotkey < RegexLexer
      title "AutoHotkey"
      desc "AutoHotkey, Windows scripting language (http://autohotkey.com/)"
      tag 'ahk'
      aliases 'autohotkey'
      filenames '*.ahk'
      mimetypes 'text/plain'

      def self.commands
        @commands ||= Set.new %w(
          autotrim blockinput clipwait control controlclick controlfocus
          controlget controlgetfocus controlgetpos controlgettext controlmove
          controlsend controlsendraw controlsettext coordmode critical detecthiddentext
          detecthiddenwindows drive driveget drivespacefree edit envadd
          envdiv envget envmult envset envsub envupdate fileappend filecopy
          filecopydir filecreatedir filecreateshortcut filedelete filegetattrib
          filegetshortcut filegetsize filegettime filegetversion fileinstall filemove
          filemovedir fileread filereadline filerecycle filerecycleempty fileremovedir
          fileselectfile fileselectfolder filesetattrib filesettime format formattime
          getkeystate groupactivate groupadd groupclose groupdeactivate gui
          guicontrol guicontrolget hotkey
          imagesearch inidelete iniread iniwrite input inputbox keyhistory keywait
          listhotkeys listlines listvars menu mouseclick mouseclickdrag mousegetpos
          mousemove msgbox outputdebug pixelgetcolor pixelsearch
          postmessage process progress random regdelete regread regwrite reload
          run runas runwait 
          send sendevent sendinput sendlevel sendmessage sendmode sendplay sendraw
          setbatchlines setcapslockstate setcontroldelay setdefaultmousespeed setenv setformat
          setkeydelay setmousedelay setnumlockstate setscrolllockstate
          setstorecapslockmode settitlematchmode setwindelay setworkingdir
          shutdown sort soundbeep soundget soundgetwavevolume soundplay soundset
          soundsetwavevolume splashimage splashtextoff splashtexton splitpath
          statusbargettext statusbarwait stringcasesense stringgetpos stringleft
          stringlen stringlower stringmid stringreplace stringright stringsplit
          stringtrimleft stringtrimright stringupper sysget thread tooltip
          transform traytip urldownloadtofile winactivate winactivatebottom winclose
          winget wingetactivestats wingetactivetitle wingetclass wingetpos wingettext
          wingettitle winhide winkill winmaximize winmenuselectitem winminimize
          winminimizeall winminimizeallundo winmove winrestore winset winsettitle
          winshow winwait winwaitactive winwaitclose winwaitnotactive fileencoding setregview
          if ifequal ifexist ifgreater ifgreaterorequal ifinstring
          ifless iflessorequal ifmsgbox ifnotequal ifnotexist ifnotinstring ifwinactive
          ifwinexist ifwinnotactive ifwinnotexist
          abs acos asc asin atan ceil chr cos dllcall exp fileexist floor getkeystate numget numput registercallback
          il_add il_create il_destroy instr islabel isfunc ln log lv_add lv_delete lv_deletecol
          lv_getcount lv_getnext lv_gettext lv_insert lv_insertcol lv_modify
          lv_modifycol lv_setimagelist mod onmessage round
          regexmatch regexreplace
          sb_seticon sb_setparts sb_settext sin sqrt strlen substr tan
          tv_add tv_delete tv_getchild tv_getcount tv_getnext tv_get tv_getparent
          tv_getprev tv_getselection tv_gettext tv_modify tv_setimagelist
          varsetcapacity winactive winexist
          trim ltrim rtrim fileopen strget strput
          object array isobject objinsert objremove objminindex objmaxindex objsetcapacity objgetcapacity
          objgetaddress objnewenum objaddref objrelease objhaskey objclone
          _newenum comobjcreate comobjget comobjconnect comobjerror
          comobjactive comobjenwrap comobjunwrap comobjparameter comobjmissing comobjtype comobjvalue comobjarray
          comobjquery comobjflags func
          getkeyname getkeyvk getkeysc isbyref exception strsplit
          clipboardtimeout commentflag errorstdout escapechar
          hotkeyinterval hotkeymodifiertimeout hotstring if iftimeout ifwinactive ifwinexist include
          includeagain inputlevel installkeybdhook installmousehook keyhistory ltrim
          maxhotkeysperinterval maxmem maxthreads maxthreadsbuffer maxthreadsperhotkey menumaskkey
          noenv notrayicon persistent singleinstance usehook warn winactivateforce
          ifwinnotactive ifwinnotexist
          loop parse
          gosub else
          return
        )
      end

      def self.keywords_variables
        @keywords_variables ||= Set.new %w(
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
          clipboard clipboardall comspec errorlevel programfiles
          a_thisfunc a_thislabel a_ispaused a_iscritical a_isunicode a_ptrsize
          a_scripthwnd a_priorkey a_is64bitos a_regview a_screendpi a_fileencoding
          ahk_id ahk_pid ahk_class ahk_group ahk_exe
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

        rule /[.]/, Punctuation, :dotted
        rule /[(){}!#,:\[\]'`]/, Punctuation
        rule %r(#{ident}:\s), Name::Variable::Instance
        rule %r(%\w+%), Keyword::Constant

        rule id do |m|
          match = m[0].downcase
          if self.class.commands.include? match
            token Keyword
          elsif self.class.keywords_variables.include? match
            token Keyword::Type
          elsif self.class.keys.include? match
            token Operator::Word
          else
            token Name
          end
        end

        rule /%/, Name::Tag
        rule /"/, Str, :string
        rule /#{id}[%&@!#\$]?/, Name

        rule /(\d+\.\d*|\d*\.\d+)(f[+-]?\d+)?/i, Num::Float
        rule /\d+([SILDFR]|US|UI|UL)?/, Num::Integer
        rule /&H[0-9a-f]+([SILDFR]|US|UI|UL)?/, Num::Integer
        rule /&O[0-7]+([SILDFR]|US|UI|UL)?/, Num::Integer

        rule /_\n/, Keyword
      end

      state :dotted do
        mixin :whitespace
        rule id, Name, :pop!
      end

      state :string do
        rule /""/, Str::Escape
        rule /"C?/, Str, :pop!
        rule /[^"]+/, Str
      end

    end
  end
end
