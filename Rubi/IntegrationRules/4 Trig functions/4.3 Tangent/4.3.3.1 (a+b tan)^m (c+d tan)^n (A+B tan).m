
(* ::Subsection::Closed:: *)
(* 4.3.3.1 (a+b tan)^m (c+d tan)^n (A+B tan) *)
Int[(a_ + b_.*tan[e_. + f_.*x_])^m_.*(c_ + d_.*tan[e_. + f_.*x_])^ n_.*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := a*c/f*Subst[Int[(a + b*x)^(m - 1)*(c + d*x)^(n - 1)*(A + B*x), x], x, Tan[e + f*x]] /; FreeQ[{a, b, c, d, e, f, A, B, m, n}, x] && EqQ[b*c + a*d, 0] && EqQ[a^2 + b^2, 0]
Int[(c_. + d_.*tan[e_. + f_.*x_])*(A_. + B_.*tan[e_. + f_.*x_])/(a_. + b_.*tan[e_. + f_.*x_]), x_Symbol] := B*d/b*Int[Tan[e + f*x], x] + 1/b*Int[Simp[A*b*c + (A*b*d + B*(b*c - a*d))*Tan[e + f*x], x]/(a + b*Tan[e + f*x]), x] /; FreeQ[{a, b, c, d, e, f, A, B}, x] && NeQ[b*c - a*d, 0]
Int[(a_ + b_.*tan[e_. + f_.*x_])^ m_*(c_. + d_.*tan[e_. + f_.*x_])*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := -(A*b - a*B)*(a*c + b*d)*(a + b*Tan[e + f*x])^ m/(2*a^2*f*m) + 1/(2*a*b)* Int[(a + b*Tan[e + f*x])^(m + 1)* Simp[A*b*c + a*B*c + a*A*d + b*B*d + 2*a*B*d*Tan[e + f*x], x], x] /; FreeQ[{a, b, c, d, e, f, A, B}, x] && NeQ[b*c - a*d, 0] && LtQ[m, -1] && EqQ[a^2 + b^2, 0]
Int[(a_. + b_.*tan[e_. + f_.*x_])^ m_*(c_. + d_.*tan[e_. + f_.*x_])*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := (b*c - a*d)*(A*b - a*B)*(a + b*Tan[e + f*x])^(m + 1)/(b*f*(m + 1)*(a^2 + b^2)) + 1/(a^2 + b^2)* Int[(a + b*Tan[e + f*x])^(m + 1)* Simp[a*A*c + b*B*c + A*b*d - a*B*d - (A*b*c - a*B*c - a*A*d - b*B*d)*Tan[e + f*x], x], x] /; FreeQ[{a, b, c, d, e, f, A, B}, x] && NeQ[b*c - a*d, 0] && LtQ[m, -1] && NeQ[a^2 + b^2, 0]
Int[(a_. + b_.*tan[e_. + f_.*x_])^ m_.*(c_. + d_.*tan[e_. + f_.*x_])*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := B*d*(a + b*Tan[e + f*x])^(m + 1)/(b*f*(m + 1)) + Int[(a + b*Tan[e + f*x])^m* Simp[A*c - B*d + (B*c + A*d)*Tan[e + f*x], x], x] /; FreeQ[{a, b, c, d, e, f, A, B, m}, x] && NeQ[b*c - a*d, 0] && Not[LeQ[m, -1]]
Int[(a_ + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := -a^2*(B*c - A*d)*(a + b*Tan[e + f*x])^(m - 1)*(c + d*Tan[e + f*x])^(n + 1)/(d*f*(b*c + a*d)*(n + 1)) - a/(d*(b*c + a*d)*(n + 1))* Int[(a + b*Tan[e + f*x])^(m - 1)*(c + d*Tan[e + f*x])^(n + 1)* Simp[A*b*d*(m - n - 2) - B*(b*c*(m - 1) + a*d*(n + 1)) + (a*A*d*(m + n) - B*(a*c*(m - 1) + b*d*(n + 1)))*Tan[e + f*x], x], x] /; FreeQ[{a, b, c, d, e, f, A, B}, x] && NeQ[b*c - a*d, 0] && EqQ[a^2 + b^2, 0] && GtQ[m, 1] && LtQ[n, -1]
Int[(a_ + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := b*B*(a + b*Tan[e + f*x])^(m - 1)*(c + d*Tan[e + f*x])^(n + 1)/(d* f*(m + n)) + 1/(d*(m + n))* Int[(a + b*Tan[e + f*x])^(m - 1)*(c + d*Tan[e + f*x])^n* Simp[a*A*d*(m + n) + B*(a*c*(m - 1) - b*d*(n + 1)) - (B*(b*c - a*d)*(m - 1) - d*(A*b + a*B)*(m + n))*Tan[e + f*x], x], x] /; FreeQ[{a, b, c, d, e, f, A, B, n}, x] && NeQ[b*c - a*d, 0] && EqQ[a^2 + b^2, 0] && GtQ[m, 1] && Not[LtQ[n, -1]]
Int[(a_ + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := -(A*b - a*B)*(a + b*Tan[e + f*x])^ m*(c + d*Tan[e + f*x])^n/(2*a*f*m) + 1/(2*a^2*m)* Int[(a + b*Tan[e + f*x])^(m + 1)*(c + d*Tan[e + f*x])^(n - 1)* Simp[A*(a*c*m + b*d*n) - B*(b*c*m + a*d*n) - d*(b*B*(m - n) - a*A*(m + n))*Tan[e + f*x], x], x] /; FreeQ[{a, b, c, d, e, f, A, B}, x] && NeQ[b*c - a*d, 0] && EqQ[a^2 + b^2, 0] && LtQ[m, 0] && GtQ[n, 0]
Int[(a_ + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := (a*A + b*B)*(a + b*Tan[e + f*x])^ m*(c + d*Tan[e + f*x])^(n + 1)/(2*f*m*(b*c - a*d)) + 1/(2*a*m*(b*c - a*d))* Int[(a + b*Tan[e + f*x])^(m + 1)*(c + d*Tan[e + f*x])^n* Simp[A*(b*c*m - a*d*(2*m + n + 1)) + B*(a*c*m - b*d*(n + 1)) + d*(A*b - a*B)*(m + n + 1)*Tan[e + f*x], x], x] /; FreeQ[{a, b, c, d, e, f, A, B, n}, x] && NeQ[b*c - a*d, 0] && EqQ[a^2 + b^2, 0] && LtQ[m, 0] && Not[GtQ[n, 0]]
Int[(a_ + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := B*(a + b*Tan[e + f*x])^m*(c + d*Tan[e + f*x])^n/(f*(m + n)) + 1/(a*(m + n))* Int[(a + b*Tan[e + f*x])^m*(c + d*Tan[e + f*x])^(n - 1)* Simp[a*A*c*(m + n) - B*(b*c*m + a*d*n) + (a*A*d*(m + n) - B*(b*d*m - a*c*n))* Tan[e + f*x], x], x] /; FreeQ[{a, b, c, d, e, f, A, B, m}, x] && NeQ[b*c - a*d, 0] && EqQ[a^2 + b^2, 0] && GtQ[n, 0]
Int[(a_ + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := (A*d - B*c)*(a + b*Tan[e + f*x])^ m*(c + d*Tan[e + f*x])^(n + 1)/(f*(n + 1)*(c^2 + d^2)) - 1/(a*(n + 1)*(c^2 + d^2))* Int[(a + b*Tan[e + f*x])^m*(c + d*Tan[e + f*x])^(n + 1)* Simp[A*(b*d*m - a*c*(n + 1)) - B*(b*c*m + a*d*(n + 1)) - a*(B*c - A*d)*(m + n + 1)*Tan[e + f*x], x], x] /; FreeQ[{a, b, c, d, e, f, A, B, m}, x] && NeQ[b*c - a*d, 0] && EqQ[a^2 + b^2, 0] && LtQ[n, -1]
Int[(a_ + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := b*B/f*Subst[Int[(a + b*x)^(m - 1)*(c + d*x)^n, x], x, Tan[e + f*x]] /; FreeQ[{a, b, c, d, e, f, A, B, m, n}, x] && NeQ[b*c - a*d, 0] && EqQ[a^2 + b^2, 0] && EqQ[A*b + a*B, 0]
Int[(a_ + b_.*tan[e_. + f_.*x_])^ m_*(A_. + B_.*tan[e_. + f_.*x_])/(c_. + d_.*tan[e_. + f_.*x_]), x_Symbol] := (A*b + a*B)/(b*c + a*d)* Int[(a + b*Tan[e + f*x])^m, x] - (B*c - A*d)/(b*c + a*d)* Int[(a + b*Tan[e + f*x])^ m*(a - b*Tan[e + f*x])/(c + d*Tan[e + f*x]), x] /; FreeQ[{a, b, c, d, e, f, A, B, m}, x] && NeQ[b*c - a*d, 0] && EqQ[a^2 + b^2, 0] && NeQ[A*b + a*B, 0]
(* Int[(a_+b_.*tan[e_.+f_.*x_])^m_*(c_.+d_.*tan[e_.+f_.*x_])^n_*(A_.+ B_.*tan[e_.+f_.*x_]),x_Symbol] :=  (A*b-a*B)/b*Int[(a+b*Tan[e+f*x])^m*(c+d*Tan[e+f*x])^n,x] + B/b*Int[(a+b*Tan[e+f*x])^(m+1)*(c+d*Tan[e+f*x])^n,x] /;  FreeQ[{a,b,c,d,e,f,A,B,m},x] && NeQ[b*c-a*d,0] && EqQ[a^2+b^2,0] &&  NeQ[c^2+d^2,0] *)
Int[(a_ + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := (A*b + a*B)/b* Int[(a + b*Tan[e + f*x])^m*(c + d*Tan[e + f*x])^n, x] - B/b*Int[(a + b*Tan[e + f*x])^m*(c + d*Tan[e + f*x])^ n*(a - b*Tan[e + f*x]), x] /; FreeQ[{a, b, c, d, e, f, A, B, m, n}, x] && NeQ[b*c - a*d, 0] && EqQ[a^2 + b^2, 0] && NeQ[A*b + a*B, 0]
Int[(a_. + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_ + B_.*tan[e_. + f_.*x_]), x_Symbol] := A^2/f*Subst[Int[(a + b*x)^m*(c + d*x)^n/(A - B*x), x], x, Tan[e + f*x]] /; FreeQ[{a, b, c, d, e, f, A, B, m, n}, x] && NeQ[b*c - a*d, 0] && NeQ[a^2 + b^2, 0] && Not[IntegerQ[m]] && Not[IntegerQ[n]] && Not[IntegersQ[2*m, 2*n]] && EqQ[A^2 + B^2, 0]
Int[(a_. + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := (A + I*B)/2* Int[(a + b*Tan[e + f*x])^m*(c + d*Tan[e + f*x])^ n*(1 - I*Tan[e + f*x]), x] + (A - I*B)/2* Int[(a + b*Tan[e + f*x])^m*(c + d*Tan[e + f*x])^ n*(1 + I*Tan[e + f*x]), x] /; FreeQ[{a, b, c, d, e, f, A, B, m, n}, x] && NeQ[b*c - a*d, 0] && NeQ[a^2 + b^2, 0] && Not[IntegerQ[m]] && Not[IntegerQ[n]] && Not[IntegersQ[2*m, 2*n]] && NeQ[A^2 + B^2, 0]
Int[(a_. + b_.*tan[e_. + f_.*x_])^2*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := -(B*c - A*d)*(b*c - a*d)^2*(c + d*Tan[e + f*x])^(n + 1)/(f* d^2*(n + 1)*(c^2 + d^2)) + 1/(d*(c^2 + d^2))*Int[(c + d*Tan[e + f*x])^(n + 1)* Simp[B*(b*c - a*d)^2 + A*d*(a^2*c - b^2*c + 2*a*b*d) + d*(B*(a^2*c - b^2*c + 2*a*b*d) + A*(2*a*b*c - a^2*d + b^2*d))* Tan[e + f*x] + b^2*B*(c^2 + d^2)*Tan[e + f*x]^2, x], x] /; FreeQ[{a, b, c, d, e, f, A, B}, x] && NeQ[b*c - a*d, 0] && NeQ[a^2 + b^2, 0] && NeQ[c^2 + d^2, 0] && LtQ[n, -1]
Int[(a_. + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := (b*c - a*d)*(B*c - A*d)*(a + b*Tan[e + f*x])^(m - 1)*(c + d*Tan[e + f*x])^(n + 1)/(d*f*(n + 1)*(c^2 + d^2)) - 1/(d*(n + 1)*(c^2 + d^2))* Int[(a + b*Tan[e + f*x])^(m - 2)*(c + d*Tan[e + f*x])^(n + 1)* Simp[a*A* d*(b*d*(m - 1) - a*c*(n + 1)) + (b*B*c - (A*b + a*B)*d)*(b*c*(m - 1) + a*d*(n + 1)) - d*((a*A - b*B)*(b*c - a*d) + (A*b + a*B)*(a*c + b*d))*(n + 1)* Tan[e + f*x] - b*(d*(A*b*c + a*B*c - a*A*d)*(m + n) - b*B*(c^2*(m - 1) - d^2*(n + 1)))*Tan[e + f*x]^2, x], x] /; FreeQ[{a, b, c, d, e, f, A, B}, x] && NeQ[b*c - a*d, 0] && NeQ[a^2 + b^2, 0] && NeQ[c^2 + d^2, 0] && GtQ[m, 1] && LtQ[n, -1] && (IntegerQ[m] || IntegersQ[2*m, 2*n])
Int[(a_. + b_.*tan[e_. + f_.*x_])^2*(A_. + B_.*tan[e_. + f_.*x_])/(c_. + d_.*tan[e_. + f_.*x_]), x_Symbol] := b^2*B*Tan[e + f*x]/(d*f) + 1/d*Int[(a^2*A*d - b^2*B*c + (2*a*A*b + B*(a^2 - b^2))*d* Tan[e + f*x] + (A*b^2*d - b*B*(b*c - 2*a*d))* Tan[e + f*x]^2)/(c + d*Tan[e + f*x]), x] /; FreeQ[{a, b, c, d, e, f, A, B}, x] && NeQ[b*c - a*d, 0] && NeQ[a^2 + b^2, 0] && NeQ[c^2 + d^2, 0]
Int[(a_. + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := b*B*(a + b*Tan[e + f*x])^(m - 1)*(c + d*Tan[e + f*x])^(n + 1)/(d* f*(m + n)) + 1/(d*(m + n))* Int[(a + b*Tan[e + f*x])^(m - 2)*(c + d*Tan[e + f*x])^n* Simp[a^2*A*d*(m + n) - b*B*(b*c*(m - 1) + a*d*(n + 1)) + d*(m + n)*(2*a*A*b + B*(a^2 - b^2))*Tan[e + f*x] - (b*B*(b*c - a*d)*(m - 1) - b*(A*b + a*B)*d*(m + n))* Tan[e + f*x]^2, x], x] /; FreeQ[{a, b, c, d, e, f, A, B, n}, x] && NeQ[b*c - a*d, 0] && NeQ[a^2 + b^2, 0] && NeQ[c^2 + d^2, 0] && GtQ[m, 1] && (IntegerQ[m] || IntegersQ[2*m, 2*n]) && Not[IGtQ[n, 1] && (Not[IntegerQ[m]] || EqQ[c, 0] && NeQ[a, 0])]
Int[(a_. + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := (A*b - a*B)*(a + b*Tan[e + f*x])^(m + 1)*(c + d*Tan[e + f*x])^ n/(f*(m + 1)*(a^2 + b^2)) + 1/(b*(m + 1)*(a^2 + b^2))* Int[(a + b*Tan[e + f*x])^(m + 1)*(c + d*Tan[e + f*x])^(n - 1)* Simp[b*B*(b*c*(m + 1) + a*d*n) + A*b*(a*c*(m + 1) - b*d*n) - b*(A*(b*c - a*d) - B*(a*c + b*d))*(m + 1)*Tan[e + f*x] - b*d*(A*b - a*B)*(m + n + 1)*Tan[e + f*x]^2, x], x] /; FreeQ[{a, b, c, d, e, f, A, B}, x] && NeQ[b*c - a*d, 0] && NeQ[a^2 + b^2, 0] && NeQ[c^2 + d^2, 0] && LtQ[m, -1] && LtQ[0, n, 1] && (IntegerQ[m] || IntegersQ[2*m, 2*n])
Int[(a_. + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := b*(A*b - a*B)*(a + b*Tan[e + f*x])^(m + 1)*(c + d*Tan[e + f*x])^(n + 1)/(f*(m + 1)*(b*c - a*d)*(a^2 + b^2)) + 1/((m + 1)*(b*c - a*d)*(a^2 + b^2))* Int[(a + b*Tan[e + f*x])^(m + 1)*(c + d*Tan[e + f*x])^n* Simp[b*B*(b*c*(m + 1) + a*d*(n + 1)) + A*(a*(b*c - a*d)*(m + 1) - b^2*d*(m + n + 2)) - (A*b - a*B)*(b*c - a*d)*(m + 1)*Tan[e + f*x] - b*d*(A*b - a*B)*(m + n + 2)*Tan[e + f*x]^2, x], x] /; FreeQ[{a, b, c, d, e, f, A, B, n}, x] && NeQ[b*c - a*d, 0] && NeQ[a^2 + b^2, 0] && NeQ[c^2 + d^2, 0] && LtQ[m, -1] && (IntegerQ[m] || IntegersQ[2*m, 2*n]) && Not[ILtQ[n, -1] && (Not[IntegerQ[m]] || EqQ[c, 0] && NeQ[a, 0])]
Int[(a_. + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := B*(a + b*Tan[e + f*x])^m*(c + d*Tan[e + f*x])^n/(f*(m + n)) + 1/(m + n)* Int[(a + b*Tan[e + f*x])^(m - 1)*(c + d*Tan[e + f*x])^(n - 1)* Simp[a*A*c*(m + n) - B*(b*c*m + a*d*n) + (A*b*c + a*B*c + a*A*d - b*B*d)*(m + n)* Tan[e + f*x] + (A*b*d*(m + n) + B*(a*d*m + b*c*n))* Tan[e + f*x]^2, x], x] /; FreeQ[{a, b, c, d, e, f, A, B}, x] && NeQ[b*c - a*d, 0] && NeQ[a^2 + b^2, 0] && NeQ[c^2 + d^2, 0] && LtQ[0, m, 1] && LtQ[0, n, 1]
Int[(A_. + B_.*tan[e_. + f_.*x_])/((a_ + b_.*tan[e_. + f_.*x_])*(c_. + d_.*tan[e_. + f_.*x_])), x_Symbol] := (B*(b*c + a*d) + A*(a*c - b*d))* x/((a^2 + b^2)*(c^2 + d^2)) + b*(A*b - a*B)/((b*c - a*d)*(a^2 + b^2))* Int[(b - a*Tan[e + f*x])/(a + b*Tan[e + f*x]), x] + d*(B*c - A*d)/((b*c - a*d)*(c^2 + d^2))* Int[(d - c*Tan[e + f*x])/(c + d*Tan[e + f*x]), x] /; FreeQ[{a, b, c, d, e, f, A, B}, x] && NeQ[b*c - a*d, 0] && NeQ[a^2 + b^2, 0] && NeQ[c^2 + d^2, 0]
Int[Sqrt[c_. + d_.*tan[e_. + f_.*x_]]*(A_. + B_.*tan[e_. + f_.*x_])/(a_. + b_.*tan[e_. + f_.*x_]), x_Symbol] := 1/(a^2 + b^2)* Int[Simp[ A*(a*c + b*d) + B*(b*c - a*d) - (A*(b*c - a*d) - B*(a*c + b*d))*Tan[e + f*x], x]/Sqrt[c + d*Tan[e + f*x]], x] - (b*c - a*d)*(B*a - A*b)/(a^2 + b^2)* Int[(1 + Tan[e + f*x]^2)/((a + b*Tan[e + f*x])* Sqrt[c + d*Tan[e + f*x]]), x] /; FreeQ[{a, b, c, d, e, f, A, B}, x] && NeQ[b*c - a*d, 0] && NeQ[a^2 + b^2, 0] && NeQ[c^2 + d^2, 0]
Int[(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_])/(a_. + b_.*tan[e_. + f_.*x_]), x_Symbol] := 1/(a^2 + b^2)* Int[(c + d*Tan[e + f*x])^n* Simp[a*A + b*B - (A*b - a*B)*Tan[e + f*x], x], x] + b*(A*b - a*B)/(a^2 + b^2)* Int[(c + d*Tan[e + f*x])^ n*(1 + Tan[e + f*x]^2)/(a + b*Tan[e + f*x]), x] /; FreeQ[{a, b, c, d, e, f, A, B, n}, x] && NeQ[b*c - a*d, 0] && NeQ[a^2 + b^2, 0] && NeQ[c^2 + d^2, 0]
Int[Sqrt[a_. + b_.*tan[e_. + f_.*x_]]*(A_. + B_.*tan[e_. + f_.*x_])/ Sqrt[c_. + d_.*tan[e_. + f_.*x_]], x_Symbol] := Int[Simp[a*A - b*B + (A*b + a*B)*Tan[e + f*x], x]/(Sqrt[a + b*Tan[e + f*x]]*Sqrt[c + d*Tan[e + f*x]]), x] + b*B*Int[(1 + Tan[e + f*x]^2)/(Sqrt[a + b*Tan[e + f*x]]* Sqrt[c + d*Tan[e + f*x]]), x] /; FreeQ[{a, b, c, d, e, f, A, B}, x] && NeQ[b*c - a*d, 0] && NeQ[a^2 + b^2, 0] && NeQ[c^2 + d^2, 0]
(* Int[(A_.+B_.*tan[e_.+f_.*x_])/(Sqrt[a_.+b_.*tan[e_.+f_.*x_]]*Sqrt[ c_.+d_.*tan[e_.+f_.*x_]]),x_Symbol] :=  A^2/f*Subst[Int[1/((A-B*x)*Sqrt[a+b*x]*Sqrt[c+d*x]),x],x,Tan[e+f*x]] /;  FreeQ[{a,b,c,d,e,f,A,B},x] && NeQ[b*c-a*d,0] && NeQ[a^2+b^2,0] &&  NeQ[c^2+d^2,0] && EqQ[A^2+B^2,0] *)
(* Int[(A_.+B_.*tan[e_.+f_.*x_])/(Sqrt[a_.+b_.*tan[e_.+f_.*x_]]*Sqrt[ c_.+d_.*tan[e_.+f_.*x_]]),x_Symbol] :=  (A+I*B)/2*Int[(1-I*Tan[e+f*x])/(Sqrt[a+b*Tan[e+f*x]]*Sqrt[c+d*Tan[e+f* x]]),x] + (A-I*B)/2*Int[(1+I*Tan[e+f*x])/(Sqrt[a+b*Tan[e+f*x]]*Sqrt[c+d*Tan[e+ f*x]]),x] /; FreeQ[{a,b,c,d,e,f,A,B},x] && NeQ[b*c-a*d,0] &&  NeQ[a^2+b^2,0] && NeQ[c^2+d^2,0] && NeQ[A^2+B^2,0] *)
Int[(a_. + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := A^2/f*Subst[Int[(a + b*x)^m*(c + d*x)^n/(A - B*x), x], x, Tan[e + f*x]] /; FreeQ[{a, b, c, d, e, f, A, B, m, n}, x] && NeQ[b*c - a*d, 0] && NeQ[a^2 + b^2, 0] && EqQ[A^2 + B^2, 0]
Int[(a_. + b_.*tan[e_. + f_.*x_])^m_*(c_. + d_.*tan[e_. + f_.*x_])^ n_*(A_. + B_.*tan[e_. + f_.*x_]), x_Symbol] := (A + I*B)/2* Int[(a + b*Tan[e + f*x])^m*(c + d*Tan[e + f*x])^ n*(1 - I*Tan[e + f*x]), x] + (A - I*B)/2* Int[(a + b*Tan[e + f*x])^m*(c + d*Tan[e + f*x])^ n*(1 + I*Tan[e + f*x]), x] /; FreeQ[{a, b, c, d, e, f, A, B, m, n}, x] && NeQ[b*c - a*d, 0] && NeQ[a^2 + b^2, 0] && NeQ[A^2 + B^2, 0]