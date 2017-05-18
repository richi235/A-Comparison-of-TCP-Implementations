var naMediaAd = naMediaAd || function() {
 function e(e, t) {
  return function() {
   for (var n, a = [], i = 0; i < arguments.length; i++) a[i] = arguments[i];
   return (n = e && e[t]) ? (o.logger && o.logger._log("INFO", "API", "", "API Funktion " + t + "(" + a.toString() + ") aufrufen"), 
   n.apply(e, arguments)) : void 0;
  };
 }
 function t(e, t, n) {
  e[t] = n.call(e);
 }
 function n(e, t, n) {
  var a = function() {};
  a.prototype = t.prototype, e.prototype = new a(), e.prototype.constructor = e, n && (e.prototype.namespace = n), 
  e.superClass = t;
 }
 function a(e) {
  var t = arguments.callee.caller;
  return function() {
   t.superClass.apply(e, arguments);
  };
 }
 function i(e, t, n) {
  t || (t = {});
  var a = n === !0 ? Array.prototype.push : Array.prototype.unshift;
  for (var i in e) t[i] || (t[i] = []), a.call(t[i], e[i]);
  return t;
 }
 function u() {
  s && d && l && c && (o.logger._log("INFO", "", "", "TARGETING_DONE"), o.evt.triggerEvent("TARGETING_DONE"));
 }
 function r() {
  if (o.evt.addEventHandler("THIRD_PARTY_LOADED", function() {
   "true" == o.data.getValue("gpt") ? (window.googletag = window.googletag || {}, googletag.cmd = googletag.cmd || [], 
   googletag.cmd.push(o.ad.q._run)) : o.ad.q._run();
  }), "true" == o.data.getValue("async")) {
   if (o.evt.addEventHandler("DOM_READY", function() {
    o.utils._getScript("//utils.adadapter.netzathleten-media.de/API-1.0/utils/async-ps-2015-12-14.min.js", function() {
     o.evt.triggerEvent("THIRD_PARTY_LOADED");
    }, !1);
   }), "true" == o.data.getValue("gpt")) {
    var e = document.createElement("script");
    e.type = "text/javascript", e.onerror = function(e) {}, e.src = "//www.googletagservices.com/tag/js/gpt.js", 
    e.async = !0;
    var t = document.getElementsByTagName("script")[0];
    t.parentNode.insertBefore(e, t);
   }
  } else "true" == o.data.getValue("gpt") && document.write('<script src="//www.googletagservices.com/tag/js/gpt.js"></script>'), 
  o.evt.triggerEvent("THIRD_PARTY_LOADED");
 }
 var o = {};
 t(o, "logger", function() {
  function e(e) {
   var t, n, a, i, u;
   this.init = function(e) {
    t = e.name, n = e.level, a = e.namespace, i = e.eventName, u = e.message;
   }, this.getName = function() {
    return t;
   }, this.getLevel = function() {
    return n;
   }, this.getNamespace = function() {
    return a;
   }, this.getEventName = function() {
    return i;
   }, this.getMessage = function() {
    return u;
   }, this.init(e);
  }
  function t(t, n, a, u) {
   if (i(t)) {
    var o = s[t];
    o.namespace = n, o.eventName = a, o.message = u;
    var d = new e(o);
    r.push(d);
   }
  }
  function n() {
   var e, t, n, a, u = 0, d = arguments.length;
   if (e = 1 == d ? "WARN" : arguments[u++], i(e) && ("string" != typeof arguments[u] || (t = arguments[u++], 
   o.evt.tree._isValidNamespace(t) || "API" == t)) && ("string" != typeof arguments[u] || (n = arguments[u++], 
   o.evt._isValidEvent(n)))) {
    a = arguments[u];
    for (var l, c = [], p = s[e].level, g = 0; g < r.length; g++) l = r[g], !(l.getLevel() >= p) || n && l.getEventName() != n || t && l.getNamespace() != t || (c.push(l), 
    a && a(l.getName(), l.getMessage()));
    return c;
   }
  }
  function a() {
   var e = Array.prototype.slice.call(arguments, 0);
   e.push(function(e, t) {
    var n = console[u(e)];
    (n = n.bind(console))(t);
   });
   n.apply(this, e);
  }
  function i(e) {
   if (e) {
    if (s[e]) return !0;
    t("WARN", "", "", "ILLEGAL logLevel " + e);
   } else t("ERROR", "", "", "MISSING logLevel");
   return !1;
  }
  function u(e) {
   return s[e].console;
  }
  !function() {
   for (var e, t = [ "assert", "cd", "clear", "count", "countReset", "debug", "dir", "dirxml", "error", "exception", "group", "groupCollapsed", "groupEnd", "info", "log", "markTimeline", "profile", "profileEnd", "select", "table", "time", "timeEnd", "timeStamp", "timeline", "timelineEnd", "trace", "warn" ], n = t.length, a = window.console = window.console || {}, i = function() {}; n--; ) e = t[n], 
   a[e] || (a[e] = i);
  }();
  var r = [], s = {
   TRACE: {
    name: "TRACE",
    level: 0,
    console: "debug"
   },
   DEBUG: {
    name: "DEBUG",
    level: 1,
    console: "debug"
   },
   INFO: {
    name: "INFO",
    level: 2,
    console: "info"
   },
   WARN: {
    name: "WARN",
    level: 3,
    console: "warn"
   },
   ERROR: {
    name: "ERROR",
    level: 4,
    console: "error"
   },
   FATAL: {
    name: "FATAL",
    level: 5,
    console: "error"
   }
  };
  return {
   console: a,
   _log: t
  };
 }), t(o, "evt", function() {
  function e(e) {
   var t, n, a, i, u;
   this.init = function(e) {
    t = e.name, n = e.namespace, a = e.once, i = e.expost;
   }, this.setNext = function(e) {
    u = e;
   }, this.getNext = function() {
    return u;
   }, this.getName = function() {
    return t;
   }, this.hasNamespace = function() {
    return n;
   }, this.isOnce = function() {
    return a;
   }, this.isExpost = function() {
    return i;
   }, this.init(e);
  }
  function t(e, t) {
   E[e] = t;
  }
  function n(e) {
   return E[e];
  }
  function a() {
   return E;
  }
  function i(e) {
   return n(e).getNext();
  }
  function u(e) {
   if (e) {
    if (E[e]) return !0;
    o.logger._log("WARN", "", "", "ILLEGAL eventName " + e);
   } else o.logger._log("ERROR", "", "", "MISSING eventName");
   return !1;
  }
  function r(e, t) {
   if (!u(e)) return !1;
   if (!o.evt.tree._isValidNamespace(t)) return !1;
   var a = n(e);
   return "undefined" == typeof a.hasNamespace() || t && a.hasNamespace() || !t && !a.hasNamespace() ? !0 : (o.logger._log("WARN", "", e, "ILLEGAL Kombination aus Event und Namespace (" + e + "," + (t || "") + ")"), 
   !1);
  }
  function s() {
   var a, i;
   for (a in v) i = new e(v[a]), t(a, i);
   for (a in v) {
    i = n(a);
    var u = n(v[a].next);
    i.setNext(u);
   }
  }
  function d(e, t) {
   if (!r(e, t)) return void o.logger._log("DEBUG", t, e, "SKIP Event (" + [ e, t ] + ") triggern");
   var n = o.evt.tree._getNode(t);
   if (t) {
    var a = o.evt.tree._getLeaves(n);
    l(e, a);
   } else p(e, n, i);
  }
  function l(e, t) {
   var n = t && t.shift();
   n && (p(e, n, i), l(e, t));
  }
  function c(e, t) {
   var n = t, a = [];
   do a.push(n); while (n = n.getParent());
   if (a.length > 0) for (;n = a.pop(); ) o.logger._log("TRACE", n.getNamespace(), e, "Event (" + [ e, n.getNamespace() ] + ") triggern"), 
   _(e, n);
  }
  function p(e, t, n) {
   c(e, t);
   var a = n.call(this, e);
   a && p(a.getName(), t, n);
  }
  function g(e, t) {
   var n, a;
   this.init = function() {
    n = !1, a = function() {
     t && t.skip === !0 || e.call(t) === !1 && (t.skip = !0);
    };
   }, this.isExecuted = function() {
    return n;
   }, this.callEventHandler = function() {
    n = !0, a();
   }, this.isExecutable = function(e) {
    return !(e.isOnce() && this.isExecuted());
   }, this.init();
  }
  function f(e) {
   if (e) {
    if ("function" == typeof e) return !0;
    o.logger._log("WARN", "", "", "ILLEGAL EventHandler " + e);
   } else o.logger._log("ERROR", "", "", "MISSING EventHandler");
   return !1;
  }
  function h(e, t, n, a) {
   if (!f(t)) return void o.logger._log("DEBUG", n, e, "SKIP EventHandler (" + t + ") registrieren");
   if (!r(e, n)) return void o.logger._log("DEBUG", n, e, "SKIP EventHandler (" + t + ") registrieren");
   var i = new g(t, a);
   n ? (A[n] || (A[n] = {}), A[n][e] || (A[n][e] = []), A[n][e].push(i)) : (A[e] || (A[e] = []), 
   A[e].push(i));
  }
  function m(e, t, n) {
   var a = {
    focus: "onfocus",
    blur: "onblur",
    scroll: "onscroll",
    click: "onclick",
    mousemove: "onmousemove",
    load: "onload",
    unload: "onunload",
    message: "onmessage",
    resize: "onresize"
   };
   document.addEventListener ? e.addEventListener(t, n, !1) : e.attachEvent && a[t] && e.attachEvent(a[t], n);
  }
  function _(e, t) {
   var a, i, u = t.getNamespace(), r = n(e);
   if (u) {
    if (A[u] && A[u][e]) for (a = 0; a < A[u][e].length; a++) i = A[u][e][a], i.isExecutable(r) && (o.logger._log("DEBUG", u, e, "EventHandler (" + e + ", " + u + ") ausführen"), 
    A[u][e][a].callEventHandler());
   } else if (A[e]) for (a = 0; a < A[e].length; a++) i = A[e][a], i.isExecutable(r) && (o.logger._log("DEBUG", "", e, "EventHandler (" + e + ") ausführen"), 
   A[e][a].callEventHandler());
  }
  var E = {}, A = {}, v = {
   INIT: {
    name: "INIT",
    next: "BEFORE_START",
    once: !0,
    expost: !1
   },
   BEFORE_START: {
    name: "BEFORE_START",
    next: "START",
    namespace: !0,
    once: !0,
    expost: !1
   },
   START: {
    name: "START",
    next: "COMPLETE",
    namespace: !0,
    once: !0,
    expost: !1
   },
   COMPLETE: {
    name: "COMPLETE",
    namespace: !0,
    once: !0,
    expost: !0
   },
   ADTAG_LOADED: {
    name: "ADTAG_LOADED",
    next: "COMPLETE",
    once: !0,
    expost: !1
   },
   DOM_READY: {
    name: "DOM_READY",
    namespace: !1,
    once: !0,
    expost: !0
   },
   WINDOW_LOAD: {
    name: "WINDOW_LOAD",
    namespace: !1,
    once: !0,
    expost: !0
   },
   THIRD_PARTY_LOADED: {
    name: "THIRD_PARTY_LOADED"
   },
   TARGETING_DONE: {
    name: "TARGETING_DONE"
   },
   NUGGAD_DONE: {
    name: "NUGGAD_DONE"
   },
   AMZN_DONE: {
    name: "AMZN_DONE"
   },
   DOCCHECK_DONE: {
    name: "DOCCHECK_DONE"
   },
   YIELDLAB_DONE: {
    name: "YIELDLAB_DONE"
   }
  };
  return s(), {
   addEventHandler: h,
   triggerEvent: d,
   _isValidEvent: u,
   _getEvents: a,
   _addDomEventListener: m
  };
 }), t(o.evt, "tree", function() {
  function e(e) {
   var t, n, a, i;
   this.init = function(e) {
    t = e.namespace, n = e.parent, a = e.constr, i = [];
   }, this.getNamespace = function() {
    return t;
   }, this.setParent = function(e) {
    n = e;
   }, this.getParent = function() {
    return n;
   }, this.addChild = function(e) {
    return i.push(e), e.setParent(this), e;
   }, this.getChildren = function() {
    return i;
   }, this.getConstructor = function() {
    return a;
   }, this.init(e);
  }
  function t(e) {
   return e.namespace || e.constr ? !0 : (o.logger._log("WARN", "", "", "ILLEGAL Node Konfiguration"), 
   !1);
  }
  function n(e, t) {
   return e ? r(e, t) : a();
  }
  function a() {
   return c;
  }
  function i(a, i) {
   if (t(a) || o.logger._log("DEBUG", "", "", "SKIP Knoten als Kind von " + i + " erzeugen"), 
   !u(i)) return void o.logger._log("DEBUG", "", "", "SKIP Knoten " + a.namespace + " als Kind von " + i + " erzeugen");
   var r = n(i), s = new e(a);
   return r.addChild(s);
  }
  function u(e) {
   return e && "undefined" == typeof n(e) ? (o.logger._log("WARN", "", "", "ILLEGAL namespace " + e), 
   !1) : !0;
  }
  function r(e, t) {
   t || (t = a());
   var n;
   if (e == t.getNamespace()) n = t; else for (var i = t.getChildren(), u = 0; u < i.length && !(n = r(e, i[u])); u++) ;
   return n;
  }
  function s(e, t) {
   e || (e = a()), !t && (t = []);
   var n = e.getChildren();
   if (0 === n.length) t.push(e); else for (var i = 0; i < n.length; i++) s(n[i], t);
   return t;
  }
  function d() {
   c = new e(p);
  }
  function l(e, t) {
   e || (e = a());
   var n, i = "";
   if (t) for (n = 0; t > n; n++) i += " ";
   var u = e.getChildren();
   for (n = 0; n < u.length; n++) l(u[n], t && t + 2 || 2);
  }
  var c, p = {
   name: ""
  };
  return d(), {
   _isValidNamespace: u,
   _addChild: i,
   _getNode: n,
   _getLeaves: s,
   _preOrder: l
  };
 }), t(o, "data", function() {
  function e(e, t) {
   var n, a;
   this.init = function(e, t) {
    n = e, a = t;
   }, this.getKey = function() {
    return n;
   }, this.setValue = function(e) {
    a = e;
   }, this.getValue = function() {
    return a;
   }, this.init(e, t);
  }
  function t(e) {
   var t, n, a;
   this.init = function(e) {
    a = e.values, this.setValue(e.value), this.isValid(e._default) && (n = e._default);
   }, this.isValid = function(e) {
    return a[e] ? !0 : !1;
   }, this.getDefault = function() {
    return "undefined" != typeof n ? a[n] : void 0;
   }, this.getValue = function(e) {
    var n;
    return e && (n = a[e]), "undefined" == typeof n && "undefined" != typeof t && (n = a[t]), 
    n;
   }, this.setValue = function(e) {
    return this.isValid(e) ? void (t = e) : !1;
   }, this.addValidValue = function(e) {
    a[e.getKey()] = e;
   }, this.getValidValues = function() {
    return a;
   }, this.init(e);
  }
  function n(n, a) {
   var i, u = {};
   for (var r in a) {
    var o = a[r];
    if ("_default" == r) i = o; else {
     var s = new e(r, o);
     u[r] = s;
    }
   }
   var d = new t({
    values: u,
    _default: i
   });
   p[n] = d;
  }
  function a(e) {
   if (e) {
    if (i(e)) return !0;
   } else o.logger._log("ERROR", "", "", "MISSING name");
   return !1;
  }
  function i(e) {
   return p[e];
  }
  function u(e, t, n) {
   "function" == typeof t ? (n = t, t = "") : "function" != typeof n && (n = function(e) {
    return e.getValue();
   });
   var u, r;
   return a(e) ? (r = i(e), u = r.getValue(t) || r.getDefault(t), u && n(u, name, t)) : void o.logger._log("DEBUG", "", "", "SKIP getter (" + [ e, t ] + ")");
  }
  function r(e) {
   var t, n, u = [];
   if (!a(e)) return void o.logger._log("DEBUG", "", "", "SKIP getter (" + e + ")");
   n = i(e), t = n.getValidValues();
   for (e in t) u.push(t[e].getValue());
   return u;
  }
  function s(e, t, n) {
   var a = i(e), u = !1;
   return a && (u = a.setValue(t, n) !== !1), u ? o.logger._log("DEBUG", "", "", "SET '" + e + "=" + t + "'") : "pz" == e || "adv" == e || "n_pbt" == e ? (l(e, t), 
   u = !0) : t !== !1 && "false" !== t || !e || (n = e.toUpperCase(), o.data.getValue("adMedium", n) ? (o.ad._disableAdMedium(n), 
   u = !0) : o.logger._log("WARN", "", "", "ILLEGAL Konfiguration '" + e + "=" + t + "'")), 
   u;
  }
  function d() {
   return u("version");
  }
  function l(t, a) {
   o.logger._log("DEBUG", "", "", "PERSIST '" + t + "=" + a + "'");
   var u = i(t);
   if (u) {
    var r = new e(a, a);
    i(t).addValidValue(r);
   } else {
    var d = {
     _default: a
    };
    d[a] = a, n(t, d);
   }
   s(t, a);
  }
  function c(e) {
   if (e) for (var t in e) {
    var a = e[t];
    n(t, a);
   }
  }
  var p = {}, g = {
   version: {
    _default: "now",
    now: "2016-11-24 09:30:24.679"
   },
   apikey: {
    _default: "key",
    key: "NA-828433-1"
   },
   async: {
    _default: "async",
    async: "true"
   },
   psi: {
    _default: "psi",
    psi: "true"
   },
   gpt: {
    _default: "gpt",
    gpt: "true"
   },
   gptSra: {
    _default: "true",
    "false": "false",
    "true": "true"
   },
   gptLazy: {
    _default: "true",
    "false": "false",
    "true": "true"
   },
   gptAsyncRendering: {
    _default: "true",
    "false": "false",
    "true": "true"
   },
   tile: {
    _default: "0",
    "0": 0
   },
   ord: {
    _default: "ord",
    ord: Math.round(1e7 * Math.random())
   },
   site: {
    _default: "site",
    site: "ew_de.wikia.com"
   },
   domain: {
    _default: "domain",
    domain: "de.wikia.com"
   },
   abp: {
    _default: "false",
    "false": "false",
    "true": "true"
   },
   vertical: {
    _default: "entertainweb",
    entertainweb: "ew",
    vtm: "vtm"
   },
   channel: {
    _default: "alle",
    alle: "games",
    games: "games",
    movies: "movies",
    serien: "serien",
    "Gaming und Entertainment": "entertainment"
   },
   rel_channel_vertical: {
    _default: "games",
    games: "entertainweb",
    games: "entertainweb",
    movies: "entertainweb",
    serien: "entertainweb",
    entertainment: "vtm"
   },
   zone: {
    _default: "ew",
    home: "home",
    sport: "sport",
    party: "party",
    horrormov: "horrormov",
    comicmov: "comicmov",
    nonus: "nonus",
    subsite: "subsite",
    ew: "ew",
    action: "action",
    strategie: "strategie",
    actionmov: "actionmov",
    familymov: "familymov",
    us: "us"
   },
   marketer: {
    _default: "ip",
    ip: "ip"
   },
   login: {
    "true": "login",
    "false": "public",
    _default: "false"
   },
   homesite: {
    "true": "home",
    "false": "subsite",
    _default: "false"
   },
   forum: {
    "true": "ja",
    "false": "nein",
    _default: "false"
   },
   sz: {
    ANCHOR: [ "1000x200" ],
    AUTONATIVE: [ "620x400" ],
    BANDEROLE: [ "400x400" ],
    BIG_BILLBOARD: [ "970x250" ],
    BILLBOARD: [ "800x250" ],
    CONTENT_ROLLOVER: [ "500x550" ],
    CONTENT_VIDEO: [ "500x700" ],
    CUSTOM_AD: [ "450x250" ],
    EXTRA_WIDE_SKYSCRAPER: [ "300x601" ],
    HALFPAGE: [ "300x600" ],
    HEADSLIDER: [ "300x110" ],
    INIMAGE: [ "500x300" ],
    EXITEVENT: [ "900x900" ],
    EXITEVENT_AD: [ "800x250", "300x600", "728x90", "300x250" ],
    LAYER: [ "400x400" ],
    MEDIUM_RECTANGLE: [ "300x250" ],
    PREROLL: [ "320x240" ],
    PUSHDOWN: [ "728x90" ],
    SECOND_SKYSCRAPER: [ "160x601" ],
    SITEBAR: [ "300x601" ],
    SKINNING: [ "1000x600" ],
    SKYSCRAPER: [ "120x600" ],
    SUPERBANNER: [ "728x90" ],
    SUPERBANNER_EXP: [ "728x90" ],
    SUPER_WIDE_SKYSCRAPER: [ "200x600" ],
    TEASER_H: [ "594x184" ],
    TEASER_V: [ "500x600" ],
    WALLPAPER: [ "928x600" ],
    WALLPAPER_EXP: [ "928x600" ],
    WIDE_SKYSCRAPER: [ "160x600" ],
    WIDE_SKYSCRAPER_EXP: [ "300x601" ],
    TOP: [ "300x150", "320x150", "300x100", "320x100", "300x75", "320x75", "300x50", "320x50" ],
    MID: [ "300x250", "300x75", "320x75", "300x50", "320x50" ],
    BOTTOM: [ "300x50", "320x50" ]
   },
   blacklist: {
    WALLPAPER: "wp=0",
    TANDEM: "td=0",
    SKINNING: "fp=0",
    SITEBAR: "sba=0"
   },
   whitelist: {
    POP_UNDER: "dcopt=ist"
   },
   device: {
    phone: "phone",
    tablet: "tablet",
    desktop: "desktop"
   },
   touch: {
    "false": 0,
    "true": 1
   },
   view: {
    mobile: "mobile",
    tablet: "tablet",
    desktop: "desktop"
   },
   vpo: {
    portrait: "p",
    landscape: "l"
   },
   vpc: {
    a: "a",
    b: "b",
    c: "c",
    d: "d",
    e: "e",
    f: "f",
    g: "g",
    h: "h"
   },
   flash: {
    "false": 0,
    "true": 1
   },
   html5: {
    "false": 0,
    "true": 1
   },
   ylasname: {
    _default: "ylasname",
    ylasname: "_default",
    SUPERBANNER: "sb",
    WIDE_SKYSCRAPER: "sky",
    MEDIUM_RECTANGLE: "mr",
    HALFPAGE: "hpa",
    BILLBOARD: "bb"
   },
   ylfoid: {
    ANCHOR: "115",
    BANDEROLE: "105",
    BILLBOARD: "109",
    SUPERBANNER_EXP: "112",
    MEDIUM_RECTANGLE_EXP: "116",
    WALLPAPER_EXP: "110",
    WIDE_SKYSCRAPER_EXP: "111",
    HALFPAGE: "107",
    LAYER: "104,114",
    TANDEM_LAYER: "106",
    WALLPAPER: "101",
    WALLPAPER_BG: "102,103"
   },
   ylasid: {
    WIDE_SKYSCRAPER: "37918",
    MEDIUM_RECTANGLE: "37919",
    SUPERBANNER: "37920",
    HALFPAGE: "79834",
    BILLBOARD: "79861"
   },
   ylasfo: {
    _default: "ylasfo",
    ylasfo: "37921"
   },
   preview: {
    wallpaper: "wallpaper_2",
    wallpaper_bg: "wallpaper_3",
    wallpaper_bb: "wallpaper_bb",
    superbanner: "superbanner",
    wide_skyscraper: "wide_skyscraper",
    super_wide_skyscraper: "super_wide_skyscraper",
    large_skyscraper: "large_skyscraper",
    extra_wide_skyscraper: "extra_wide_skyscraper",
    mr: "medium_rectangle",
    medium_rectangle: "medium_rectangle",
    headslider: "headslider",
    halfpage: "halfpage",
    pushdown: "pushdown",
    skinning: "skinning",
    pop_under: "pop_under",
    layer: "layer",
    interstitial: "interstitial",
    microspecial: "microspecial",
    anchor_ad: "anchorad",
    billboard: "billboard",
    big_billboard: "big_billboard",
    teaser_h: "teaser_h",
    teaser_v: "teaser_v",
    preroll: "adid=222973412;",
    preroll1: "redirect=yes;",
    preroll2: "protocol=http;format=mp4;redirect=no;",
    preroll3: "protocol=http;format=flv;redirect=no;",
    preroll4: "protocol=rtmp;format=mp4;redirect=no;",
    preroll5: "protocol=rtmp;format=flv;redirect=no;",
    preroll6: "vastleer=true;",
    preroll_videoplaza1: "//de-dev2-ipd.videoplaza.tv/proxy/distributor/v2?s=iptest/nam&tt=p&rt=vast_2.0&t=noredirect&pf=yt&rnd=",
    preroll_videoplaza2: "//de-dev2-ipd.videoplaza.tv/proxy/distributor/v2?s=iptest/nam&tt=p&rt=vast_2.0&t=redirect&pf=yt&rnd=",
    sticky_superbanner: "sticky_superbanner",
    sticky_skyscraper: "sticky_skyscraper",
    sticky_wallpaper: "sticky_wallpaper",
    google: "google",
    exp_mr: "exp_mr",
    exp_sky: "exp_sky",
    exp_sb: "exp_sb",
    sitebar: "sitebar",
    intext: "intext",
    inimage: "inimage",
    exitevent: "exitevent",
    content_video: "content_video",
    content_rollover: "content_rollover",
    autonative: "autonative"
   }
  };
  return c(g), {
   getValue: u,
   setValue: s,
   getVersion: d,
   _putValue: l,
   _getValues: r,
   _init: c
  };
 }), t(o, "ad", function() {
  function e(e) {
   function t(e) {
    var t = e.getName();
    if (this.__options[t]) for (var n; n = this.__options[t].shift(); ) o.logger._log("TRACE", this.namespace, t, "private Instanz-Eventhandler (" + t + ", " + this.namespace + ") registrieren"), 
    o.evt.addEventHandler(t, n, this.namespace, this);
    this[t] && (o.logger._log("TRACE", this.namespace, t, "protected Instanz-Eventhandler (" + t + ", " + this.namespace + ") registrieren"), 
    o.evt.addEventHandler(t, this[t], this.namespace, this));
   }
   this.__options = e || [], e.namespace && (this.namespace = e.namespace), this.prio = e.prio || 99;
   var n = o.evt._getEvents();
   for (var a in n) t.call(this, n[a]);
   this.getNamespace = function() {
    return this.namespace;
   };
  }
  function t() {
   o.data._init(m);
  }
  function a(e, t, a, i) {
   n(e, t, a), o.evt.tree._addChild({
    namespace: a,
    constr: e
   }, t.prototype.namespace);
   for (var u in i) for (var r; r = i[u].shift(); ) o.logger._log("TRACE", a, u, "Klassen-Eventhandler (" + u + ", " + e.prototype.namespace + ") registrieren"), 
   o.evt.addEventHandler(u, r, e.prototype.namespace, e.prototype);
  }
  function i(e, t) {
   if (!p(e)) return !1;
   if ("true" === o.data.getValue("abp")) return d("ABP", {
    adType: e
   }), !1;
   var n = o.data.getValue("adSlot", e);
   o.ad.q._push({
    namespace: e,
    callback: t,
    prio: n.prio
   });
  }
  function u(e) {
   if (p(e)) {
    {
     o.data.getValue("adSlot", e, function(e) {
      return "WIDE_SKYSCRAPER" == e.getKey() && o.ad._disableAdMedium("WALLPAPER"), e.getValue().enabled = !1;
     });
    }
    o.logger._log("INFO", e, "", "AdSlot " + e + " deaktivieren");
   }
  }
  function r(e) {
   if (g(e)) {
    {
     o.data.getValue("adMedium", e, function(e) {
      return e.getValue().enabled = !1;
     });
    }
    o.logger._log("INFO", e, "", "AdMedium " + e + " deaktivieren");
   }
  }
  function s(e) {
   u(e);
  }
  function d(e, t) {
   if (!g(e)) return !1;
   var n = f(e, t);
   o.evt.triggerEvent("INIT", n.namespace);
  }
  function l() {
   return h;
  }
  function c(e, t, n) {
   var a = document.getElementById("naMediaAd_adStyle");
   null === a && (a = document.createElement("style"), a.setAttribute("id", "naMediaAd_adStyle"), 
   document.getElementsByTagName("head")[0].appendChild(a));
   var i = a.styleSheet, u = i ? a.styleSheet.cssText : "";
   if (n && g(n) && (u += "body.naMediaAd_" + n + " "), e && "#" != e.charAt(0) && g(e) ? u += ".naMediaAd_" + e : "" !== e && (u += ("#" !== e.charAt(0) ? "#" : "") + e), 
   u += "{", "object" == typeof t) for (var r in t) u += r + ":" + t[r] + ";";
   u += "}", a.styleSheet ? a.styleSheet.cssText = u : a.appendChild(document.createTextNode(u));
  }
  function p(e) {
   if (!e) return o.logger._log("ERROR", "", "", "MISSING AdSlot"), !1;
   var t = o.data.getValue("adSlot", e);
   return t ? t.enabled ? !0 : (o.logger._log("WARN", "", "", "DISABLED AdSlot " + e), 
   !1) : (o.logger._log("ERROR", "", "", "ILLEGAL AdSlot " + e), !1);
  }
  function g(e) {
   if (!e) return o.logger._log("ERROR", "", "", "MISSING AdMedium"), !1;
   var t = o.data.getValue("adMedium", e);
   return t ? t.enabled ? !0 : (o.logger._log("WARN", "", "", "DISABLED AdMedium " + e), 
   !1) : (o.logger._log("ERROR", "", "", "ILLEGAL AdMedium " + e), !1);
  }
  function f(e, t) {
   for (var n, a = o.evt.tree._getNode(e); !n && a; ) n = a.getConstructor(), a = a.getParent();
   return n ? (t = t || {}, t.namespace = e, new n(t)) : void o.logger._log("ERROR", "", e, "MISSING Ad " + e);
  }
  var h = [], m = {
   adMedium: {
    SKYSCRAPER: {
     name: "SKYSCRAPER",
     enabled: !0
    },
    WIDE_SKYSCRAPER: {
     name: "WIDE_SKYSCRAPER",
     enabled: !0
    },
    SUPER_WIDE_SKYSCRAPER: {
     name: "SUPER_WIDE_SKYSCRAPER",
     enabled: !0
    },
    MEDIUM_RECTANGLE: {
     name: "MEDIUM_RECTANGLE",
     enabled: !0
    },
    SUPERBANNER: {
     name: "SUPERBANNER",
     enabled: !0
    },
    LAYER: {
     name: "LAYER",
     enabled: !0
    },
    BANDEROLE: {
     name: "BANDEROLE",
     enabled: !0
    },
    ANCHOR: {
     name: "ANCHOR",
     enabled: !0
    },
    WALLPAPER: {
     name: "WALLPAPER",
     enabled: !0
    },
    WALLPAPER_BG: {
     name: "WALLPAPER_BG",
     enabled: !0
    },
    PUSHDOWN: {
     name: "PUSHDOWN",
     enabled: !0
    },
    HALFPAGE: {
     name: "HALFPAGE",
     enabled: !0
    },
    TANDEM: {
     name: "TANDEM",
     enabled: !0
    },
    TANDEM_LAYER: {
     name: "TANDEM_LAYER",
     enabled: !0
    },
    PREROLL: {
     name: "PREROLL",
     enabled: !0
    },
    PREROLL_30: {
     name: "PREROLL_30",
     enabled: !0
    },
    BILLBOARD: {
     name: "BILLBOARD",
     enabled: !0
    },
    STICKY_SKYSCRAPER: {
     name: "STICKY_SKYSCRAPER",
     enabled: !0
    },
    EXTRA_WIDE_SKYSCRAPER: {
     name: "EXTRA_WIDE_SKYSCRAPER",
     enabled: !0
    },
    BIG_BILLBOARD: {
     name: "BIG_BILLBOARD",
     enabled: !0
    },
    CONTENT_ROLLOVER: {
     name: "CONTENT_ROLLOVER",
     enabled: !0
    },
    POPUNDER: {
     name: "POPUNDER",
     enabled: !1
    },
    WALLPAPER_EXP: {
     name: "WALLPAPER_EXP",
     enabled: !1
    },
    WIDE_SKYSCRAPER_EXP: {
     name: "WIDE_SKYSCRAPER_EXP",
     enabled: !1
    },
    MEDIUM_RECTANGLE_EXP: {
     name: "MEDIUM_RECTANGLE_EXP",
     enabled: !1
    },
    SUPERBANNER_EXP: {
     name: "SUPERBANNER_EXP",
     enabled: !1
    },
    SKINNING: {
     name: "SKINNING",
     enabled: !1
    },
    MIDROLL: {
     name: "MIDROLL",
     enabled: !1
    },
    POSTROLL: {
     name: "POSTROLL",
     enabled: !1
    },
    CONTENT: {
     name: "CONTENT",
     enabled: !1
    },
    SITEBAR: {
     name: "SITEBAR",
     enabled: !1
    },
    INIMAGE: {
     name: "INIMAGE",
     enabled: !1
    },
    SECOND_SKYSCRAPER: {
     name: "SECOND_SKYSCRAPER",
     enabled: !1
    },
    STICKY_CORNER_AD: {
     name: "STICKY_CORNER_AD",
     enabled: !1
    },
    CONTENT_ADVERTORIAL: {
     name: "CONTENT_ADVERTORIAL",
     enabled: !1
    },
    CONTENT_ADVERTORIAL_NATIVE: {
     name: "CONTENT_ADVERTORIAL_NATIVE",
     enabled: !1
    },
    AUTONATIVE: {
     name: "AUTONATIVE",
     enabled: !1
    },
    STICKY_SUPERBANNER: {
     name: "STICKY_SUPERBANNER",
     enabled: !1
    },
    HEADSLIDER: {
     name: "HEADSLIDER",
     enabled: !1
    },
    EXITEVENT: {
     name: "EXITEVENT",
     enabled: !1
    },
    SALES_CONTACT: {
     name: "SALES_CONTACT",
     enabled: !0
    },
    DSE_OPTOUT: {
     name: "DSE_OPTOUT",
     enabled: !0
    },
    ABP: {
     name: "ABP",
     enabled: !0
    }
   },
   adSlot: {
    SUPERBANNER: {
     name: "SUPERBANNER",
     enabled: !0,
     adMedium: [ "PUSHDOWN", "SKINNING", "SUPERBANNER", "SUPERBANNER_EXP", "WALLPAPER", "WALLPAPER_BG", "WALLPAPER_EXP" ],
     prio: 3
    },
    WIDE_SKYSCRAPER: {
     name: "WIDE_SKYSCRAPER",
     enabled: !0,
     adMedium: [ "EXTRA_WIDE_SKYSCRAPER", "SITEBAR", "SKYSCRAPER", "STICKY_CORNER_AD", "STICKY_SKYSCRAPER", "SUPER_WIDE_SKYSCRAPER", "WIDE_SKYSCRAPER", "WIDE_SKYSCRAPER_EXP", "TANDEM", "TANDEM_LAYER", "POP_UNDER" ],
     prio: 4
    },
    MEDIUM_RECTANGLE: {
     name: "MEDIUM_RECTANGLE",
     enabled: !0,
     adMedium: [ "HALFPAGE", "MEDIUM_RECTANGLE", "MEDIUM_RECTANGLE_EXP" ],
     prio: 2
    },
    BILLBOARD: {
     name: "BILLBOARD",
     enabled: !0,
     adMedium: [ "BIG_BILLBOARD", "BILLBOARD" ],
     prio: 1
    },
    LAYER: {
     name: "LAYER",
     enabled: !0,
     adMedium: [ "ANCHOR", "BANDEROLE", "LAYER" ],
     prio: 5
    },
    EXITEVENT_AD: {
     name: "EXITEVENT_AD",
     enabled: !0,
     adMedium: [ "BILLBOARD", "HALFPAGE", "MEDIUM_RECTANGLE", "SUPERBANNER", "EXITEVENT_AD" ]
    },
    TEASER_V: {
     name: "TEASER_V",
     enabled: !0
    },
    TEASER_H: {
     name: "TEASER_H",
     enabled: !0
    },
    SALES_CONTACT: {
     name: "SALES_CONTACT",
     enabled: !0
    },
    DSE_OPTOUT: {
     name: "DSE_OPTOUT",
     enabled: !0
    },
    CUSTOM_AD: {
     name: "CUSTOM_AD",
     enabled: !0
    },
    PREROLL: {
     name: "PREROLL",
     enabled: !0
    },
    CONTENT_VIDEO: {
     name: "CONTENT_VIDEO",
     enabled: !0
    },
    CONTENT_ROLLOVER: {
     name: "CONTENT_ROLLOVER",
     enabled: !0
    },
    SECOND_SKYSCRAPER: {
     name: "SECOND_SKYSCRAPER",
     enabled: !0
    },
    AUTONATIVE: {
     name: "AUTONATIVE",
     enabled: !0
    },
    TOP: {
     name: "TOP",
     enabled: !0
    },
    MID: {
     name: "MID",
     enabled: !0
    },
    BOTTOM: {
     name: "BOTTOM",
     enabled: !0
    }
   }
  };
  return t(), {
   includeAd: i,
   excludeAd: s,
   renderAd: d,
   addStyle: c,
   _disableAdMedium: r,
   _register: a,
   _getIncludedAds: l,
   _isValidAdMedium: g,
   _AbstractAd: e,
   _createAd: f
  };
 }), t(o.ad, "q", function() {
  function e(e) {
   n.push(e), a && t();
  }
  function t() {
   var e, t;
   for (a = !0, i(n); e = n.shift(); ) t = o.ad._createAd(e.namespace, e), t && (o.ad._getIncludedAds().push(t), 
   t && o.evt.triggerEvent("INIT", e.namespace));
  }
  var n = [], a = !1, i = function(e) {
   try {
    e.sort(function(e, t) {
     return e.prio < t.prio ? -1 : e.prio > t.prio ? 1 : 0;
    });
   } catch (t) {
    o.logger._log("ERROR", "", "", "Browser unterstuetzt Array.prototype.sort nicht");
   }
  };
  return {
   _push: e,
   _run: t
  };
 }), t(o.ad, "replace", function() {
  function e(e, n, a) {
   "string" == typeof n && (n = t(n), "function" == typeof n[0] && (f[e] = [ n[0], a ])), 
   "function" == typeof n && (f[e] = [ n, a ]);
  }
  function t(e) {
   return f[e];
  }
  function i(e) {
   var n;
   return "object" == typeof e && "undefined" != typeof e.length && (n = t("KEY_VALUES")), 
   n || "function" != typeof e || (n = t("FUNC")), n || u;
  }
  function u(e, t) {
   this.key = e, this.value = t, this.pattern = new RegExp("\\#{" + e + "}", "g"), 
   this.getReplacement = function() {
    return "undefined" != typeof t ? t : "";
   }, this.replace = function(e) {
    return e.replace(this.pattern, this.getReplacement());
   };
  }
  function r(e, t, n) {
   a(this)(e, t), this.postfix = n || "", this.getValue = function() {
    return this.value;
   }, this.getReplacement = function() {
    var e = this.getValue();
    return "" !== e && (e += this.postfix), e;
   };
  }
  function s(e, t) {
   a(this)(e, t, ";"), this.getValue = function() {
    return this.getKeyValue(this.key, this.value);
   }, this.getKeyValue = function(e, t) {
    return "undefined" != typeof t ? e + "=" + t : "";
   };
  }
  function d(e, t) {
   a(this)(e, t), this.getValue = function() {
    var e = [];
    return o.utils._forEach(this.value, function(t) {
     e.push(this.getKeyValue(this.key, t));
    }, this), e.join(";");
   };
  }
  function l(e, t, n) {
   a(this)(e, n), this.getValue = function() {
    var e, t = [];
    return o.utils._forEach(this.value, function(n) {
     e = this.getKeyValue(n, o.data.getValue(n)), "" !== e && t.push(e);
    }, this), t.join(";");
   };
  }
  function c(e, t, n, i) {
   "function" == typeof t && (n = t, t = null), a(this)(e, t, ";"), this.getValue = function() {
    var e = n(this.key, this.value, i);
    return "undefined" != typeof e ? e : "";
   };
  }
  function p(e, n) {
   var a, u, r, s = new RegExp("\\#{([a-zA-Z0-9_-]+)}", "g");
   return e = e.replace(s, function(e, s) {
    return u = o.data.getValue(s, n), r = t(s) || i(u), r ? ("undefined" != typeof r[0] && (a = r[1], 
    r = r[0]), new r(s, u, a, n).replace(e)) : "";
   });
  }
  function g(t, a, i) {
   n(t, a, i), e(i, t);
  }
  var f = {};
  return g(r, u, "POSTFIX"), g(s, r, "KEY_VALUE"), g(d, s, "KEY_VALUES"), g(l, s, "KEYS_VALUES"), 
  g(c, r, "FUNC"), {
   _replace: p,
   _setReplacement: e
  };
 }), t(o.ad, "adtarget", function() {
  function e(e, t, n, a) {
   o.ad._register(e, t, n, a);
   var i = e;
   i = new i();
  }
  function t(e, t, n) {
   o.logger._log("INFO", e, t, "AdTarget " + e + " laden: " + n);
  }
  function n(e) {
   function n() {
    this.options && this.options.url && this.replace();
   }
   function u() {
    this.options && this.options.url && (o.utils._writeScript(this.options.url), t(this.namespace, "START", this.options.url));
   }
   e = i({
    BEFORE_START: n,
    START: u
   }, e), a(this)(e), this.replace = function() {
    this.options.url = o.ad.replace.replace(this.options.url, this.namespace);
   };
  }
  function u() {
   function e() {
    var e = "//ip.nuggad.net/rc?nuggn=2059506885&nuggsid=963375572";
    o.utils._getScript(e, function() {
     o.evt.triggerEvent("NUGGAD_DONE");
    }), t(this.namespace, "START", e);
   }
   function n() {
    window["n_pbt" + o.data.getValue("ord")] = function() {
     return o.data._putValue("n_pbt", window.n_pbt), window["n_pbt" + o.data.getValue("ord")] = function() {
      return o.data.getValue("n_pbt");
     }, window["n_pbt" + o.data.getValue("ord")]();
    };
   }
   a(this)({
    START: [ e ],
    COMPLETE: [ n ]
   });
  }
  function r() {
   function e() {
    this.process();
   }
   a(this)({
    START: [ e ]
   }), this.template = "https://probe.yieldlab.net/yp/#{ylasid}?ts=#{ord}&formats_#{ylasfo}=#{ylfoid}&yl_rtb_pubkey=#{site}", 
   this.process = function() {
    var e = !1, t = "";
    window["yl" + o.data.getValue("ord")] = function(n) {
     try {
      var a, i, u, r, s, d, l = [ "SUPERBANNER", "WIDE_SKYSCRAPER", "MEDIUM_RECTANGLE", "BILLBOARD", "HALFPAGE", "LAYER" ], c = o.data.getValue("ylasfo"), p = "";
      if ("object" == typeof window.yl && window.yl.YpResult && o.utils._inArray(l, n) > -1) for (r = l.length; r--; ) n = l[r], 
      a = o.data.getValue("ylasname", n), i = o.data.getValue("LAYER" === n ? "ylasfo" : "ylasid", n), 
      u = window.yl.YpResult.get(i), u && (p += "yl_" + a + "=" + u.id + ";ylid_" + a + "=" + u.ylid + ";yl_r_" + a + "=" + u.yl_r + ";", 
      u.id == c && (p += "yl_format=" + u.format + ";"));
      if (!e && "object" == typeof window.asiPlacements) {
       e = !0;
       for (var g in window.asiPlacements) {
        s = [], d;
        for (var f in window.asiPlacements[g].data) s.push(f);
        if (1 == s.length) t += g + "=T;"; else for (;d = s.pop(); ) t += "PQ_" + g + "=" + d + ";";
       }
      }
      return p + t;
     } catch (h) {
      return o.logger._log("ERROR", "", "", h), "";
     }
    }, this.replacePlaceholder(), o.utils._writeScript(this.template);
    try {
     var n = new Date().getTime(), a = "HcrkHd,KU98eS,Bg2O5j,qtHtnX,C2pDn2,SJP4W1,FZ32ND";
     o.utils._write('<script type="text/javascript" language="JavaScript" \nsrc="' + ("https:" == document.location.protocol ? "https" : "http") + "://pq-direct.revsci.net/pql?placementIdList=" + a + "&cb=" + n + '"></script>', function() {
      o.evt.triggerEvent("YIELDLAB_DONE");
     });
    } catch (i) {
     o.logger._log("ERROR", "", "", i);
    }
   }, this.replacePlaceholder = function() {
    for (var e, t = new RegExp("\\#{(ylasid|ylfoid|ylasfo|ord|site)}", "g"), n = [ "SUPERBANNER", "WIDE_SKYSCRAPER", "MEDIUM_RECTANGLE", "BILLBOARD" ], a = o.data.getValue("ylasfo"), i = [], u = n.length; u--; ) e = o.data.getValue("ylasid", n[u]), 
    e && i.push(e);
    a && i.push(a);
    for (var r, s, d = o.data._getValues("adMedium"), u = d.length, l = []; u--; ) r = o.data.getValue("adMedium", d[u].name), 
    r && r.enabled && (s = o.data.getValue("ylfoid", r.name), s && l.push(s));
    var c = {
     ylfoid: l.join(","),
     ylasfo: a,
     ylasid: i,
     ord: o.data.getValue("ord"),
     site: o.data.getValue("site")
    };
    this.template = this.template.replace(t, function(e, t) {
     if (c[t]) return c[t];
     for (var n, a = [ "SUPERBANNER", "WIDE_SKYSCRAPER", "MEDIUM_RECTANGLE" ], i = [], u = 0; u < a.length; u++) n = o.data.getValue(t, a[u]), 
     n && i.push(n);
     return i.join(",");
    });
   };
  }
  function s() {
   function e() {
    this.process();
   }
   a(this)({
    START: [ e ]
   }), this.template = '<script type="text/javascript" src="//c.amazon-adsystem.com/aax2/amzn_ads.js"></script>\n<script>typeof amznads !== "undefined" && amznads.getAds(\'3237\');</script>', 
   this.process = function() {
    var e;
    window["amzn" + o.data.getValue("ord")] = function() {
     if ("undefined" == typeof e) {
      e = "";
      try {
       e = amznads.getTokens(), e.length > 0 && (e = "amznslots=" + e.join(",") + ";", 
       o.data._putValue("amzn", e));
      } catch (t) {
       o.logger._log("ERROR", "", "", t);
      }
     }
     return window["amzn" + o.data.getValue("ord")] = function() {
      return o.data.getValue("amzn");
     }, window["amzn" + o.data.getValue("ord")]();
    }, o.utils._write(this.template, function() {
     o.evt.triggerEvent("AMZN_DONE");
    });
   };
  }
  function d() {
   function e() {
    var e, t, n = {
     zone: {},
     ui: {
      fotografie: [ [ "\\u0073\\u0075\\u0063\\u0068\\u0065\\u0072" ], [ "\\u0073\\u0070\\u0069\\u0065\\u0067\\u0065\\u006c\\u0072\\u0065\\u0066\\u006c\\u0065\\u0078" ], [ "\\u0062\\u0065\\u006c\\u0069\\u0063\\u0068\\u0074\\u0075\\u006e\\u0067" ], [ "\\u006e\\u0069\\u006b\\u006f\\u006e" ], [ "\\u0069\\u0073\\u006f\\u002d\\u0065\\u0069\\u006e\\u0073\\u0074\\u0065\\u006c\\u006c\\u0075\\u006e\\u0067" ], [ "\\u0070\\u006f\\u0072\\u0074\\u0072\\u0061\\u0069\\u0074" ], [ "\\u0073\\u0074\\u0061\\u0074\\u0069\\u0076" ], [ "\\u0072\\u006f\\u006c\\u0065\\u0069" ], [ "\\u0073\\u0063\\u0068\\u00e4\\u0072\\u0066\\u0065\\u006e\\u0074\\u0069\\u0065\\u0066\\u0065" ], [ "\\u0062\\u0069\\u006c\\u0064\\u0073\\u0074\\u0061\\u0062\\u0069\\u006c\\u0069\\u0073\\u0061\\u0074" ], [ "\\u0069\\u0073\\u006f\\u002d\\u0065\\u006d\\u0070\\u0066\\u0069\\u006e\\u0064\\u006c\\u0069\\u0063\\u0068\\u006b\\u0065\\u0069\\u0074" ], [ "\\u0073\\u0063\\u0068\\u0061\\u0065\\u0072\\u0066\\u0065\\u006e\\u0074\\u0069\\u0065\\u0066\\u0065" ], [ "\\u0070\\u006f\\u0072\\u0074\\u0072\\u00e4\\u0074" ], [ "\\u0062\\u006c\\u0065\\u006e\\u0064\\u0065" ], [ "\\u006f\\u0062\\u006a\\u0065\\u006b\\u0074\\u0069\\u0076" ], [ "\\u0063\\u0061\\u006e\\u006e\\u006f\\u006e" ], [ "\\u0061\\u0073\\u0061" ], [ "\\u0066\\u006f\\u0074\\u006f" ], [ "\\u0076\\u0065\\u0072\\u0073\\u0063\\u0068\\u006c\\u0075\\u0073\\u0073\\u007a\\u0065\\u0069\\u0074" ], [ "\\u006b\\u0061\\u006d\\u0065\\u0072\\u0061" ], [ "\\u0076\\u0065\\u0072\\u0077\\u0061\\u0063\\u006b\\u0065\\u006c" ], [ "\\u006c\\u0065\\u0069\\u0063\\u0061" ] ],
      "app-medien-tech-aff": [ [ "\\u006e\\u0069\\u006e\\u0074\\u0065\\u006e\\u0064\\u006f" ], [ "\\u006c\\u0061\\u006c\\u0061\\u006c\\u0061\\u0062" ], [ "\\u0069\\u006e\\u0074\\u0065\\u0072\\u006e\\u0065\\u0074" ], [ "\\u0075\\u006c\\u0074\\u0072\\u0061\\u0062\\u006f\\u006f\\u006b" ], [ "\\u0070\\u0061\\u0063\\u006b\\u0061\\u0072\\u0064" ], [ "\\u0064\\u0076\\u0064" ], [ "\\u0069\\u0066\\u0061" ], [ "\\u0061\\u0070\\u0070" ], [ "\\u0073\\u006f\\u006e\\u0079" ], [ "\\u0063\\u0061\\u006d" ], [ "\\u0074\\u0076" ], [ "\\u0063\\u0061\\u006d\\u0065\\u0072\\u0061" ], [ "\\u0070\\u0068\\u006f\\u0074\\u006f" ], [ "\\u0063\\u006f\\u006d\\u0070\\u0075\\u0074\\u0065\\u0072" ], [ "\\u006e\\u006f\\u0074\\u0065\\u0062\\u006f\\u006f\\u006b" ], [ "\\u006c\\u0061\\u0070\\u0074\\u006f\\u0070" ], [ "\\u0062\\u006c\\u0061\\u0063\\u006b\\u0062\\u0065\\u0072\\u0072\\u0079" ], [ "\\u0069\\u0070\\u0061\\u0064" ], [ "\\u0069\\u0070\\u0068\\u006f\\u006e\\u0065", "\\u0061\\u0064\\u006f\\u0062\\u0065" ], [ "\\u0068\\u0061\\u0072\\u0064\\u0077\\u0061\\u0072\\u0065" ], [ "\\u0067\\u006f\\u0070\\u0072\\u006f" ], [ "\\u006e\\u0065\\u0074\\u0066\\u006c\\u0069\\u0078" ], [ "\\u0073\\u0074\\u0072\\u0065\\u0061\\u006d\\u0069\\u006e\\u0067" ], [ "\\u0061\\u0070\\u0070\\u006c\\u0065" ], [ "\\u0073\\u006f\\u0066\\u0074\\u0077\\u0061\\u0072\\u0065" ], [ "\\u0069\\u006f\\u0073" ], [ "\\u0069\\u0070\\u006f\\u0064" ], [ "\\u0063\\u0061\\u006e\\u006f\\u006e" ], [ "\\u0073\\u0061\\u006d\\u0073\\u0075\\u006e\\u0067" ], [ "\\u0063\\u0065\\u0077\\u0065" ], [ "\\u0070\\u006c\\u0061\\u0079\\u0073\\u0074\\u0061\\u0074\\u0069\\u006f\\u006e" ], [ "\\u006d\\u0075\\u0073\\u0069\\u006b" ], [ "\\u006d\\u0069\\u0063\\u0072\\u006f\\u0073\\u006f\\u0066\\u0074" ], [ "\\u0073\\u006d\\u0061\\u0072\\u0074\\u0070\\u0068\\u006f\\u006e\\u0065" ], [ "\\u0070\\u0063\\u0067\\u0061\\u006d\\u0065\\u0073" ], [ "\\u0066\\u006f\\u0074\\u006f\\u0077\\u0065\\u006c\\u0074" ], [ "\\u0061\\u006e\\u0064\\u0072\\u006f\\u0069\\u0064" ], [ "\\u0061\\u0064\\u006f\\u0062\\u0065", "\\u0061\\u0070\\u0070" ], [ "\\u0061\\u0070\\u0070\\u006c\\u0069\\u0063\\u0061\\u0074\\u0069\\u006f\\u006e" ], [ "\\u0070\\u0069\\u006e\\u0074\\u0065\\u0072\\u0065\\u0073\\u0074" ], [ "\\u0069\\u0070\\u0068\\u006f\\u006e\\u0065" ], [ "\\u0063\\u0064" ], [ "\\u0062\\u006c\\u0075\\u0065\\u0072\\u0061\\u0079" ], [ "\\u0078\\u0062\\u006f\\u0078" ], [ "\\u0077\\u0069\\u006e\\u0064\\u006f\\u0077\\u0073" ], [ "\\u0062\\u006c\\u0075\\u0072\\u0061\\u0079" ], [ "\\u0069\\u006e\\u0073\\u0074\\u0061\\u0067\\u0072\\u0061\\u006d" ] ],
      "autos - luxussegment": [ [ "\\u0066\\u0065\\u0072\\u0072\\u0061\\u0072\\u0069" ], [ "\\u0062\\u006d\\u0077" ], [ "\\u0062\\u0065\\u006e\\u0074\\u006c\\u0079" ], [ "\\u006d\\u0061\\u006e\\u0073\\u006f\\u0072\\u0079" ], [ "\\u0067\\u006d\\u0062\\u0068", "\\u0071\\u0075\\u0061\\u0074\\u0074\\u0072\\u006f" ], [ "\\u006d\\u0061\\u0079\\u0062\\u0061\\u0063\\u0068" ], [ "\\u006a\\u0061\\u0067\\u0075\\u0061\\u0072" ], [ "\\u006c\\u0065\\u0078\\u0075\\u0073" ], [ "\\u0062\\u0072\\u0061\\u0062\\u0075\\u0073" ], [ "\\u0069\\u006e\\u0066\\u0069\\u006e\\u0069\\u0074\\u0079" ], [ "\\u0068\\u0075\\u006d\\u006d\\u0065\\u0072" ], [ "\\u0062\\u0075\\u0067\\u0061\\u0074\\u0074\\u0069" ], [ "\\u0070\\u006f\\u0072\\u0073\\u0063\\u0068\\u0065" ], [ "\\u0074\\u0065\\u0073\\u006c\\u0061" ], [ "\\u0061\\u0075\\u0064\\u0069" ], [ "\\u006c\\u0061\\u006d\\u0062\\u006f\\u0072\\u0067\\u0068\\u0069\\u006e\\u0069" ], [ "\\u006d\\u0065\\u0072\\u0063\\u0065\\u0064\\u0065\\u0073\\u002d\\u0062\\u0065\\u006e\\u007a" ], [ "\\u0072\\u006f\\u006c\\u006c\\u0073\\u002d\\u0072\\u006f\\u0079\\u0063\\u0065" ], [ "\\u0061\\u0073\\u0074\\u006f\\u006e\\u002d\\u006d\\u0061\\u0072\\u0074\\u0069\\u006e" ], [ "\\u006d\\u0061\\u0073\\u0065\\u0072\\u0061\\u0074\\u0069" ], [ "\\u006d\\u0065\\u0072\\u0063\\u0065\\u0064\\u0065\\u0073" ] ],
      "hochwert-freizeitangebote": [ [ "\\u0077\\u0065\\u006c\\u006c\\u0065\\u006e\\u0072\\u0065\\u0069\\u0074" ], [ "\\u0064\\u0072\\u0061\\u0063\\u0068\\u0065\\u006e\\u0066\\u006c\\u0069\\u0065\\u0067\\u0065\\u006e" ], [ "\\u0074\\u006f\\u0075\\u0072\\u0065\\u006e\\u0073\\u006b\\u0069" ], [ "\\u006d\\u006f\\u0074\\u006f\\u0072\\u0062\\u006f\\u006f\\u0074" ], [ "\\u006c\\u0061\\u0063\\u006f\\u0073\\u0074\\u0065" ], [ "\\u006a\\u0065\\u0074\\u0073\\u006b\\u0069" ], [ "\\u0073\\u0063\\u0068\\u0077\\u0065\\u0069\\u007a" ], [ "\\u0073\\u0079\\u006d\\u0070\\u0068\\u006f\\u006e\\u0069\\u0065" ], [ "\\u006b\\u0069\\u0074\\u0065" ], [ "\\u006d\\u0075\\u0073\\u0069\\u0063\\u0061\\u006c" ], [ "\\u0075\\u0062\\u006f\\u006f\\u0074" ], [ "\\u006b\\u0061\\u0074\\u0061\\u006d\\u0061\\u0072\\u0061\\u006e" ], [ "\\u0079\\u0061\\u0063\\u0068\\u0074" ], [ "\\u0067\\u006c\\u0065\\u0069\\u0074\\u0073\\u0063\\u0068\\u0069\\u0072\\u006d\\u0066\\u006c\\u0069\\u0065\\u0067\\u0065\\u006e" ], [ "\\u0070\\u0066\\u0065\\u0072\\u0064" ], [ "\\u0073\\u006e\\u006f\\u0077\\u0062\\u006f\\u0061\\u0072\\u0064" ], [ "\\u0072\\u006f\\u0074\\u0077\\u0065\\u0069\\u006e" ], [ "\\u0073\\u0065\\u0067\\u0065\\u006c\\u006e" ], [ "\\u0072\\u0065\\u0069\\u0074" ], [ "\\u0073\\u0075\\u0072\\u0066\\u0065\\u006e" ], [ "\\u0070\\u0061\\u0064\\u0069" ], [ "\\u0067\\u006c\\u0061\\u0073\\u0062\\u006f\\u006f\\u0074" ], [ "\\u006f\\u0070\\u0065\\u0072" ], [ "\\u0074\\u0061\\u0075\\u0063\\u0068\\u0065\\u006e" ], [ "\\u0067\\u006f\\u006c\\u0066\\u0065\\u006e" ], [ "\\u0064\\u0072\\u006f\\u006e\\u0065", "\\u0066\\u006f\\u0074\\u006f" ], [ "\\u0062\\u0069\\u006c\\u0064\\u0062\\u0065\\u0061\\u0072\\u0062\\u0065\\u0069\\u0074\\u0075\\u006e\\u0067" ], [ "\\u0062\\u0065\\u0072\\u0067\\u0073\\u0074\\u0065\\u0069\\u0067\\u0065\\u006e" ], [ "\\u0073\\u006b\\u0069" ], [ "\\u0070\\u0061\\u0072\\u0061\\u0067\\u006c\\u0069\\u0064\\u0065" ], [ "\\u0066\\u006f\\u0072\\u006d\\u0065\\u006c\\u0031" ], [ "\\u0077\\u0061\\u006b\\u0065\\u0062\\u006f\\u0061\\u0072\\u0064" ] ]
     }
    }, a = /^(?:([^:\/?\#]+):)?(?:\/\/([^\/?\#]*))?([^?\#]*)(?:\?([^\#]*))?(?:\#(.*))?/, i = /[?&]?[q|p](?:=([^&]*))/, u = this.getMetaKeywords();
    if (a.test(document.referrer), (e = RegExp.$2) && i.test(RegExp.$4) && o.utils._inArray([ "www.google.de", "de.search.yahoo.com", "www.bing.com" ], e) > -1 && (t = decodeURI(RegExp.$1).match(/[^\s+]+/g)), 
    t = t || [], u && t.push(u), t.length > 0) for (var r in n) for (var s in n[r]) {
     for (var d = !1, l = n[r][s], c = 0; c < l.length; c++) {
      for (var p = !0, g = 0; g < l[c].length; g++) if (!new RegExp("(" + l[c][g] + ")").test(t)) {
       p = !1;
       break;
      }
      if (p) {
       o.logger._log("INFO", "USER_INTEREST", "INIT", "AdTarget USER_INTEREST '" + r + "=" + s + "' konfigurieren"), 
       o.data.setValue(r, s) === !1 && o.data._putValue(r, s), d = !0;
       break;
      }
     }
     if (d) break;
    }
    o.evt.triggerEvent("DOCCHECK_DONE");
   }
   a(this)({
    INIT: [ e ]
   }), this.getMetaKeywords = function() {
    try {
     var e = document.querySelectorAll('meta[name="keywords"]');
     if (e && e.length > 0) return e[0].getAttribute("content");
    } catch (t) {
     o.logger._log("ERROR", "", "", t);
    }
    return "";
   };
  }
  return e(n, o.ad._AbstractAd, "ADTARGET"), e(u, n, "NUGGAD"), e(r, n, "YIELDLAB"), 
  e(s, n, "AMZN"), e(d, n, "USER_INTEREST"), {};
 }), t(o.ad, "adtrack", function() {
  function e(e, t, n, a) {
   o.ad._register(e, t, n, a);
  }
  function t(e) {
   function t() {}
   function n() {}
   e = i({
    INIT: t,
    DOM_READY: n
   }, e), a(this)(e);
  }
  function n() {
   function e() {}
   a(this)({
    BEFORE_START: [ e ]
   });
  }
  function u() {
   function e() {}
   a(this)({
    INIT: [ e ]
   });
  }
  return e(t, o.ad._AbstractAd, "ADTRACK"), e(n, t, "EX_ANTE"), e(u, t, "EX_POST"), 
  {};
 }), t(o.ad, "adtag", function() {
  function t(e, t, n, a) {
   o.ad._register(e, t, n, a);
  }
  function n(e, t, n) {
   o.logger._log("INFO", e, t, "AdTag " + e + " laden: " + n);
  }
  function u(e) {
   function t() {
    var e = this;
    o.ad.replace._setReplacement("sz", "FUNC", function(t, n, a) {
     var i, u, r, s = o.data.getValue("adSlot", a), d = 0, l = [];
     if ("WIDE_SKYSCRAPER" === a) {
      var c = 1;
      i = o.ad._getIncludedAds();
      for (var p = 0; p < i.length; p++) i[p].namespace === a && i[p] !== e && c++;
      2 == c && (r = o.data.getValue("sz", "SECOND_SKYSCRAPER")) && (l = r, s = !1);
     }
     for (s && (i = s.adMedium) && (d = i.length); d--; ) u = i[d], o.ad._isValidAdMedium(u) && (r = o.data.getValue("sz", u), 
     r && o.utils._forEach(r, function(e) {
      o.utils._inArray(l, e) < 0 && l.push(e);
     }, e)), (u = o.data.getValue("adMedium", u)) && (r = o.data.getValue(u.enabled ? "whitelist" : "blacklist", u.name)) && r && o.data._putValue("keyword", r);
     return 0 === l.length && l.push(n), l.join(",");
    }), o.ad.replace._setReplacement("channel", "FUNC", function(e, t) {
     return o.data.getValue("preview") || t;
    }), o.ad.replace._setReplacement("zone", "FUNC", function(e, t) {
     var n = o.data.getValue("channel"), a = o.data.getValue("rel_channel_vertical", n);
     if ("home" === o.data.getValue("homesite")) o.data.setValue("zone", "home") && (t = "home"); else {
      var i;
      t === o.data.getValue("vertical") && t !== (i = o.data.getValue("vertical", a)) && o.data.setValue("zone", i) && (t = i);
     }
     return o.data.setValue("vertical", a), t;
    }), o.ad.replace._setReplacement("tile", "FUNC", function() {
     var e = o.data.getValue("tile");
     return o.data._putValue("tile", ++e), e;
    }), o.ad.replace._setReplacement("keyword", "FUNC", function(e) {
     for (var t, n = [ "ui", "docc", "3d", "ksl", "umfeld", "disziplin" ], a = n.length, i = []; a--; ) e = n[a], 
     t = o.data.getValue(e), "undefined" != typeof t && i.push(e + "=" + t);
     for (n = [ "pz", "adv" ], a = n.length; a--; ) e = n[a], t = o.data._getValues(e), 
     "undefined" != typeof t && i.push(e + "=" + t.join(","));
     return t = o.data._getValues("keyword"), t && i.push(t.join(";")), i.join(";");
    });
   }
   function u() {
    return this.validate() ? void this.replace() : !1;
   }
   function r() {
    if ("true" == o.data.getValue("gpt")) {
     if (!document.getElementById(this.getTagId())) {
      o.logger._log("INFO", this.namespace, "START", "Has no div for current ad: " + this.getTagId());
      var e = -1 == this.getTagId().indexOf("INIMAGE"), t = -1 == this.getTagId().indexOf("EXITEVENT");
      if (e && t) return;
     }
     naMediaAd.adSlots = naMediaAd.adSlots || [], naMediaAd.adSlots.push({
      context: this
     }), this.write('<script type="text/javascript"> nam_obtainAds(); </script>');
    } else n(this.namespace, "START", this.template), this.write();
   }
   this.INIT = function() {}, e = i({
    INIT: t,
    BEFORE_START: u,
    START: r
   }, e), a(this)(e), window.nam_obtainAds = function() {
    var e = naMediaAd.adSlots.shift().context, t = e.getAdUnitPath(), a = e.getSlotSizes();
    if (0 == a.length) return n(e.namespace, "START", e.template), e.tryEnableGptServices(), 
    void e.write();
    var i = googletag.defineSlot(t, a, e.getTagId()).addService(googletag.pubads()).setCollapseEmptyDiv(!0, !0);
    e.setSlotTargeting(i), "true" != o.data.getValue("gptLazy") || window.gptInitNam || (window.gptInitNam = !0, 
    o.utils.initGPT()), o.logger._log("INFO", e.namespace, "START", "Going to populate slot: " + t + " Container: " + e.getTagId() + " Sizes: " + JSON.stringify(a)), 
    e.tryEnableGptServices(), e.write('<script type="text/javascript"> googletag.display("' + e.getTagId() + '"); </script>'), 
    n(e.namespace, "START", i);
   }, this.tryEnableGptServices = function() {
    0 == naMediaAd.adSlots.length && googletag.enableServices();
   }, this.getAdUnitPath = function() {
    var e = "/490/" + o.data.getValue("site");
    return "undefined" != typeof o.data.getValue("zone") && (e += "/" + o.data.getValue("zone")), 
    e;
   }, this.getSlotSizes = function() {
    var e = [];
    if (this.template.split("sz=").length > 1) {
     var t = this.template.split("sz=")[1].split(";")[0].split(",");
     if (t.length > 1) for (var n = 0; n < t.length; n++) e.push([ Number(t[n].split("x")[0]), Number(t[n].split("x")[1]) ]); else e.push(Number(t[0].split("x")[0]), Number(t[0].split("x")[1]));
    }
    return e;
   }, this.setSlotTargeting = function(e) {
    for (var t = {}, n = "function" == typeof window["n_pbt" + o.data.getValue("ord")] && window["n_pbt" + o.data.getValue("ord")]() || "", a = "function" == typeof window["yl" + o.data.getValue("ord")] && window["yl" + o.data.getValue("ord")](this.namespace) || "", i = "function" == typeof window["docc" + o.data.getValue("ord")] && window["docc" + o.data.getValue("ord")]() || "", u = "function" == typeof window["amzn" + o.data.getValue("ord")] && window["amzn" + o.data.getValue("ord")]() || "", r = this.template.split("doubleclick.net")[1].replace("ord=", "").replace("sz=", "").split(";"), s = r.concat(n.split(";")).concat(a.split(";")).concat(i.split(";")).concat(u.split(";")), d = 0; d < s.length; d++) if (s[d].indexOf("=") > -1) {
     var l = s[d].split("=")[0], c = s[d].split("=")[1];
     "async" == l && (c = "true" == o.data.getValue("async") ? "1" : "0"), "" != l && (t[l] = c);
    }
    t.nsn = this.namespace;
    for (var l in t) t.hasOwnProperty(l) && e.setTargeting(l, [ t[l] ]);
    o.logger._log("INFO", "adSlot targeting keys: ", "", e.getTargetingKeys());
   }, this.validate = function() {
    return this.wrapper = document.getElementById(this.getTagClass()), this.wrapper ? (this.wrapper.setAttribute("id", this.getTagId()), 
    o.utils._addClass(this.wrapper, this.getTagClass()), o.utils._addClass(this.wrapper, "naMediaAd"), 
    !0) : (o.logger._log("ERROR", "", this.namespace, "ILLEGAL DOM attribute 'id', expected '" + this.getTagClass() + "'"), 
    !1);
   }, this.write = function(e) {
    var t = "#" + this.getTagId();
    if ((t.indexOf("INIMAGE") > -1 || t.indexOf("INTEXT") > -1 || t.indexOf("HEADSLIDER") > -1 || t.indexOf("EXITEVENT") > -1) && !document.getElementById(this.getTagId())) {
     var n = document.createElement("div");
     n.id = this.getTagId(), document.getElementsByTagName("body")[0].appendChild(n);
    }
    o.utils._write(e || this.template || "", t);
   }, this.getId = function() {
    if (!this.id) {
     for (var e = 1, t = o.ad._getIncludedAds(), n = 0; n < t.length; n++) t[n].namespace === this.namespace && t[n] !== this && e++;
     this.id = this.namespace + "_" + e;
    }
    return this.id;
   }, this.getTagId = function() {
    return "naMediaAd_" + this.getId();
   }, this.getTagClass = function() {
    return "naMediaAd_" + this.namespace;
   }, this.getTagClassSelector = function() {
    return "." + this.getTagClass();
   }, this.template = '<script type="text/javascript">\nif(typeof(ip_network)=="undefined" || ip_network=="") var ip_network="www.netzathleten.de";\nvar nuggad#{ord} = ((typeof(window["n_pbt#{ord}"]) == "function") && window["n_pbt#{ord}"]()) || "";\nvar ylCamps#{ord} = ((typeof(window["yl#{ord}"]) == "function") && window["yl#{ord}"]("' + this.namespace + '")) || "";\nvar doccheck#{ord} = ((typeof(window["docc#{ord}"]) == "function") && window["docc#{ord}"]()) || "";\nvar amznslots#{ord} = ((typeof(window["amzn#{ord}"]) == "function") && window["amzn#{ord}"]()) || "";\ndocument.write(\'<scr\'+\'ipt type="text/javascript" src="//ad.de.doubleclick.net/N490/adj/#{site}/#{zone};pack=#{channel};theme=#{homesite};zustand=#{login};forum=#{forum};sz=#{sz};tile=#{tile};#{env}async=\'+(#{async}&&1||0)+\';#{keyword}\'+ylCamps#{ord}+amznslots#{ord}+doccheck#{ord}+nuggad#{ord}+\'ord=#{ord}?"><\\/script>\');\n</script>', 
   this.replace = function() {
    this.template = o.ad.replace._replace(this.template, this.namespace);
   };
  }
  function r(e) {
   a(this)(e), this.getTagId = new RegExp("SUPERBANNER_1").test(this.getId()) ? function() {
    return "nab_top";
   } : this.getTagId;
  }
  function s(e) {
   a(this)(e), this.getTagId = new RegExp("WIDE_SKYSCRAPER_1").test(this.getId()) ? function() {
    return "nab_side";
   } : this.getTagId;
  }
  function d(e) {
   a(this)(e), this.getTagId = new RegExp("MEDIUM_RECTANGLE_1").test(this.getId()) ? function() {
    return "nab_text";
   } : this.getTagId;
  }
  function l(e) {
   function t() {
    o.ad.replace._setReplacement("n_pbt", "FUNC", function() {
     return window.n_pbt;
    });
   }
   function u() {
    if (this.template = this.template.replace(/;;/g, ";").replace(/;&/g, "&"), this.template.split("&t=").length > 1) {
     var e = this.template.split("&t=")[1].split("&m")[0];
     this.template = this.template.replace(e, encodeURIComponent(e));
    }
    if ("function" != typeof this.callback) return o.logger._log("ERROR", "", this.namespace, "MISSING callback function"), 
    !1;
    var t = o.data.getValue("preview");
    /^(https?:)?\/\//.test(t) && (this.template = t + o.data.getValue("ord"));
   }
   function r() {
    n(this.namespace, "START", this.template), this.write();
   }
   e = i({
    INIT: t,
    BEFORE_START: u,
    START: r
   }, e), a(this)(e), this.template = "#{scheme}//tagxtend.netletix.de/p/undefined?rnd=#{ord}&referrer=#{referrer}", 
   this.template = this.template.replace("#{scheme}", "https:" == document.location.protocol ? "https:" : "http:"), 
   this.template = this.template.replace("#{referrer}", encodeURIComponent(document.location.href)), 
   this.callback = e.callback, this.validate = function() {
    return !0;
   }, this.write = function() {
    o.utils._write("", this.callback(this.template));
   };
  }
  function c(e) {
   a(this)(e);
  }
  function p() {
   function t() {
    if (!this.validate()) return !1;
    var e = {
     id: window.ip_banner.id,
     width: window.ip_banner.width,
     height: window.ip_banner.height,
     expHeight: window.ip_banner.expheight,
     expanded: window.ip_banner.expanded,
     animated: window.ip_banner.animated
    }, t = {
     init: !0,
     contentId: "nab_top",
     height: 90,
     expHeight: 300,
     expanded: !1,
     width: 728,
     speed: 6
    };
    this.settings = o.utils._extend({}, t, e), this.settings.curHeight = this.settings.expanded ? this.settings.expHeight : this.settings.height, 
    this.settings.contentId = this.settings.contentId || this.settings.skinning && "ip_content_wrapper";
   }
   function n() {
    window.adexpand = e(this, "expand"), window.adcollapse = e(this, "collapse"), window.ip_banner.expcmd && (window[window.ip_banner.expcmd] = window.adexpand), 
    window.ip_banner.colcmd && (window[window.ip_banner.colcmd] = window.adcollapse), 
    this.resize();
   }
   a(this)({
    BEFORE_START: [ t ],
    START: [ n ]
   }), this.validate = function() {
    return window.ip_banner ? !0 : (o.logger._log("ERROR", "", "PUSHDOWN", "MISSING Pushdown Object ip_banner"), 
    !1);
   }, this.resize = function() {
    var e = function() {
     this.settings.init ? this.settings.init = !1 : this.settings.animated ? this.settings.expanded ? this.settings.curHeight -= this.settings.speed : this.settings.curHeight += this.settings.speed : this.settings.curHeight = this.settings.expanded ? this.settings.height : this.settings.expHeight, 
     this.settings.curHeight = Math.min(this.settings.curHeight, this.settings.expHeight);
     var e = {};
     e[this.settings.id] = {
      clip: "rect(0px, " + this.settings.width + "px, " + this.settings.curHeight + "px, 0px)"
     }, e[this.settings.contentId] = {
      height: this.settings.curHeight + "px"
     }, this.setPushdownStyle(e), this.settings.curHeight == this.settings.expHeight ? this.settings.expanded = window.ip_banner.expanded = !0 : this.settings.curHeight == this.settings.height ? this.settings.expanded = window.ip_banner.expanded = !1 : this.resize(this.settings);
    }, t = this;
    window.setTimeout(function() {
     e.call(t);
    }, 10);
   }, this.setPushdownStyle = function(e) {
    var t, n, a;
    for (t in e) if (n = t && document.getElementById(t)) for (a in e[t]) n.style[a] = e[t][a]; else t && o.ad.addStyle("#" + t, e[t]);
   }, this.expand = function() {
    this.settings.expanded || this.resize();
   }, this.collapse = function() {
    this.settings.expanded && this.resize();
   };
  }
  function g(e) {
   function t() {
    return this.validate() ? void this.replace() : !1;
   }
   function n() {
    this.write();
   }
   e = i({
    BEFORE_START: t,
    START: n
   }, e), a(this)(e), this.template = "//utils.adadapter.netzathleten-media.de/API-1.0/utils/abp/#{width}x#{height}.html?site=#{site}&ord=#{ord}", 
   this.settings = {
    SUPERBANNER: {
     width: 728,
     height: 90
    },
    WIDE_SKYSCRAPER: {
     width: 160,
     height: 600
    }
   }, this.validate = function() {
    return e.adType ? this.settings[e.adType] ? (this.settings.adType = e.adType, !0) : (o.logger._log("WARN", "", "ABP", "ILLEGAL ABP Konfiguration " + e.adType), 
    !1) : (o.logger._log("ERROR", "", "ABP", "MISSING ABP Konfiguration"), !1);
   }, this.write = function() {
    var e = document.getElementById("naMediaAd_" + this.settings.adType);
    if (e) {
     e.removeAttribute("id"), o.utils._addClass(e, this.getTagClass());
     {
      o.utils._createTag("iframe", {
       src: this.template,
       border: 0,
       frameborder: 0,
       scrolling: "no",
       width: this.getValue("width"),
       height: this.getValue("height")
      }, e);
     }
    }
   }, this.getTagClass = function() {
    return "naMediaAd_" + this.settings.adType;
   }, this.getValue = function(e) {
    return this.settings[this.settings.adType][e];
   }, this.replace = function() {
    var e = new RegExp("\\#{([a-z]+)}", "g"), t = this;
    this.template = this.template.replace(e, function(e, n) {
     return t.getValue(n) || o.data.getValue(n, t.settings.adType) || "";
    });
   };
  }
  function f(e) {
   a(this)(e), this.template = '<h4>Information zu nutzungsbasierter Online-Werbung</h4><p>Alle Informationen zu nutzungsbasierter Online-Werbung und dem Thema Datenschutz finden Sie auf der Seite unseres Vermarkters netzathleten media unter nachfolgendem Link: <a href="http://www.netzathleten-media.de/datenschutzerklaerung">http://www.netzathleten-media.de/datenschutzerklaerung</a></p>';
  }
  function h(e) {
   a(this)(e), this.template = '<ul style="list-style-type: none;"><li><img src="//utils.adadapter.netzathleten-media.de/API-1.0/img/signatur.png"/></li>\n<li><a href="" onclick="window.location.href=\'mailto:werben@netzathleten-media.de&subject=Werben auf \' + window.location.host">werben@netzathleten-media.de</a></li>\n<li>Tel: +49 89 1894 139 - 0</li>\n<li>Fax: +49 89 1894 139 99</li>\n<li>netzathleten media - the vertical expert</li>\n<li>netzathleten.net GmbH | Balanstr. 73 (Haus 31) | 81541 M&uuml;nchen</li>\n</ul>';
  }
  return t(u, o.ad._AbstractAd, "ADTAG", {
   INIT: [ function() {
    o.evt.triggerEvent("INIT", "ADTARGET");
   } ]
  }), o.evt.tree._addChild({
   namespace: "BILLBOARD"
  }, "ADTAG"), o.evt.addEventHandler("ADTAG_LOADED", function() {
   o.ad.addStyle("BILLBOARD", {
    "text-align": "center"
   });
  }, "BILLBOARD"), o.evt.tree._addChild({
   namespace: "LAYER"
  }, "ADTAG"), o.evt.tree._addChild({
   namespace: "CONTENT_ROLLOVER"
  }, "ADTAG"), o.evt.tree._addChild({
   namespace: "TOP"
  }, "ADTAG"), o.evt.tree._addChild({
   namespace: "MID"
  }, "ADTAG"), o.evt.tree._addChild({
   namespace: "BOTTOM"
  }, "ADTAG"), t(r, u, "SUPERBANNER"), o.evt.tree._addChild({
   namespace: "WALLPAPER"
  }, "SUPERBANNER"), o.evt.addEventHandler("BEFORE_START", function() {
   if (o.ad._isValidAdMedium("WALLPAPER")) {
    if (o.utils._hasClass(document.body, "naMediaAd_WALLPAPER")) return;
    o.utils._addClass(document.body, "naMediaAd_WALLPAPER");
    var e = {
     SUPERBANNER: {
      ip_wp_b_pos: {
       position: "relative"
      },
      ip_wp_b_t: {
       top: "0"
      },
      ip_wp_b_l: {
       left: "0"
      }
     },
     WIDE_SKYSCRAPER: {
      ip_wp_s_pos: {
       position: "relative"
      },
      ip_wp_s_t: {
       top: "0"
      },
      ip_wp_s_l: {
       left: "0"
      }
     }
    }, t = {
     SUPERBANNER: [ "ip_wp_b_l", "ip_wp_b_t", "ip_wp_b_pos" ],
     WIDE_SKYSCRAPER: [ "ip_wp_s_l", "ip_wp_s_t", "ip_wp_s_pos" ]
    }, n = {
     SUPERBANNER: "nab_top"
    }, a = "";
    for (var i in t) for (var u = document.getElementById(n[i]), r = t[i], s = 0; s < r.length; s++) if ("undefined" == typeof window[r[s]]) {
     var d = e[i][r[s]];
     if (d) for (var l in d) {
      var c = d[l];
      c = o.utils._getStyle(u, l, c), a += "var " + r[s] + '="' + c + '";';
     }
    }
    var p = {
     "z-index": 999
    }, g = Number(window.ip_wp_b_t);
    !isNaN(g) && (p.top = g);
    var f = Number(window.ip_wp_b_l);
    !isNaN(f) && (p.left = f);
    var h = window.ip_wp_b_pos;
    p.position = h || o.utils._getStyle(document.getElementById("nab_top"), "position", "relative"), 
    o.ad.addStyle("SUPERBANNER", p, "WALLPAPER"), o.utils._removeClass(document.body, "naMediaAd_WALLPAPER"), 
    o.utils._write('<script type="text/javascript">' + a + "</script>");
   }
  }, "WALLPAPER"), o.evt.addEventHandler("ADTAG_LOADED", function() {
   o.utils._addClass(document.body, "naMediaAd_WALLPAPER");
  }, "WALLPAPER"), t(s, u, "WIDE_SKYSCRAPER"), o.evt.tree._addChild({
   namespace: "STICKY_SKYSCRAPER"
  }, "WIDE_SKYSCRAPER"), o.evt.addEventHandler("ADTAG_LOADED", function() {
   if (ip_stickysky && ip_stickysky.parent) {
    var e = o.utils._getStyle(window.ip_stickysky.parent, "position", "relative"), t = ip_stickysky.img && ip_stickysky.img.height ? ip_stickysky.img.height : 600, n = ip_stickysky.img && ip_stickysky.img.width ? ip_stickysky.img.width : 160;
    naMediaAd.addStyle("#" + ip_stickysky.parent.id, {
     position: e,
     height: t + "px",
     width: n + "px"
    }), ip_stickysky.parent.style.zIndex = 2;
   }
  }, "STICKY_SKYSCRAPER"), t(d, u, "MEDIUM_RECTANGLE", {
   INIT: [ function() {
    var e = "//service.doccheck.com/service/applications/banners/mark_login_v4.php?access_key=mn4DC_Iw2fCvDaCF&zoneid=427";
    o.utils._writeScript(e), window["docc" + o.data.getValue("ord")] = function() {
     return o.data._putValue("docc", window.dc_status_target && 1 == window.dc_status_target ? "docc=1;" : ""), 
     window["docc" + o.data.getValue("ord")] = function() {
      return o.data.getValue("docc");
     }, window["docc" + o.data.getValue("ord")]();
    }, o.logger._log("INFO", "MEDIUM_RECTANGLE", "INIT", "AdTarget DOCCHECK laden: " + e);
   } ]
  }), t(l, u, "PREROLL"), t(c, o.ad._AbstractAd), t(p, c, "PUSHDOWN", {
   ADTAG_LOADED: [ function() {
    o.ad.renderAd("PUSHDOWN");
   } ]
  }), t(g, c, "ABP"), t(f, u, "DSE_OPTOUT"), t(h, u, "SALES_CONTACT"), {};
 }), t(o, "utils", function() {
  function e(e) {
   return "object" == typeof e && void 0 !== e.length;
  }
  function t(e, t) {
   for (var n = 0; n < e.length; n++) if (e[n] === t) return n;
   return -1;
  }
  function n(e, t, n) {
   for (var a = 0, i = e.length; i > a; ) t.call(n, e[a], a++, e);
  }
  function a(e, t) {
   return r("div", {
    id: e
   }, t);
  }
  function i(e, t) {
   return r("img", {
    src: e,
    border: "0 none"
   }, t);
  }
  function u(e, t) {
   return r("a", {
    href: e,
    target: "_blank"
   }, t);
  }
  function r(e, t, n) {
   var a = document.createElement(e);
   for (var i in t) "style" == i && a.style.setAttribute ? a.style.setAttribute("cssText", t[i]) : a.setAttribute(i, t[i]);
   return n && n.appendChild(a), a;
  }
  function s(e, t, n, a) {
   e.id || (e.id = "naMediaAd_" + Math.floor(1e5 * Math.random())), n.name || (n.name = e.id);
   var i, u = "<object";
   for (i in e) u += " " + i + "='" + e[i] + "'";
   u += ">";
   for (i in t) u += "<param name='" + i + "' value='" + t[i] + "'/>";
   u += "<embed";
   for (i in n) u += " " + i + "='" + n[i] + "'";
   if (u += "/>", u += "</object>", a) {
    var o = r("div", {}, a);
    o.innerHTML = u;
   } else document.write(u);
  }
  function d(e, t, n) {
   if ("true" == o.data.getValue("async")) {
    var a = {
     beforeWrite: function(e) {
      return e.replace(/<\/embed>|<\/img>|<\/param>/gi, "");
     },
     error: function(e) {
      console && e.message && void 0 || console && e.msg && void 0;
     },
     handleGptToken: !0
    };
    if ("function" == typeof t && (n = t, t = null), !t) {
     var i = "dummy" + Math.round(1e3 * Math.random()), t = o.utils._createDiv(i, document.body), u = function() {
      t.parentNode && t.parentNode.removeChild(t);
     };
     a.done = n ? function() {
      n(), u();
     } : u;
    }
    postscribe(t, e, a);
   } else document.write(e), "function" == typeof t && t() || "function" == typeof n && n();
  }
  function l(e) {
   d('<script type="text/javascript" src="' + e + '"></script>');
  }
  function c(e, t, n) {
   if ("boolean" == typeof t && (n = t, t = null), "undefined" != typeof n && !n || "true" != o.data.getValue("async")) {
    var a = !1, i = document.createElement("script");
    i.type = "text/javascript", t && (i.onload = i.onreadystatechange = function() {
     a || i.readyState && "loaded" != i.readyState && "complete" != i.readyState || (a = !0, 
     t());
    }), i.async = !0, i.src = e, document.getElementsByTagName("head")[0].appendChild(i);
   } else d('<script type="text/javascript" src="' + e + '"></script>', t);
  }
  function p(e) {
   if (e) {
    "string" == typeof e && (e = [ e ]);
    for (var t = Math.random(), n = 0; n < e.length; n++) {
     var a = g(e[n], "ts", t);
     c(a);
    }
   }
  }
  function g(e, t, n) {
   return e + (e.indexOf("?") > -1 ? "&" : "?") + t + "=" + n;
  }
  function f(e, t) {
   if (!m(e, t)) {
    var n = e.className;
    n || (n = ""), n += ("" === n ? "" : " ") + t, e.className = n;
   }
  }
  function h(e, t) {
   var n = e.className, a = new RegExp("\\b\\s?" + t + "\\b");
   n = n.replace(a, ""), e.className = n;
  }
  function m(e, t) {
   var n = new RegExp("\\b" + t + "\\b"), a = e.className, i = null === a;
   return !i && n.test(a);
  }
  function _(e, t, n) {
   if (!e) return n;
   var a = e.ownerDocument, i = a.defaultView || a.parentWindow;
   i.getComputedStyle || (i.getComputedStyle = function(e) {
    return this.el = e, this.getPropertyValue = function(t) {
     var n = /(\-([a-z]){1})/g;
     return "float" == t && (t = "styleFloat"), n.test(t) && (t = t.replace(n, function() {
      return arguments[2].toUpperCase();
     })), e.currentStyle[t] ? e.currentStyle[t] : null;
    }, this;
   });
   var u = i.getComputedStyle(e);
   if (!u) return n;
   if ("undefined" != typeof n) {
    var r = parseInt(u.getPropertyValue(t));
    return isNaN(r) ? "position" == t && "static" != u.getPropertyValue(t) ? u.getPropertyValue(t) : n : r;
   }
   return u.getPropertyValue(t);
  }
  function E() {
   var e, t = window.innerWidth, n = document.documentElement && document.documentElement.clientWidth, a = document.body.clientWidth;
   return e = t ? a && t >= a ? n && t >= n ? Math.max(a, n) : a : n && t >= n ? n : t : n ? n : a;
  }
  function A() {
   var e, t = window.innerHeight, n = document.documentElement && document.documentElement.clientHeight, a = document.body.clientHeight;
   return e = t ? a && t >= a ? n && t >= n ? Math.max(a, n) : a : n && t >= n ? n : t : n ? n : a;
  }
  function v(e) {
   var t = document.getElementById(e);
   if (t) {
    var n = [];
    "none" == t.style.display && n.push(!0);
    var a = t.offsetLeft, i = t.offsetTop;
    if (t.offsetParent) for (;t = t.offsetParent; ) a += t.offsetLeft, i += t.offsetTop;
    return n.unshift(a, i), n;
   }
  }
  function R(e, t) {
   if (e && t) {
    var n = t.split("."), a = n[0];
    return "" === a ? e : (a = e[a], n.shift(), "object" == typeof a && "undefined" == typeof a.length && n.length > 0 && (a = R(a, n.join("."))), 
    a);
   }
  }
  function w() {
   var e, t = 0, n = arguments[t++] || {}, a = arguments.length, i = !1;
   for ("boolean" == typeof n && (i = n, n = arguments[t++] || {}), "object" != typeof n && (n = {}), 
   a == t && (n = this, --t); a > t; t++) if (null !== (e = arguments[t])) for (var u in e) {
    var r = n[u], o = e[u];
    n !== o && (i && o && "object" == typeof o ? n[u] = w(i, r || (null !== o.length ? [] : {}), o) : void 0 !== o && (n[u] = o));
   }
   return n;
  }
  function y(e) {
   if ("undefined" == typeof e) return !0;
   if ("string" == typeof e) return "" === e;
   if ("object" == typeof e) {
    for (var t in e) return !1;
    return !0;
   }
   return !1;
  }
  function T(e) {
   var t = document.getElementById(e).style;
   t.display = "block" == t.display ? "none" : "block";
  }
  return {
   _createDiv: a,
   _createImg: i,
   _createA: u,
   _createTag: r,
   _createSwf: s,
   _write: d,
   _writeScript: l,
   _getScript: c,
   _createTrackingPixel: p,
   _isArray: e,
   _inArray: t,
   _forEach: n,
   _addClass: f,
   _hasClass: m,
   _removeClass: h,
   _getStyle: _,
   _getWidth: E,
   _getHeight: A,
   _getOffsetXY: v,
   _getProperty: R,
   _extend: w,
   _isEmpty: y,
   _toggle: T
  };
 }), t(o.utils, "vp", function() {
  function e() {
   try {
    this.viewport = {
     width: o.utils._getWidth(),
     height: o.utils._getHeight(),
     ppi: n()
    }, this.viewport.inch = a(this.viewport), o.data.setValue("device", this.device = t()), 
    o.data.setValue("vpo", this.orientation = i(this.viewport)), o.data.setValue("view", this.view = u(this.device, this.viewport, this.orientation)), 
    o.data.setValue("vpc", this.viewportClass = r(this.viewport)), o.data.setValue("html5", this.html5 = !!document.createElement("canvas").getContext), 
    o.data.setValue("touch", this.touchDevice = s()), o.data.setValue("flash", this.flashVersion = d() > 0), 
    this.initialised = !0;
   } catch (e) {
    o.logger._log("ERROR", "", "", e);
   }
  }
  function t() {
   var e = window, t = e.navigator, n = t.userAgent, a = n || t.vendor || e.opera, i = /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4));
   return /(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a) || i ? "phone" : /(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino|android|ipad|playbook|silk/i.test(a) || i ? "tablet" : "desktop";
  }
  function n() {
   var e = document, t = e.createElement("div");
   t.style.width = "1in", t.style.padding = 0, t.style.margin = 0, e.body.appendChild(t);
   var n = o.utils._getStyle(t, "width");
   return e.body.removeChild(t), parseFloat(n);
  }
  function a(e) {
   return Math.sqrt(e.width * e.width + e.height * e.height) / e.ppi;
  }
  function i(e) {
   return e.width >= e.height ? "landscape" : "portrait";
  }
  function u(e, t, n) {
   var a;
   return a = "phone" == e || t.inch <= 6 || ("l" === n ? t.width <= 640 : t.width <= 360) ? "mobile" : "tablet" == e || t.inch <= 11 || ("l" === n ? t.width <= 1024 : t.width <= 800) ? "tablet" : "desktop";
  }
  function r(e) {
   var t, n = e.width;
   return t = n >= 1900 ? "a" : n >= 1600 ? "b" : n >= 1400 ? "c" : n >= 1200 ? "d" : n >= 1e3 ? "e" : n >= 800 ? "f" : n >= 480 ? "g" : "h";
  }
  function s() {
   var e = window, t = window.navigator;
   return !!e.Modernizr && e.Modernizr.touch || "ontouchstart" in e || t.MaxTouchPoints > 0 || t.msMaxTouchPoints > 0;
  }
  function d() {
   var e = [ 0, 0, 0 ], t = window, n = t.navigator;
   try {
    if (h >= 537.71) return 0;
    if (n.plugins && "object" == typeof n.plugins["Shockwave Flash"]) {
     var a = n.plugins["Shockwave Flash"].description;
     !a || n.mimeTypes && n.mimeTypes["application/x-shockwave-flash"] && !n.mimeTypes["application/x-shockwave-flash"].enabledPlugin || (a = a.replace(/^.*\s+(\S+\s+\S+$)/, "$1"), 
     e[0] = parseInt(a.replace(/^(.*)\..*$/, "$1"), 10), e[1] = parseInt(a.replace(/^.*\.(.*)\s.*$/, "$1"), 10), 
     e[2] = /[a-zA-Z]/.test(a) ? parseInt(a.replace(/^.*[a-zA-Z]+(.*)$/, "$1"), 10) : 0);
    } else if (t.ActiveXObject) try {
     var i = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
     if (i) {
      var a = i.GetVariable("$version");
      a && (a = a.split(" ")[1].split(","), e = [ parseInt(a[0], 10), parseInt(a[1], 10), parseInt(a[2], 10) ]);
     }
    } catch (u) {
     o.logger._log("ERROR", "", "", u);
    }
   } catch (r) {
    o.logger._log("ERROR", "", "", r);
   }
   return e[0];
  }
  {
   var l = window, c = l.document, p = l.navigator, g = (l.location, c && c.documentElement, 
   p.userAgent.toLowerCase()), f = p.platform.toLowerCase(), h = /webkit/.test(g) ? parseFloat(g.replace(/^.*webkit\/(\d+(\.\d+)?).*$/, "$1")) : -1;
   /webkit/.test(g) && /chrome/.test(g) ? parseFloat(g.replace(/^.*chrome\/(\d+(\.\d+)?).*$/, "$1")) : -1, 
   /trident/.test(g) ? /^(?:.*?[^a-zA-Z])??(?:MSIE|rv\s*\:)\s*(\d+\.?\d*)/i.test(g) ? parseFloat(RegExp.$1, 10) : MSInputMethodContext ? us.substring(us.indexOf("rv:") + 3) : -1 : -1, 
   c.all && /compatible/.test(g) && /trident/.test(g) && /msie/.test(g) && "number" == typeof c.documentMode ? c.documentMode : !1, 
   /gecko/.test(g) && /firefox/.test(g) ? parseFloat(/firefox\/([0-9\.a-z]+)/.exec(g)[1]) : -1, 
   /mac/.test(f ? f : g);
  }
  return {
   _update: e,
   getFlashVersion: d
  };
 }), o.evt.addEventHandler("INIT", function() {
  o.utils.vp._update(), o.ad.replace._setReplacement("env", "KEYS_VALUES", [ "device", "touch", "view", "vpo", "vpc", "flash", "html5" ]);
 }, "ADTAG"), o.evt.addEventHandler("INIT", function() {
  var e = {
   detect: function(e) {
    return e += "?ch=*&rn=*", !1;
   },
   check: function(e, t) {
    try {
     var n = 11 * Math.random();
     e = e.replace(/\*/, t).replace(/\*/, n);
     var a = new XMLHttpRequest();
     return a.open("GET", e, !1), a.send(null), 200 === a.status;
    } catch (i) {
     return o.logger._log("ERROR", "", "", i), !1;
    }
   }
  };
  o.data.setValue("abp", e.detect("//utils.adadapter.netzathleten-media.de/API-1.0/dct/abp/px.gif"));
 }), o.evt.addEventHandler("INIT", function() {
  var e, t, n, a;
  this.patterns = [ {
   dpatt: "de.community.wikia.com",
   cpatt: ".*",
   qpatt: ".*",
   iam_data: {
    st: "entertai",
    cp: "d_de_wikia_com,s_de,f_bt,e_uc,h_sub,l_ol,a_noapp,p_npaid,i_n-so",
    sv: "i2"
   },
   ts_data: {
    agf: "dbusowf_kso_de_wikia_com"
   }
  }, {
   dpatt: ".*",
   cpatt: "/(Nutzungsbedingungen|Datenschutz|Sitemap)",
   qpatt: ".*",
   iam_data: {
    st: "entertai",
    cp: "d_de_wikia_com,s_de,f_bt,e_rc,h_sub,l_ol,a_noapp,p_npaid,i_t-uk",
    sv: "i2"
   },
   ts_data: {
    agf: "dbrsowf_tuk_de_wikia_com"
   }
  }, {
   dpatt: "(fandom.wikia.com|wikia.com)",
   cpatt: "/explore-de",
   qpatt: ".*",
   iam_data: {
    st: "entertai",
    cp: "d_de_wikia_com,s_de,f_bt,e_rc,h_mhp,l_ol,a_noapp,p_npaid,i_t-e",
    sv: "ke"
   },
   ts_data: {
    agf: "dbrfowf_ten_de_wikia_com"
   }
  }, {
   dpatt: ".*",
   cpatt: "^/*$",
   qpatt: ".*",
   iam_data: {
    st: "entertai",
    cp: "d_de_wikia_com,s_de,f_bt,e_rc,h_mhp,l_ol,a_noapp,p_npaid,i_t-e",
    sv: "ke"
   },
   ts_data: {
    agf: "dbrfowf_ten_de_wikia_com"
   }
  }, {
   dpatt: "(dietributevonpanem|jedipedia|elefanten|bier).*",
   cpatt: "^/wiki",
   qpatt: ".*",
   iam_data: {
    st: "entertai",
    cp: "d_de_wikia_com,s_de,f_bt,e_uc,h_sub,l_ol,a_noapp,p_npaid,i_t-e",
    sv: "i2"
   },
   ts_data: {
    agf: "dbusowf_ten_de_wikia_com"
   }
  }, {
   dpatt: "de.*.wikia.com",
   cpatt: ".*",
   qpatt: ".*",
   iam_data: {
    st: "entertai",
    cp: "d_de_wikia_com,s_de,f_bt,e_uc,h_sub,l_ol,a_noapp,p_npaid,i_t-e",
    sv: "i2"
   },
   ts_data: {
    agf: "dbusowf_ten_de_wikia_com"
   }
  } ];
  for (var i = 0; i < this.patterns.length; i++) try {
   if (e = new RegExp(this.patterns[i].dpatt), t = new RegExp(this.patterns[i].cpatt), 
   n = new RegExp(this.patterns[i].qpatt), e.test(window.location.hostname) && t.test(window.location.pathname) && n.test(window.location.search)) {
    window.iam_data = this.patterns[i].iam_data, a = this.patterns[i].ts_data;
    break;
   }
  } catch (u) {
   o.logger._log("ERROR", "", "", u);
  }
  var r = !0;
  try {
   r = window.top.location != window.self.location;
  } catch (u) {
   o.logger._log("ERROR", "", "", u);
  }
  if (!r) {
   var s = 0, d = function() {
    if (document.body) "undefined" == typeof window.iam_data && (window.iam_data = {
     st: "entertai",
     cp: "error"
    }), "object" == typeof window.iom && "function" == typeof window.iom.c && (window.iom.c(window.iam_data, 1), 
    "object" == typeof a && "undefined" != typeof a.agf && (new Image().src = "//technical-service.net/pixel.gif?agf=" + a.agf + "&d=" + o.data.getValue("ord"))); else {
     if (s = ++s || 1, s > 100) return;
     window.setTimeout(d, 300);
    }
   };
   o.utils._getScript("//script.ioam.de/iam.js", function() {
    d();
   }, !1);
  }
 }), o.evt.addEventHandler("INIT", function() {
  var e, t = o.utils._createTag("script", {
   type: "text/javascript",
   src: "//js.revsci.net/gateway/gw.js?auto=t&csid=F09828&bpid=ipdeutschland",
   async: !0
  });
  (e = document.getElementsByTagName("script")[0]).parentNode.insertBefore(t, e);
 }), o.evt.addEventHandler("INIT", function() {
  var e, t = o.utils._createTag("script", {
   type: "text/javascript",
   src: "//dyn.emetriq.de/loader/66956/default.js",
   async: !0
  });
  (e = document.getElementsByTagName("script")[0]).parentNode.insertBefore(t, e);
 }), o.evt.addEventHandler("INIT", function() {
  var e = o.data.getValue("adMedium", "SITEBAR");
  e && !e.enabled && o.data.setValue("SITEBAR", !1);
 }), o.evt.addEventHandler("INIT", function() {
  function e() {
   return screen.width + "x" + screen.height + "x" + screen.colorDepth;
  }
  function t(e) {
   for (var t = 0, n = 0; n < e.length; ++n) t += e.charCodeAt(n), t += t << 10, t ^= t >> 6;
   return t += t << 3, t ^= t >> 11, t += t << 15, t = Math.abs(t & t), t.toString(36);
  }
  function n() {
   var e, t = "", n = [ "7790769C-0471-11D2-AF11-00C04FA35D02", "89820200-ECBD-11CF-8B85-00AA005B4340", "283807B5-2C60-11D0-A31D-00AA00B92C03", "4F216970-C90C-11D1-B5C7-0000F8051515", "44BBA848-CC51-11CF-AAFA-00AA00B6015C", "9381D8F2-0288-11D0-9501-00AA00B911A5", "4F216970-C90C-11D1-B5C7-0000F8051515", "5A8D6EE0-3E18-11D0-821E-444553540000", "89820200-ECBD-11CF-8B85-00AA005B4383", "08B0E5C0-4FCB-11CF-AAA5-00401C608555", "45EA75A0-A269-11D1-B5BF-0000F8051515", "DE5AED00-A4BF-11D1-9948-00C04F98BBC9", "22D6F312-B0F6-11D0-94AB-0080C74C7E95", "44BBA842-CC51-11CF-AAFA-00AA00B6015B", "3AF36230-A269-11D1-B5BF-0000F8051515", "44BBA840-CC51-11CF-AAFA-00AA00B6015C", "CC2A9BA0-3BDD-11D0-821E-444553540000", "08B0E5C0-4FCB-11CF-AAA5-00401C608500", "D27CDB6E-AE6D-11CF-96B8-444553540000", "2A202491-F00D-11CF-87CC-0020AFEECF20" ];
   document.body.addBehavior("#default#clientCaps");
   for (var a = 0; a < n.length; a++) e = document.body.getComponentVersion("{" + n[a] + "}", "ComponentID"), 
   t += null != e ? e : "null";
   return t;
  }
  function a() {
   var a = window.navigator, i = a.userAgent;
   if (i += e(), a.plugins.length > 0) for (var u = 0; u < a.plugins.length; u++) i += a.plugins[u].filename + a.plugins[u].version + a.plugins[u].description;
   if (a.mimeTypes.length > 0) for (var u = 0; u < a.mimeTypes.length; u++) i += a.mimeTypes[u].type;
   if (/MSIE (\d+\.\d+);/.test(a.userAgent)) try {
    i += n();
   } catch (r) {
    o.logger._log("ERROR", "", "", r);
   }
   return t(i);
  }
  !function(e, t, n, a, i, u, r) {
   e[i] || (e.GlobalSnowplowNamespace = e.GlobalSnowplowNamespace || [], e.GlobalSnowplowNamespace.push(i), 
   e[i] = function() {
    (e[i].q = e[i].q || []).push(arguments);
   }, e[i].q = e[i].q || [], u = t.createElement(n), r = t.getElementsByTagName(n)[0], 
   u.async = 1, u.src = a, r.parentNode.insertBefore(u, r));
  }(window, document, "script", "//www.s6w.de/2015-11-02/s.js", "s6w"), window.s6w("newTracker", "trackerPI", "s6w.de", {
   appId: "pi",
   post: !0,
   cookieName: "_s6w_id",
   encodeBase64: !0,
   contexts: {
    performanceTiming: !0,
    gaCookies: !0,
    webPage: !0
   }
  }), window.s6w("trackPageView", null, [ {
   schema: "iglu:de.s6w/pi/jsonschema/0-0-2",
   data: {
    key: "NA-828433-1",
    dom: "de.wikia.com",
    adu: "ew_de.wikia.com",
    vcn: o.data.getValue("vertical") || "",
    cha: o.data.getValue("channel") || "",
    zon: o.data.getValue("zone") || "",
    iam: window.iam_data || {},
    ifp: a()
   }
  } ]);
 }), o.evt.addEventHandler("DOM_READY", function() {
  var e = function() {
   o.data._init({
    theAdExId: {}
   });
   var e = o.data.getValue("zone") || "unknown", t = o.data.getValue("vertical") || "unknown", n = o.data.getValue("ui") || "unknown", a = function() {
    var e = o.data.getValue("n_pbt") || "", t = /j4=([0-2])/.exec(e);
    return t ? t[1] : 0;
   }(), i = function() {
    var e = o.data.getValue("n_pbt") || "", t = /j5=([0-6])/.exec(e);
    return t ? t[1] : 0;
   }(), u = o.data.getValue("theAdExId", e) || 999;
   window._adexc = window._adexc || [], window._adexc.push([ "_kv", {
    katID: u,
    vertID: t,
    siteID: "de.wikia.com",
    ui: n,
    gn: a,
    ag: i,
    aud: "unknown"
   } ]);
   var r = document.createElement("script");
   r.type = "text/javascript", r.async = !0, r.src = "//dmp.theadex.com/d/254/586/s/adex.js";
   var s = document.getElementsByTagName("script")[0];
   s.parentNode.insertBefore(r, s);
  };
  setTimeout(e, 5e3);
 }), function() {
  function e() {
   if (!r && (r = !0, s)) {
    for (var e = 0; e < s.length; e++) s[e].call(window, []);
    s = [];
   }
  }
  function t(e) {
   var t = window.onload;
   window.onload = "function" != typeof window.onload ? e : function() {
    t && t(), e();
   };
  }
  function n() {
   i.psi && "true" == o.data.getValue("psi") || u || (u = !0, document.addEventListener && !i.opera && document.addEventListener("DOMContentLoaded", e, !1), 
   i.msie && window == top && !function() {
    if (!r) {
     try {
      document.documentElement.doScroll("left");
     } catch (t) {
      return o.logger._log("ERROR", "", "", t), void setTimeout(arguments.callee, 0);
     }
     e();
    }
   }(), i.opera && document.addEventListener("DOMContentLoaded", function() {
    if (!r) {
     for (var t = 0; t < document.styleSheets.length; t++) if (document.styleSheets[t].disabled) return void setTimeout(arguments.callee, 0);
     e();
    }
   }, !1), t(e));
  }
  var a = navigator.userAgent.toLowerCase(), i = {
   version: (a.match(/.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/) || [])[1],
   opera: /opera/.test(a),
   msie: /msie/.test(a) && !/opera/.test(a),
   mozilla: /mozilla/.test(a) && !/(compatible|webkit)/.test(a),
   psi: /page speed/.test(a)
  }, u = !1, r = !1, s = [];
  o._ready = function(e) {
   n(), r ? e.call(window, []) : s.push(function() {
    return e.call(window, []);
   });
  }, n();
 }(), o._ready(function() {
  naMediaAd.triggerEvent("DOM_READY");
 }), function() {
  for (var e = window.location.search.replace("?", ""), t = "^[a-zA-Z0-9_]+$", n = e.split("&"), a = 0; a < n.length; a++) {
   var i = n[a].split("=");
   i[0] && i[0].match(t) && i[0].match(/\bnaMediaAd_/) && i[1] && i[1].match(t) && (i[0] = i[0].replace("naMediaAd_", ""), 
   o.logger._log("INFO", "REQUEST_PARAMETER", "INIT", "AdTarget REQUEST_PARAMETER '" + i[0] + "=" + i[1] + "' konfigurieren"), 
   o.data.setValue(i[0], i[1]) === !1 && o.data._putValue(i[0], i[1]));
  }
 }(), r(), o.utils.initGPT = function() {
  window.googletag = window.googletag || {}, googletag.cmd = googletag.cmd || [], 
  googletag.cmd.push(function() {
   "undefined" != typeof googletag.pubadsReady && o.logger._log("INFO", "", "START", "googletag.enableServices was already called from website sourcecode"), 
   ("undefined" == typeof ip_network || "" == ip_network) && (window.ip_network = "www.netzathleten.de"), 
   googletag.pubads().addEventListener("slotRenderEnded", function(e) {
    if (o.logger._log("INFO", "", "START", "slotRenderEnded: "), o.logger._log("INFO", "", "START", e), 
    e.isEmpty || "473364274" == e.lineItemId) {
     var t = e.slot.getSlotElementId(), n = document.getElementById(t);
     o.logger._log("INFO", "", "START", "Slot is empty, attempt to hide it if yet not hidden"), 
     n.style.display = "none";
    }
   }), googletag.pubads().addEventListener("slotVisibilityChanged", function(e) {
    o.logger._log("INFO", "", "START", "slotVisibilityChangedEvent: "), o.logger._log("INFO", "", "START", e);
   });
   var e, t, n;
   "true" == o.data.getValue("gptAsyncRendering") ? (e = googletag.pubads().enableAsyncRendering(), 
   0 == e && o.logger._log("INFO", "", "START", "Couldn't enable gpt async rendering, services already enabled"), 
   googletag.pubads().collapseEmptyDivs(!0, !0)) : (t = googletag.pubads().enableSyncRendering(), 
   0 == t && o.logger._log("INFO", "", "START", "Couldn't enable gpt sync rendering, services already enabled")), 
   "true" == o.data.getValue("gptSra") && (n = googletag.pubads().enableSingleRequest(), 
   0 == n && o.logger._log("INFO", "", "START", "Couldn't enable gpt single request, services already enabled"));
  });
 }, "true" != o.data.getValue("gptLazy") && o.utils.initGPT();
 var s = !1, d = !1, l = !1, c = !1;
 return o.evt.addEventHandler("NUGGAD_DONE", function() {
  s = !0, o.logger._log("INFO", "", "", "NUGGAD_DONE"), u();
 }), o.evt.addEventHandler("AMZN_DONE", function() {
  d = !0, o.logger._log("INFO", "", "", "AMZN_DONE"), u();
 }), o.evt.addEventHandler("DOCCHECK_DONE", function() {
  c = !0, o.logger._log("INFO", "", "", "DOCCHECK_DONE"), u();
 }), o.evt.addEventHandler("YIELDLAB_DONE", function() {
  l = !0, o.logger._log("INFO", "", "", "YIELDLAB_DONE"), u();
 }), o.evt.triggerEvent("INIT"), {
  getValue: e(o.data, "getValue"),
  setValue: e(o.data, "setValue"),
  getVersion: e(o.data, "getVersion"),
  includeAd: e(o.ad, "includeAd"),
  excludeAd: e(o.ad, "excludeAd"),
  renderAd: e(o.ad, "renderAd"),
  addStyle: e(o.ad, "addStyle"),
  triggerEvent: e(o.evt, "triggerEvent"),
  subscribe: e(o.evt, "addEventHandler"),
  console: e(o.logger, "console"),
  getFlashVersion: e(o.utils.vp, "getFlashVersion")
 };
}();