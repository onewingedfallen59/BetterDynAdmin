command=
    funct:litteral params:(_ param)*
    {
         var res = {
             funct:funct,
            params:[]
         }
        for (var i = 0; i < params.length; i++) {
            res.params.push(params[i][1]);
        }
        return res;
    }
param=
    this
    /   componentProperty
    /   componentPath
    /   componentRef
    /   value
    /   output
    /   varRef

this=
    "@this"
    {
        return {
            type : 'this'
        }
    }

value=
    value:litteral
    {
        return {
            type:'value',
            value:value
        }
    }


    
varRef=
    "$" name:litteral
    {
        return {
            type : 'varRef',
            name:name
        }
    }

output=
    ">" name:litteral
    {
        return {
            type : 'output',
            name:name
        }
    }
    
componentProperty=
    component:(componentPath / componentRef )  "." property:litteral
    {
         return {
            type : 'componentProperty',
            component:component,
            property:property,
        } 
    }
    
componentRef=
    "@" name:litteral
    {
        return {
            type : 'componentRef',
            name:name
        }
    }

componentPath=
    path:componentName
    {
        return {
            type : 'componentPath',
            path:path
        }
    }  
  
componentName=
     $("/"litteral)+

litteral=
    $[a-zA-Z-:]+
    
_ "whitespace"
  = [ \t]*