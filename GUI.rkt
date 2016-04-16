#lang racket

(require racket/gui/base)

;Gui creation functions below


(define (new_menu alabel) (new menu% ;Creats a menu
                             [label alabel]
                             [parent mymenubar]))

(define (menu-item alabel aparent afunc) (new menu-item% ;Creates a menu item
                                             [label alabel]
                                             [parent aparent]
                                             [callback (lambda (item event)(eval afunc))]))

(define (menu-separator aparent) (new separator-menu-item% [parent aparent])) ;Creates separator

(define (mybutton the_parent the_label the_width the_height the_func) ;Creates button with function
                 (new button%
                     [parent the_parent]
                     [label the_label]
                     [min-width the_width]
                     [min-height the_height]
                     [callback (lambda (button event) (eval the_func))]))

;A gui below
(define myframe (new frame%
                     [width 100]
                     [height 100]
                     [label "test"]))

(define mymenubar (new menu-bar% [parent myframe]))

(define mymsg (new message%
                 [parent myframe]
                 [label "Nope"]
                 [min-width 50]))

(define menues (let* (
                     [file (new_menu "File")]
                       [New (menu-item "New" file '(send mymsg set-label "New"))]
                       [Open (menu-item "open" file '(send mymsg set-label "Open"))]
                       [Save (menu-item "Save" file '(send mymsg set-label "Save"))]
                       [separator (menu-separator file)]
                       [Other (menu-item "Other" file '(send mymsg set-label "Other"))]

                     [Edit (new_menu "Edit")]
                     [Help (new_menu "Help")]
                     )
                 '()))

(define buttons (let (
                    [button_1 (mybutton myframe "crap1" 50 30 '(send mymsg set-label "crap1"))]
                    [button_2 (mybutton myframe "crap2" 100 50 '(send mymsg set-label "crap2"))]
                  )
                  '()))

(send myframe show #t)

