export function authHeader(contentType) {
    // return authorization header with jwt token
    let user = JSON.parse(localStorage.getItem('tokenuser'));

    if(contentType == "skip") {
    	if (user && user.data.access_token) {
	        return { 'Authorization': 'Bearer ' + user.data.access_token };
	    } else {
	        return {};
	    }
    }else {
    	if (user && user.data.access_token) {
	        return { 'Authorization': 'Bearer ' + user.data.access_token, 'content-type': 'application/json' };
	    } else {
	        return {};
	    }
    }
}