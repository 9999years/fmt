#lang racket

(abc ; def
)

(; def
 abc)

(abc
 def ; ghi
    )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


'(abc ; def
 )

'(; def
 abc)

'(abc
 def ; ghi
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#;(abc ; def
  )

#;(; def
  abc)

#;(abc
  def ; ghi
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#; ; abc
def

' ; abc
def

#; 'abc

'#;abc
def

#;#;#;
a
b
c



' ; abc
' ; def
g


(let loop)


(foo 'abc

     def)