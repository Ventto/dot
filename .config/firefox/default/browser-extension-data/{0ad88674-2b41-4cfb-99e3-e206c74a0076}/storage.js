{"customCSS":"body.dark-theme {\n  --tab-background-normal: 210, 9.289%, 21.045%;\n  --tab-background-pinned: 210, 9.289%, 21.045%;\n  --tab-background-active: 221, 41.4%, 53.1%;\n  --tab-background-hover: 222, 28.3%, 35.55%;\n  --tab-border-color: hsla(0, 0%, 0%, 0.06);\n  --menu-background: hsl(210, 9.289%, 21.045%);\n}\n\n#pinnedtablist {\n  box-shadow: 0px 1px 0px hsla(0, 0%, 0%, 0.2);\n  z-index: 1;\n}\n\n#pinnedtablist .tab:last-of-type {\n  border-bottom: none;\n}\n\n#newtab {\n  margin-left: -1px;\n}\n\n#newtab-icon {\n  margin-right: 8px !important;\n}\n\n#searchbox {\n  padding: 0px;\n}\n\n#newtab,\n#settings{\n  display: none;\n}\n\n.tab-context {\n  height: calc(100% + 1px);\n  position: relative;\n  top: 0.5px;\n}\n\n#pinnedtablist .tab:last-of-type .tab-context {\n  height: 100%;\n  top: 0px;\n}\n\n/* Loading burst */\n.tab-loading-burst, .tab-loading-burst:before {\n  display: block;\n}\n\nbody.dark-theme .tab:not(.active) .tab-loading-burst.bursting::before {\n  filter: invert(100%);\n}"}