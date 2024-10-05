'use strict';

exports.handler = async (event) => {
    const request = event.Records[0].cf.request;
    let uri = request.uri;
    // Check if the URI already ends with .html or has a file extension
    if (!uri.endsWith('.html') && !uri.includes('.') && (uri.includes('blog') || uri.includes('contact'))) {
        request.uri = `${uri}.html`;
    }
    
    if (uri.includes('categories')) {
        request.uri = `${uri}/index.html`;
    }

    return request;
}