var rubicontag=rubicontag||{};rubicontag.video=rubicontag.video||function(){var video={slots:{},getAllSlots:function(){var slots=[];for(var id in this.slots){if(this.slots.hasOwnProperty(id)){slots.push(this.slots[id])}}return slots},defineSlot:function(id,definition){function Slot(id,definition){this.id=id;this.definition=definition;this._is_ready=false;this.rawResponses=[]}var slot=new Slot(id,definition);this.slots[id]=slot;Slot.prototype.getAds=function(){var ads=[];var rawResponses=this.getRawResponses();for(var i=0;i<rawResponses.length;++i){ads=ads.concat(rawResponses[i].ads)}return ads};Slot.prototype.getBestCpm=function(){var ads=this.getAds();ads.sort(function(a,b){if(a.cpm<b.cpm){return 1}else if(a.cpm>b.cpm){return-1}return 0});return ads[0]};Slot.prototype.getRawResponses=function(){return this.rawResponses}},_sendRequest:function(slot){var query="?";for(var key in slot.definition){if(slot.definition.hasOwnProperty(key)){query+="&"+key+"="+encodeURIComponent(slot.definition[key])}}query=query.replace(/^\?&/,"?");var xhr=new window.XMLHttpRequest;xhr.open("GET",[window.location.protocol==="http:"?"http:":"https:","//","thm.aws.rubiconproject.com","/fastlane/vulcan",query].join(""),true);xhr.onreadystatechange=function(){if(xhr.readyState===4){slot._is_ready=true;if(xhr.status===200){var rawResponse=JSON.parse(xhr.responseText);slot.rawResponses.push(rawResponse)}}};xhr.withCredentials=true;xhr.send()},run:function(cb){var slots=this.getAllSlots();for(var i=0;i<slots.length;++i){this._sendRequest(slots[i])}this._wait(cb)},_wait:function(cb){var slots=this.getAllSlots();var hasResponse=[];for(var i=0;i<slots.length;++i){hasResponse[i]=!!slots[i].rawResponses.length}var bool=true;for(i=0;i<hasResponse.length;++i){bool=bool&&hasResponse[i]}if(bool){cb()}else{setTimeout(this._wait.bind(this),75,cb)}}};return video}();