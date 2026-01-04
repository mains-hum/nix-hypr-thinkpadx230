{
  config,
  pkgs,
  colors,
  ...
}:

{
  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "default";
      isDefault = true;

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # Telemetry & Privacy
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;
        "datareporting.healthreport.service.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.sessions.current.clean" = true;
        "devtools.onboarding.telemetry.logged" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.prompted" = 2;
        "toolkit.telemetry.rejected" = true;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.unifiedIsOptIn" = false;
        "toolkit.telemetry.updatePing.enabled" = false;

        # Colors & UI
        "browser.display.background_color" = "${colors.palette.bg}";
        "browser.anchor_color" = "${colors.palette.blue}";
        "browser.tabs.drawInTitlebar" = true;
        "browser.uidensity" = 1;
      };

      # userContent отвечает за содержимое страниц (New Tab, About:Config)
      userContent = ''
        @-moz-document url(about:home), url(about:newtab), url(about:privatebrowsing) {
            body { background-color: ${colors.palette.bg} !important; }
            .search-wrapper .logo-and-wordmark { display: none !important; } /* Убираем логотип если мешает */
        }
      '';

      userChrome = ''
        :root {
            --window-colour:               ${colors.palette.bg}; 
            --secondary-colour:            ${colors.palette.surface0}; 
            --inverted-colour:             ${colors.palette.fg}; 

            --uc-identity-color-blue:      ${colors.palette.blue};
            --uc-identity-color-turquoise: ${colors.palette.cyan};
            --uc-identity-color-green:     ${colors.palette.green};
            --uc-identity-color-yellow:    ${colors.palette.yellow};
            --uc-identity-color-orange:    ${colors.palette.orange};
            --uc-identity-color-red:       ${colors.palette.red};
            --uc-identity-color-pink:      ${colors.palette.magenta};
            --uc-identity-color-purple:    ${colors.palette.magenta};
             
            --urlbar-popup-url-color: var(--uc-identity-color-blue) !important;
            --uc-border-radius: 8px; 
            --uc-urlbar-width: clamp(250px, 50vw, 600px);
            --uc-active-tab-width:   clamp(50px, 18vw, 220px);
            --uc-inactive-tab-width: clamp(50px, 15vw, 200px);
            --show-tab-close-button: none;  
            --show-tab-close-button-hover: -moz-inline-box; 
            --container-tabs-indicator-margin: 0px;
        }

        /* Полная закраска фона окна и панелей */
        #main-window, 
        #browser-sets, 
        #tabbrowser-tabpanels, 
        browser[type="content-primary"],
        #content-deck {
            background-color: var(--window-colour) !important;
        }

        #back-button{ display: -moz-inline-box !important; }
        #forward-button, #stop-button, #reload-button, #star-button, 
        #urlbar-zoom-button, #reader-mode-button, 
        #tracking-protection-icon-container, #identity-permission-box,
        #pageActionButton, #page-action-buttons, .tab-secondary-label { 
            display: none !important; 
        }
        #PanelUI-button { display: -moz-inline-box !important;}

        :root {
            --uc-theme-colour:                          var(--window-colour);
            --uc-hover-colour:                          var(--secondary-colour);
            --uc-inverted-colour:                       var(--inverted-colour);
            
            --button-bgcolor:                           var(--uc-theme-colour)    !important;
            --button-hover-bgcolor:                     var(--uc-hover-colour)    !important;
            --button-active-bgcolor:                    var(--uc-hover-colour)    !important;
            
            --toolbar-bgcolor:                          var(--uc-theme-colour)    !important;
            --toolbarbutton-hover-background:           var(--uc-hover-colour)    !important;
            --toolbarbutton-active-background:          var(--uc-hover-colour)    !important;
            --toolbarbutton-border-radius:              var(--uc-border-radius)   !important;
            --lwt-toolbar-field-focus:                  var(--uc-theme-colour)    !important;
            --toolbarbutton-icon-fill:                  var(--uc-inverted-colour) !important;
            --toolbar-field-focus-background-color:     var(--secondary-colour)   !important;
            --toolbar-field-color:                      var(--uc-inverted-colour) !important;
            --toolbar-field-focus-color:                var(--uc-inverted-colour) !important;
            
            --tabs-border-color:                        var(--uc-theme-colour)    !important;
            --tab-border-radius:                        var(--uc-border-radius)   !important;
            --lwt-text-color:                           var(--uc-inverted-colour) !important;
            --lwt-tab-text:                             var(--uc-inverted-colour) !important;

            --lwt-sidebar-background-color:             var(--uc-hover-colour)    !important;
            --lwt-sidebar-text-color:                   var(--uc-inverted-colour) !important;
          
            --arrowpanel-border-color:                  var(--uc-theme-colour)    !important;
            --arrowpanel-border-radius:                 var(--uc-border-radius)   !important;
            --arrowpanel-background:                    var(--uc-theme-colour)    !important;
            --arrowpanel-color:                         var(--inverted-colour)    !important;

            --autocomplete-popup-highlight-background:  var(--uc-inverted-colour) !important;
            --autocomplete-popup-highlight-color:       var(--uc-theme-colour)    !important;
            --autocomplete-popup-hover-background:      var(--uc-hover-colour)    !important;

            --tab-block-margin: 2px !important;
        }

        #urlbar-background, #urlbar-input-container {
            border-radius: var(--uc-border-radius) !important;
        }

        window, #main-window, #toolbar-menubar, #TabsToolbar, #PersonalToolbar,
        #navigator-toolbox, #sidebar-box, #nav-bar {
            -moz-appearance: none !important;
            border: none !important;
            box-shadow: none !important;
            background: var(--uc-theme-colour) !important;
        }

        #PersonalToolbar toolbarbutton:not(:hover),
        #bookmarks-toolbar-button:not(:hover) { filter: grayscale(1) !important; }

        .tabbrowser-tab > .tab-stack > .tab-background { 
            box-shadow: none !important;
            background: var(--uc-theme-colour) !important; 
            border-radius: var(--uc-border-radius) !important;
        }

        .tabbrowser-tab[selected] > .tab-stack > .tab-background { 
            background: var(--uc-hover-colour) !important; 
        }

        .tabbrowser-tab[selected] .tab-context-line {
            background-color: var(--uc-identity-color-turquoise) !important;
            height: 2px !important;
        }

        #nav-bar {
            border:     none !important;
            box-shadow: none !important;
            background: transparent !important;
        }

        #urlbar-background { 
            border: 1px solid var(--secondary-colour) !important; 
        }

        #urlbar[focused="true"] > #urlbar-background {
            border: 1px solid var(--uc-identity-color-turquoise) !important;
        }

        @media (min-width: 1000px) { 
            #TabsToolbar { margin-left: var(--uc-urlbar-width) !important; }
            #nav-bar { margin: calc((var(--urlbar-min-height) * -1) - 8px) calc(100vw - var(--uc-urlbar-width)) 0 0 !important; }
        }

        .identity-color-blue      { --identity-tab-color: var(--uc-identity-color-blue)      !important; --identity-icon-color: var(--uc-identity-color-blue)      !important; }
        .identity-color-turquoise { --identity-tab-color: var(--uc-identity-color-turquoise) !important; --identity-icon-color: var(--uc-identity-color-turquoise) !important; }
        .identity-color-green      { --identity-tab-color: var(--uc-identity-color-green)      !important; --identity-icon-color: var(--uc-identity-color-green)      !important; }
        .identity-color-yellow    { --identity-tab-color: var(--uc-identity-color-yellow)     !important; --identity-icon-color: var(--uc-identity-color-yellow)     !important; }
        .identity-color-orange    { --identity-tab-color: var(--uc-identity-color-orange)     !important; --identity-icon-color: var(--uc-identity-color-orange)     !important; }
        .identity-color-red       { --identity-tab-color: var(--uc-identity-color-red)        !important; --identity-icon-color: var(--uc-identity-color-red)        !important; }
        .identity-color-pink      { --identity-tab-color: var(--uc-identity-color-pink)       !important; --identity-icon-color: var(--uc-identity-color-pink)       !important; }
        .identity-color-purple    { --identity-tab-color: var(--uc-identity-color-purple)     !important; --identity-icon-color: var(--uc-identity-color-purple)     !important; }
      '';
    };
  };
}
