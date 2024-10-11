! Solutions Consulting Enterprise © 2024 by Dmitry Matveyev is licensed under CC BY-NC-SA 4.0.
! To view a copy of this license, visit https://creativecommons.org/licenses/by-nc-sa/4.0/
USING: kernel sequences
io io.files io.pathnames io.encodings.utf8 ;
IN: sce.resources

: resource-path ( filename -- path )
    "vocab:sce/resources/_resources/" swap append absolute-path ;

: read-resource ( filename -- str )
    resource-path utf8 [ read-contents ] with-file-reader ;

: note ( -- str )
    "note.txt" read-resource ;
