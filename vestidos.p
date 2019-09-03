
% run ~/work/vampire/vampire --mode casc_sat vestidos.p

fof(a1,axiom, aa | ab | ap).
fof(a2,axiom, ca | cb | cp).
fof(a3,axiom, ma | mb | mp).

fof(a4,axiom, aa | ca | ma).
fof(a5,axiom, ab | cb | mb).
fof(a6,axiom, ap | cp | mp).

fof( a7,axiom, ~ (aa & ab)).
fof( a8,axiom, ~ (ab & ap)).
fof( a9,axiom, ~ (aa & ap)).
fof(a10,axiom, ~ (ca & cb)).
fof(a11,axiom, ~ (cb & cp)).
fof(a12,axiom, ~ (ca & cp)).
fof(a10,axiom, ~ (ma & mb)).
fof(a11,axiom, ~ (mb & mp)).
fof(a12,axiom, ~ (ma & mp)).

fof(a13,axiom, ~ (aa & ca)).
fof(a14,axiom, ~ (aa & ma)).
fof(a15,axiom, ~ (ca & ma)).
fof(a16,axiom, ~ (ab & cb)).
fof(a17,axiom, ~ (ab & mb)).
fof(a18,axiom, ~ (cb & mb)).
fof(a19,axiom, ~ (ap & cp)).
fof(a20,axiom, ~ (ap & mp)).
fof(a21,axiom, ~ (cp & mp)).

fof(a22,axiom, aa => ab).
fof(a23,axiom, ca => ~ ab).
fof(a24,axiom, ~ ab).
fof(a25,axiom, ap => cb).
fof(a26,axiom, cp => ~ cb).

% optional
% fof(a27,axiom, ap & cb & ma).
