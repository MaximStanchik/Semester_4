enum Membership {
    Simple,
    Standard,
    Premium
};

const membership = Membership.Standard;
const membershipReverse = Membership[2];

console.log(membership);
console.log(membershipReverse);

enum SocialMedia {
    VK = 'VK',
    FACEBOOK = 'FACEBOOK',
    INSTAGRAM = 'INSTAGRAM'
};

const social = SocialMedia.INSTAGRAM;
console.log(social);

enum Primer {
    Хороошо = 7,
    Удовлетворительно = 4,
    Плохо = 2
};

const perfect =Primer.Хороошо;
const normal =Primer.Удовлетворительно;
const toobad =Primer.Плохо;

console.log(Primer.Хороошо);

