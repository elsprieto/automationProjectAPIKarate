function () {
return {
        extractTuples: function(objectResult){

                              var tuples = [];
                               for (var key in objectResult) {
                                   if (objectResult.hasOwnProperty(key)) {
                                     var id = objectResult[key].id;
                                     var name = objectResult[key].name;
                                     tuples.push({ id: id, name: name });
                                   }
                                 }
                                 return tuples;
                            }
       }
    }
