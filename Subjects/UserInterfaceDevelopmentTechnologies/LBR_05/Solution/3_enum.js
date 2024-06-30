"use strict";
var Membership;
(function (Membership) {
    Membership[Membership["Simple"] = 0] = "Simple";
    Membership[Membership["Standard"] = 1] = "Standard";
    Membership[Membership["Premium"] = 2] = "Premium";
})(Membership || (Membership = {}));
;
const membership = Membership.Standard;
const membershipReverse = Membership[2];
console.log(membership);
console.log(membershipReverse);
var SocialMedia;
(function (SocialMedia) {
    SocialMedia["VK"] = "VK";
    SocialMedia["FACEBOOK"] = "FACEBOOK";
    SocialMedia["INSTAGRAM"] = "INSTAGRAM";
})(SocialMedia || (SocialMedia = {}));
;
const social = SocialMedia.INSTAGRAM;
console.log(social);
var Primer;
(function (Primer) {
    Primer[Primer["\u0425\u043E\u0440\u043E\u043E\u0448\u043E"] = 7] = "\u0425\u043E\u0440\u043E\u043E\u0448\u043E";
    Primer[Primer["\u0423\u0434\u043E\u0432\u043B\u0435\u0442\u0432\u043E\u0440\u0438\u0442\u0435\u043B\u044C\u043D\u043E"] = 4] = "\u0423\u0434\u043E\u0432\u043B\u0435\u0442\u0432\u043E\u0440\u0438\u0442\u0435\u043B\u044C\u043D\u043E";
    Primer[Primer["\u041F\u043B\u043E\u0445\u043E"] = 2] = "\u041F\u043B\u043E\u0445\u043E";
})(Primer || (Primer = {}));
;
const perfect = Primer.Хороошо;
const normal = Primer.Удовлетворительно;
const toobad = Primer.Плохо;
console.log(Primer.Хороошо);
