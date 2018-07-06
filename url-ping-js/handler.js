"use strict"

const request = require("request");

module.exports = (context, callback) => {

    
    if(!context||!context.length) {
        callback(undefined, {status: "submit a URL for the ping"});    
    }

    request.get(context, (err, res, body) => {
        if(err) {
            return callback(err, {});    
        }

        return callback(undefined, {status: "done", code: res.statusCode });
    });
}
