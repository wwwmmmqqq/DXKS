
Array.prototype.contains = function (obj) {
    var i = this.length;
    while (i--) {
        if (this[i] === obj) {  
            return true;
        }
    }
    return false; 
};
Array.prototype.remove = function (obj) {
	if(this.length === 1) {
		this.length = 0;
	}
	var i;
	for(i=0;i<this.length;i++) {
		if(obj===this[i]) {
			break;
		}
	}
	if(i<this.length) {
		for(var j=i;j<this.length-1;j++) {
			this[j] = this[j+1];
		}
		this.length--;
	}
};