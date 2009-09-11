snippet #!
        #!/usr/bin/python
#coding
snippet #-
        # -*- coding: ${1:coding} -*-
       
snippet wh
        while ${1:condition}:
                ${2:# code...}
snippet for
        for ${1:needle} in ${2:haystack}:
                ${3:# code...} # New Class
snippet cl
        class ${1:ClassName}(${2:object}):
                """${3:docstring for $1}"""
                def __init__(self, ${4:arg}):
                        ${5:super($1, self).__init__()}
                        self.$4 = $4
                        ${6}
# New Function
snippet def
        def ${1:fname}(${2:`indent('.') ? 'self' : ''`}):
                """${3:docstring for $1}"""
                ${4:pass}
# New Method
snippet defs
        def ${1:mname}(self, ${2:arg})):
                ${3:pass}
# New Property
snippet property
        def ${1:foo}():
                doc = "${2:The $1 property.}"
                def fget(self):
                                ${3:return self._$1}
                def fset(self, value):
