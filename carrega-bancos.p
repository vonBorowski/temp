
def var l-banco-dev as log no-undo.
def var l-banco-gus as log no-undo.
def var l-banco-f7  as log no-undo.

def button bt-carrega label "Carrega" auto-endkey.

form l-banco-dev  view-as toggle-box label "Banco DEV"         at 5
     l-banco-gus  view-as toggle-box label "Banco GUS DEV"     at 5
     l-banco-f7   view-as toggle-box label "Banco Fator7"      at 5
     bt-carrega
     with width 50 1 col frame f-main title "Carrega Bancos".

on choose of bt-carrega do:
   run p-carrega.
   return "ok":U.
end.

on window-close of current-window do:
   return "error":U.
end.

update l-banco-dev
       l-banco-gus
       l-banco-f7
       bt-carrega
       with frame f-main view-as dialog-box three-d.

enable all with frame f-main.

wait-for window-close of current-window.


procedure p-carrega:
   do with frame f-main:
      if l-banco-dev:checked then connect value("-db dbs -ld dev -H srvhpi -S dbsd -U costa -P gis").
      if l-banco-gus:checked then connect value("-db dbsu -ld gusd -H srvhpu -S 7010").
      if l-banco-f7:checked  then connect value("-db c:\Users\giuliano.borowski\wrk\db\dbsf7.db -ld f7 -1").
   end.
end procedure.

