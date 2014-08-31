# -*- coding: utf-8 -*-

Plugin.create(:new_tab_on_new_pane) do
  filter_gui_join_new_tab do |pane, tab, index|
    if tab.slug =~ /profile-.*/ || tab.slug =~ /conversation-*/
      window = pane.ancestor_of(Plugin::GUI::Window)
      if window
        pane = Plugin::GUI::Pane.instance
        window << pane
      else
        error "window not found."
      end
    end
    [pane, tab, index]
  end
end
