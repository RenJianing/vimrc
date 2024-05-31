## 1. INSTALL

1.1. Get an Awesome version  https://github.com/amix/vimrc

```
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```

1.2. Get vim plug to manage the plugins:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

1.3. Install ctags and cscope:

```
apt install ctags cscope
```

1.4. Edit my_configs.vim:

```
cp my_configs.vim ~/.vim_runtime/
```

1.5. Open a doc with vim and run command:

```
:PlugInstall
```


## USEAGE

Search file in vim:
"\"+"f"

Search symbol in vim:
'Ctrl+f' and 'Enter'

Select target with:
'Ctrl+j' and 'Ctrl+k'

and jump to taget with:
'Enter'

Jump back with:
'Ctrl+o'

To enable ctags for a project, please put a empty ".root" file in projet
root directory, then the vim will generate the Ctags automatically.

## Troubleshoot

### python support

Debian 9:

```
Error: LeaderF requires vim compiled with +python or +python3
```

Need install vim plugin to fix

```
sudo apt install vim-nox
```

Another options is:

```
sudo apt install vim-gnome-py2
```
### taglist

- error when switching tab with 'gT':

```
Error detected while processing function <SNR>29_Tlist_Refresh_Folds
```

```shell
diff --git a/plugin/taglist.vim b/plugin/taglist.vim
index 59901f6..dd8e72c 100644
--- a/plugin/taglist.vim
+++ b/plugin/taglist.vim
@@ -4097,6 +4097,10 @@ endfunction
 " window. Used after entering a tab. If this is not done, then the folds
 " are not properly created for taglist windows displayed in multiple tabs.
 function! s:Tlist_Refresh_Folds()
+    if g:Tlist_Show_One_File
+        return
+    endif
+
     let winnum = bufwinnr(g:TagList_title)
     if winnum == -1
         return
```

### vim-mark

```sh
Error detected while processing /Users/renjianing/.vim/plugged/vim-mark/plugin/mark.vim:
line  264:
E227: Mapping already exists for ,m
line  267:
E227: Mapping already exists for ,m
line  274:
E227: Mapping already exists for ,r
line  277:
E227: Mapping already exists for ,n
Press ENTER or type command to continue
```

Find the conflicting configurations and delete it!

```sh
deck@steamdeck ~/.vim_runtime (master)> grep -rni '<leader>[m,n,r]' .
./vimrcs/basic.vim:323:noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
./vimrcs/plugins_config.vim:95:map <leader>nn :NERDTreeToggle<cr>
./vimrcs/plugins_config.vim:96:map <leader>nb :NERDTreeFromBookmark<Space>
./vimrcs/plugins_config.vim:97:map <leader>nf :NERDTreeFind<cr>
./vimrcs/extended.vim:126:" When you press <leader>r you can search and replace the selected text
./vimrcs/extended.vim:127:vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
./vimrcs/extended.vim:135:"   <leader>n
./vimrcs/extended.vim:142:map <leader>n :cn<cr>
```
