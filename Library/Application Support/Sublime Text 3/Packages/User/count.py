import sublime
import sublime_plugin


class CountWordsInSelectionCommand(sublime_plugin.EventListener):
    def on_selection_modified(self, view):
        sel = view.sel()
        if len(sel) == 1 and sel[0].size() == 0:
            status = ""
        else:
            count = 0
            for region in sel:
                for i in range(region.begin(), region.end()):
                    if view.classify(i) & sublime.CLASS_WORD_START:
                        count += 1
            status = "{} words".format(count)
        view.set_status("words_in_selection", status)
