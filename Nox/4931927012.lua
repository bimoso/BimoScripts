local replacements = {
	["SigmaZ Hub"] = "NoxHub",
	["Made by 08v3"] = "Basketball Legends",
	["Loader"] = "Load Script",
	["Whitelist"] = "",
	["Purchase in discord!"] = "Basketball Legends",
	["Premium | V4.7"] = "Basketball Legends",
	["Version: 4.7"] = "discord.gg/noxhub",
}

-- 🔁 Applies replacements to a string if it contains any match
local function applyReplacements(str)
	if typeof(str) ~= "string" then
		return str
	end
	for original, replacement in pairs(replacements) do
		if str:find(original, 1, true) then
			str = str:gsub(original, replacement)
		end
	end
	return str
end

local mt = getrawmetatable(game)
setreadonly(mt, false)

local old_index = mt.__index
local old_newindex = mt.__newindex
local old_namecall = mt.__namecall

mt.__namecall = function(self, ...)
	local method = getnamecallmethod()
	local args = table.pack(...)
	for i = 1, args.n do
		if typeof(args[i]) == "string" then
			args[i] = applyReplacements(args[i])
		end
	end
	return old_namecall(self, table.unpack(args, 1, args.n))
end

mt.__newindex = function(self, key, value)
	if typeof(value) == "string" then
		value = applyReplacements(value)
	end
	return old_newindex(self, key, value)
end

mt.__index = function(self, key)
	local result = old_index(self, key)
	if typeof(result) == "string" then
		return applyReplacements(result)
	end
	return result
end

setreadonly(mt, true)

local ORIGINAL_SIG1 = "https://pastefy.app/NJ3KPS5z/raw"
local function generateBypassScript()
	local id = game:GetService("RbxAnalyticsService"):GetClientId()
	return "return { [1] = '" .. id .. "' }"
end

local function rewrite(url)
	if type(url) == "string" and url:find(ORIGINAL_SIG1, 1, true) then
		return generateBypassScript(), true
	end
	return url, false
end

-- HttpGet hook
do
	local mt = getrawmetatable(game)
	setreadonly(mt, false)
	local origIndex = mt.__index
	local origNamecall = mt.__namecall
	mt.__index = function(self, key)
		if self == game and (key == "HttpGet" or key == "HttpGetAsync") then
			return function(_, url, ...)
				local replacement, fake = rewrite(url)
				if fake then
					return replacement
				end
				return origIndex(self, key)(self, url, ...)
			end
		end
		return origIndex(self, key)
	end
	mt.__namecall = function(self, ...)
		local method = getnamecallmethod()
		if self == game and (method == "HttpGet" or method == "HttpGetAsync") then
			local args = {
				...
			}
			local replacement, fake = rewrite(args[1])
			if fake then
				return replacement
			end
			return origNamecall(self, unpack(args))
		end
		return origNamecall(self, ...)
	end
	setreadonly(mt, true)
end

local replacements = {
	["SigmaZ Hub"] = "NoxHub",
	["Made by 08v3"] = "Basketball Legends",
	["Loader"] = "Load Script",
	["Whitelist"] = "",
	["Purchase in discord!"] = "Basketball Legends",
	["Premium | V4.7"] = "Basketball Legends",
	["Version: 4.7"] = "discord.gg/noxhub",
}

-- 🔁 Applies replacements to a string if it contains any match
local function applyReplacements(str)
	if typeof(str) ~= "string" then
		return str
	end
	for original, replacement in pairs(replacements) do
		if str:find(original, 1, true) then
			str = str:gsub(original, replacement)
		end
	end
	return str
end

local mt = getrawmetatable(game)
setreadonly(mt, false)

local old_index = mt.__index
local old_newindex = mt.__newindex
local old_namecall = mt.__namecall

mt.__namecall = function(self, ...)
	local method = getnamecallmethod()
	local args = table.pack(...)
	for i = 1, args.n do
		if typeof(args[i]) == "string" then
			args[i] = applyReplacements(args[i])
		end
	end
	return old_namecall(self, table.unpack(args, 1, args.n))
end

mt.__newindex = function(self, key, value)
	if typeof(value) == "string" then
		value = applyReplacements(value)
	end
	return old_newindex(self, key, value)
end

mt.__index = function(self, key)
	local result = old_index(self, key)
	if typeof(result) == "string" then
		return applyReplacements(result)
	end
	return result
end

setreadonly(mt, true);

([[This file was protected with MoonSec V3]]):gsub('.+', (function(a)
	_iFhksmUvkraL = a;
end));
return (function(n, ...)
	local e;
	local o;
	local a;
	local h;
	local k;
	local c;
	local d = 24915;
	local t = 0;
	local f = {};
	while t < 853 do
		t = t + 1;
		while t < 427 and d % 15580 < 7790 do
			t = t + 1
			d = (d + 621) % 6109
			local l = t + d
			if (d % 2844) < 1422 then
				d = (d - 395) % 47949
				while t < 107 and d % 2760 < 1380 do
					t = t + 1
					d = (d + 122) % 15548
					local h = t + d
					if (d % 18198) > 9099 then
						d = (d - 362) % 32502
						local d = 8422
						if not f[d] then
							f[d] = 1
							e = getfenv and getfenv();
						end
					elseif d % 2 ~= 0 then
						d = (d + 417) % 9554
						local d = 92189
						if not f[d] then
							f[d] = 1
							a = {};
						end
					else
						d = (d * 480) % 44620
						t = t + 1
						local d = 50977
						if not f[d] then
							f[d] = 1
							k = string;
						end
					end
				end
			elseif d % 2 ~= 0 then
				d = (d * 730) % 23466
				while t < 338 and d % 10226 < 5113 do
					t = t + 1
					d = (d + 999) % 31296
					local c = t + d
					if (d % 18408) <= 9204 then
						d = (d + 773) % 7229
						local d = 47860
						if not f[d] then
							f[d] = 1
							h = function(f)
								local d = 1
								local function t(t)
									d = d + t
									return f:sub(d - t, d - 1)
								end
								while true do
									local f = t(1)
									if (f == "\5") then
										break
									end
									local d = k.byte(t(1))
									local d = t(d)
									if f == "\2" then
										d = a.OhBfB_LQ(d)
									elseif f == "\3" then
										d = d ~= "\0"
									elseif f == "\6" then
										e[d] = function(d, t)
											return n(8, nil, n, t, d)
										end
									elseif f == "\4" then
										d = e[d]
									elseif f == "\0" then
										d = e[d][t(k.byte(t(1)))];
									end
									local t = t(8)
									a[t] = d
								end
							end
						end
					elseif d % 2 ~= 0 then
						d = (d - 989) % 43469
						local d = 92733
						if not f[d] then
							f[d] = 1
						end
					else
						d = (d * 889) % 31721
						t = t + 1
						local d = 20138
						if not f[d] then
							f[d] = 1
						end
					end
				end
			else
				d = (d - 574) % 2824
				t = t + 1
				while t < 761 and d % 17600 < 8800 do
					t = t + 1
					d = (d - 527) % 15286
					local h = t + d
					if (d % 9102) < 4551 then
						d = (d + 879) % 33057
						local d = 17362
						if not f[d] then
							f[d] = 1
							e = (not e) and _ENV or e;
						end
					elseif d % 2 ~= 0 then
						d = (d - 730) % 17543
						local d = 6261
						if not f[d] then
							f[d] = 1
							o = tonumber;
						end
					else
						d = (d + 593) % 46172
						t = t + 1
						local d = 73502
						if not f[d] then
							f[d] = 1
							c = "\4\8\116\111\110\117\109\98\101\114\79\104\66\102\66\95\76\81\0\6\115\116\114\105\110\103\4\99\104\97\114\110\83\103\105\101\106\84\84\0\6\115\116\114\105\110\103\3\115\117\98\121\114\70\104\67\95\77\116\0\6\115\116\114\105\110\103\4\98\121\116\101\109\81\99\113\82\95\80\106\0\5\116\97\98\108\101\6\99\111\110\99\97\116\68\103\87\70\108\69\100\74\0\5\116\97\98\108\101\6\105\110\115\101\114\116\122\86\83\65\108\105\76\117\5";
						end
					end
				end
			end
		end
		d = (d - 798) % 12017
	end
	h(c);
	local d = {};
	for t = 0, 255 do
		local f = a.nSgiejTT(t);
		d[t] = f;
		d[f] = t;
	end
	local function l(t)
		return d[t];
	end
	local k = (function(n, h)
		local c, f = 1, 16
		local t = {
			{},
			{},
			{}
		}
		local e = -1
		local d = 1
		local k = n
		while true do
			t[3][a.yrFhC_Mt(h, d, (function()
				d = c + d
				return d - 1
			end)())] = (function()
				e = e + 1
				return e
			end)()
			if e == (15) then
				e = ""
				f = 0
				break
			end
		end
		local e = #h
		while d < e + 1 do
			t[2][f] = a.yrFhC_Mt(h, d, (function()
				d = c + d
				return d - 1
			end)())
			f = f + 1
			if f % 2 == 0 then
				f = 0
				a.zVSAliLu(t[1], (l((((t[3][t[2][0]] or 0) * 16) + (t[3][t[2][1]] or 0) + k) % 256)));
				k = n + k;
			end
		end
		return a.DgWFlEdJ(t[1])
	end);
	h(k(231, "oPy 8L-u)YXh^v/kP/"));
	h(k(13, "!/=g#%c;6HnP2J.uug.2#2#1g//P/guu6u.=.cJ/2;ngH2n/c2;ncncg%2.cJng6/.mu^JKAu/2#J/nPPun;Hu;/=(/;;%cn%##2#%g.Agugucu6J%Ju2g%2%%P%nHHn6#;2c6uH%#gP#/=g/P.uQJS/J;.22nPnH%g.g%H/;6;.c%u%#ugn=.g#/u/%J.22J#2#J;2.Png.gHHg;6;ncc%/%ggggH/H8JZnucu2.uJHH.2nHHn6;H=4/c%6%n#P#ugJgg.;/JRcJ....hJ;n=6u#ggcH2;H;#;=%g%2#m/==PNnu;JJ6P;Jn6JHneP#;u;G6Hcn;nu.u%%##=gH=J/.V6Cp.2J_P=PJ2%Pn6=naHg/G<6cn#ng.gP=;PP/JhHu..=J;J=2JHu6;n2;J6ncJ;/uc.P#JgH=./=};i=uP2;.6PnngP/Pg6/=c/n;6cJ%;#u#6=JuP/PIg.P2n.unuc%%nPHn;H.H=6gcJc%%//u/Jzct;/=mu.>Jc;PcJ2P2Qnnn=HP;.;2c.%.#P%=/6F.PcnPDPux.nJc2;2PHcH%ncH6;J%n%%##.=JHg%/2==fHHH.J.cJ22u2%H%n6n/6g6cc2#xg%.g"));
	bFCnUiTAkIvCWQP = function(d)
		d((-22700 + (function()
			local h, e = 0, 1;
			(function(d, f, t)
				t(f(t, t, d), d(d, f, d), f(t, f, t) and d(t, f, d and d))
			end)(function(f, d, t)
				if h > 127 then
					return f
				end
				h = h + 1
				e = (e - 442) % 46542
				if (e % 1860) < 930 then
					return t(d(t, t, f), t(d, d, t), t(f, d, f))
				else
					return d
				end
				return d
			end, function(t, d, f)
				if h > 458 then
					return t
				end
				h = h + 1
				e = (e - 773) % 6477
				if (e % 1390) < 695 then
					e = (e + 197) % 25967
					return f
				else
					return d(t(d, d and t, d) and t(t, d, d), t(d, f, d) and t(t, f and f, f), d(f, t, t))
				end
				return t(d(f, f, d), d(d and d, t, t), d(d, t, t))
			end, function(f, t, d)
				if h > 323 then
					return f
				end
				h = h + 1
				e = (e + 257) % 36632
				if (e % 1158) < 579 then
					e = (e * 407) % 37874
					return f
				else
					return f(t(d, f and f, f and f) and t(t and t, t, d), d(d, f, d and t), d(d, t, t) and d(f, t, t))
				end
				return f(f(f and f, t, d), t(d and d, d, d) and d(d, f, f and d), d(t, t, t))
			end)
			return e;
		end)()))
	end;
	PQWCvIkATiUnCFb = {
		a.XG_tvKvv,
		a.fAncXDvC
	};
	local d = (-7537 + (function()
		local f, t = 0, 1;
		(function(d)
			d(d(d and d))
		end)(function(d)
			if f > 398 then
				return d
			end
			f = f + 1
			t = (t * 227) % 34184
			if (t % 1204) <= 602 then
				t = (t - 81) % 17794
				return d
			else
				return d(d(d))
			end
			return d(d(d) and d(d))
		end)
		return t;
	end)())
	local l = a.qJxWMhwR or a.sRGyWqar;
	local hd = (getfenv) or (function()
		return _ENV
	end);
	local e = 2;
	local j = 1;
	local h = 3;
	local c = 4;
	local function td(u, ...)
		local s = k(d, "ZdkfS-?PG=cA&Tthf?fkSA?SPt=?ch&Gtdhcdfk&S-?wPT=6c=&kSt?GPhGhcTAhPf=fcfA&T-t&Gf=PAS&tt-h-dfk-TdhS_ddcffScAStAdfhAfT-f?GGcc==P&APc=-cc&fT&-GP?GGAk-APcGAcSATTSSPP&GcAA&9t?n{c6AtT>t=_kGdcfAh&AtXhAd=&&hdh&d-ktS-&PtctbdAfP-G?A?&c?ASTST&tncP&-TPhN_=ksch&AT?hku&fkTfh-Wfd&f-S&A?tTd-:TfG-tPAGP=cA-?fGk=fc&&-T&SPG&c-AccctdU=cPAhTGhd/ckff&--ctG=cAA=TktACk=dcTAGTSh&d?kTfT-A?Td=ScS=?kPA=k6kfT-??t?&=Pct&fT_ickdfdSh?dG?PSct&kTAh-dP(fSh?GPhkIf&-8?=Gk_hd-kh-k?SdcfPSc?fP&=fk?Sd-d?hGtkTSG-TP?Gh>cfcSt-G4tkcft-PPnGPddkSS=-c>GktfG-d?ct-tkhGf&f&?=?TPfA?cThfT=>?d=fdh&d=k&S--tP-eGdkff--?hVhStfh-GPdGGhhk&S??=khGtcc&?TGc&d&dhScd{P==Scc&GTkt=dfdTf-,cPcG-c=A?GP&TMGkdf=fP?kP=Sh=t=SPfGAcSATT?thtG=wPc--P+G-=tAP&t?GPT=ff-ST??Ph=GAd&cTffAdPftSP?1P==LmfdTf&SdGTP=AScf&hhT3kfSkkftPfkSft-S?TG?dkkTfft&dPd&f-St?-Tc^ffkdS-c??GcA)&STkt-*tMPfk-GP-Gd=Sch-TPGGTc?AhS&?cPcGGftP??tGPc7APSk?PGz=-Ad=d=hAGdkd&SP?d?AG-AdPh&Ahf_&tSd&fdff?SGk=t==hP&-kdk=-GhP)AkSfT-c?hGGcdA&T=t&0-dtf-&GTkhfd-kh&hdthhdGfdSG&?TP)?dTf&S=-AfcPA&d&PTATdTpkk-dP4fSGtAG&S=Ghhd=fPh&-?kt=Pc-&AThhSd=kch??SPAG?c&PhG&tGoTk-SSSc?-Gh-SA&TTtThTkf&StYhSaTk?fTcAtkh-d?Att#tt+PkvfPcdTG Ch-kcfG?=?t=SctS&?-Pt=PAiT-tkhAdSfhSP-hPG=dcA&fT&h-YtkcSY-cPkGAcSATT?IhdSkdfA-f?TG-ckAPT3htWkd&fSSh??Ph=GAd&Ttfh&d-ktSP?kP==?Ak&STTh?dGkGSk-c=fTAc-&fTPhSl=k-fA??G=GPc?AGTftc!fd&f-fG?PG-==A=&At-hTd&GkSG?dPc==c&&?Tth=d/kT&?-APSGTc&AhT=hd^cA?f&--?tGGc+A=Tkhk6SdTf?-B?GGd=cAf&&t-tt-?fkSt?kPA=SkdkPSd?SP?k&S=-&P-GtdcfSSA-AP=GAfh-??hGGcdAATft&%-dtfP-YT=&k=&AS&Tt?hhdGfdSccfPt=?ct&Pt hPdfkASS-TP?GhcG&dTchfV&k-Sn-TPFG=ckAATftTLGdhfG-d?cGf=&&f&ttcaHdcfkSA?SPT==ch&&tdhAdfk&S--tG>=6c&&kTThS<hk?fh-hPdG&cfA&T-hdHPkDfh-k?AGS=tA?&htGWkShffS&?-PtkfAv&ctkhAdSkTS?-h=p=kc&&fT&h- tkPSCtTPkG&cSAhT?hdKGSPft-f?TG-cSAPTdt=+SdAfGTd??Ph=GAP&ctSh&d=AkSP?)P==hcA&-TTh?=AkGSk-cPSG&c-AtTPoGsckSfA-S?TG?=hAtT-tAa?d&f-St?GGV=AAk&AdPhTd?khSG?dPc=fc&TPTthPdVkASk-APSGT=5AhT=hd;TkffT--Pk1AcoA=Tkdt4Sdtf?ShhSGd=AAf&&t-htdPfw?d?fPT=ScT&?ThhGddAtSf-TP-=bcP&kT=dGtfkSft-?ckGGckAcT?t&E=ckfP- ?=A-=AA-&Tt?GzdGfkSc?fP&=-ctT-dGh=dfkA-c-TPPGhc=&dTtPPi&k-ft?TPxGcckAh-GtT+?dh?A-d?AGf=&Sd&ttGQsd&fkSA?SPT&Gch&ctdhcdfk&S-PXGT=Hc&&kT&hSnTk?-d?dPdGtcfATT-ttHPkWSk-k?&GScdA?TdtGkPkcffST?-=&=PAd&=t=hAdGAdS?-hPGchcc&ST&h==kkPS)-=c-GAc-ATtG_Ax=kkfc-P?&G-=t&=t&tcOSdAfcST??Ph=Gfk&ct?h&d-ktSP?+GActc&&GTThP7hkGSd-tGOG&cPAt<=h,ickkfA?&?tG&=hA=TdtcVfd&kPSt?tGs=TAk&AtShTdPkh-^?dPt=fc&&-Tth=d,fkSk-tPSGTc?AhtShddSkff&--?tGPcR&kTkh?zSkkf?Sh?GGdcJAfTGt-CfdPf1S=?kG==SA?&?tAhGdfkcSf?hP-=?cP&GT=hA+AkSS?-?PGGGc?AcTft&y-kSfP-G?=Gc=AAT&Tq???dGf=Sc?AP&=cct&PWkh=d=kASA-TPtGhcGf?TchS1&kAft-tP2GTfcAAT?tTk=dhf=-d?c-S=&A?&tt=X#d=fkSAf-PT=?ch&ctdhcdfk&TG-tPP=8cc&kTAhSfkk?fh-GPf=fcfA&T-t&-kG=cT&?T-tTQGk=TdthrddcffScA=h-V<d&f?-&hTdAkTS?-hP?h^dAf=SG?&GTk=SG-=PkGAckdGSf-cGS=kAd&=?t=k=tAPTytP-TGAcA&&&fhc_-kAdA-=?cG&khSP?oP==kcA&STTf?dDkGSd-cPfG&c-fPdPhkdfkkfA-S?ATkd=kdSRS-Ph=Tc=AA?=GG==Ak&Atk-YGfA,AkTkhDhhctTETthPdUkPA+T-tANkhTkTS??&PP=hft-c?tGPc>APkT-&G?GcfG-S?GGd=cAdkP-??cGSffSc?SG?=ScT&?TT?&GG=fchTPhdFGdGf?SGhSddkSfT-??TT=d?kfSk-=(PkffP-:?=G:tGkcSc-A4kdGff-k?fP&=-c&dP-&P-GcPcAdT=PG=AcG&dTchd--=,AGTGtShcvT_-SG?cGikBfG-d?cGf=&v--kkPakktfkSA?SPAttk&SkS&?cP&cPAkG?tGY?TdktS&?hPG=TA=&S=cG&tTA&T-tt8-=uA-&ttfhhThtTm?-PPk=?cf&=&hASRkkPftd=?-G-=&A-&Gtk+GkAhTd-khS-P&c=&St?h&KthS-!-&P&Gtcf&tT=JOT-kAf=?-?h=?A8GSTkh?dPkPft-c?-Gd?-A&&=tSi?d&ktdfPkGhcSSf?fPfG&c-A&ff-=PfPdA-&Atchtcd&hTdtc!fdcGdAhtkt=6fk?fG-q-&GPc-ASTGh=TtkffA-cPdGP=TAT-TPAGTc?AhT?fAGP=hAG&&tSG=c?A=TktA4kPcGk&9TTAA=&AG&&t-htd-G?AkTPtG=?A-&?ThhG!hPTAXTT&Na-dfkTTAhk9AkSfT-GPAGGcdAcTdS1P&GPcfPG&StTd-k-S-?k6dk-fdSc?fPcthdhf?-qP--TckAcT=hR8?d&&fThhf_&k-f&&?T=htOhATt=tT>?dhf?c&TAhkdddtf;qh-}=?=&Pf&ftTlPkAf---?AGtcGSP?kPP=;c=&vfP-TPPkGSS-GPdGccdd!Sk-&Gfkkfh-k?AGS=AdkSy?SP-GPf---?-Pt=PctkS-h?-= =t&kTft-=kcc&fT&!drtkPS,-APAGAcSATTSSfP=GhcP&hTThcsAA=TPt=5kdAfkcfTThAB=dhSAtSh&d-ktSP?_P==ktA&-TTh?uhkGSd-c?f&AcP&STPh;(=kg=P&-t=hcN&AcT?tcUfd&ff&TT2hdd-AS&htShTd?kTfkB?d =-Ax&-TthP7tcGATTfP?=tc?AhTGth?==fcTTdTAhAddfSStdf-h=tAd&AT-h?=&AP&&t-htd-dctTthPTc8cT&?Thh?-T=PAt&Pthhhdhf&Sc?=Gdk?SS-??hGG=hdPS=?pP&GPcf- ?=Gk=AAShCt?hhdGfdT??fP&=-ct&Pt*h=dG=TSS-TP?ckcG&kTchfr&k=&k-PPBG=A-AAT-tTK?cAfG-d?cGS=&A-&t:P?Gd=fkSA?SPT=Gch&GhGhcd-k&S--tPc=xT=TkTAh?ETkAfh?dPdAcc&A&TPttdkk7Sf-k=A=S=TAG&ht=+ddtffS&PfPt=PAa&Atkh&dSfhSt-hPG=dA<&fT&h-k^f#SY-cPkGhcSATT?thdbkdfc-f?tG-=hAPT)hh,kdAfSSt??Ph=GTdd=tfh&d-ktSP?&P==kkG&STTh?ddkGSk-cG-nGc-AtTPhGm=kkfA-SStG?=hAGTktcpSd&f=Tk?PG9==TS&At-hTd?AASG?dPc=Sc&&-TtdPc?k=Sk-APSGTcGAhTG<Tick-f&--?tGccyt=tGtAE?dTfAShPdGd&c&=&&tPhtkkf8-r?kcA=-cT&GThh=ddkTSf-&GkGtcP&lTAhkD&kSfTPl?hGGcdAATft&D-ftG?-.?=Gk=AAST=t?hhkdfkSc?fPt=-ch&Phk tdkkASS?fP?GhcGTft6hfzTk-Sd-PP^G=ck&fTStTC?kdfG-k?cGfckA-&ttPUkd=fkSA?S=G=?ch&GtkhcdSk&S-hdPP=Mc=&fTAhSxTk??h-GPdGcA-P=T-tt+Pktf=-k?A=?A?A?T{tGkddcffS&G-=k=PAd&=tfhAk?kT-GPSPG=SccT=T&h-2tkP-S-=PfGAcPATT?th;GkGfc-f?&G-=tA=T%t=d+dAfSST?PPh=cAdtcfkh&d?ktSP?9P&=kcAd=TTh=rhkGSd?kPfA&AcAtTchFkTkk-&-S=TG==hAATdLhqffdf-?M?cG_=TAkt-tShTd?Sh-h?dPt=fA!&-tGhPkkkTSk?UPScdc?AhTG.fdhkfSk--P-GPc:A=TkPAESkdf?--?GGf=c&fT-t-6ddPfAS=??PA&SAd&?tkhGd=kcS=-&P-=&cP&ST=hk*AkSfT??PeGGcSActAt&e=dt?P?T?=G-=AA=&ThPhhkcftSc?PP&c-ct&PtRd=ktkASG-TPcGh&S&dhcA?Y&k=ft-AP_cGck&ASPtT;=dhSd-d?tGf&&A?&ttc^(k&fk-G?SPTcdch&=tdhTdfktS-PtG&=qcA&kT&hSkSk?fhPdPdG&cfAtT-hXwPSQfh-k?tGS=hA?hdtGNdf?ff-d?-Pt=PAk&=dkdfdSfkS?PcPG=fcchfhSh-dfkPSh-=GhGAcSSTT?hk4Gk?fc--?&c--tAPTSt=Y-dAfGST??G-=GAP&ctfh&d?ktPP?AP==GcATpTTd=#hkGSP-cPPG&cAAtT=hok=khfA-=?TGc=hTdTdtcd-d&f&St?PGQ=AAkhAh?hTdTkh?f?d=G=fAk&=ThhhdMk=Sk-&PS= c?Ahtchd ckff&--?tGPcBt&TktA4Sdtf?Sh?GGdc&Af&&t-hhdPf8S=PkhA=SAS&?t>hGd=kcSfS?P-=fcP&PT=hf7AkSTp-??hGGckAcTft&J-dtfP-m?=Gk=AAS&ttGhhdGfdScTdP&=-ct&Pt/h=dkkATP-TP?Ghc=&dTchfASk-ft-PPk=kckAATStA-f=hAe&-tdhSdGfmT}hkrHd=fkS=AftcdkbPf&ScPAGOc?&p?/Gk=1c=&kT=StGc=&=c&-tAsGdSkPSkh2:&kvf=-k?=_f0?kPSAtc%cdcffS&?fTkiGdtf?-t?&G==cS=-hPc=Gcc&fT&hf?c=tch&Gt?hGc?&AT?thoGdh=k&3t?hf_AkkS&S-P=Gccf&dTfGdcPAd&ctfhc?ScAA1Tct-AchPf--GPkPG=tc&&PP-=kc-AtTPtt???tc&&=cPGGAPAGTdtcbdPSck&GT-tT*Skthfkh?TPhc-Af&tck&fTSf---?AP&-dPf-TPTGTc?AhT?f&Pf=PAeAhTPhkdfAAt?tAYSdTfScPT-hAmGkvfP?dS=GP==Ah&TtGthkdfPSA?-GAk&-S-&P-Gtc-(cSk??PhP=c?&-t-h-dTd?Sc-APS=kcS-kPfGk=AAS&AS-P?=kcS&-TAt-{RdA&=thh=dkkASkcGtTi-kSfA-d?P?P=kAGT-tdhS!hATT&tT*?dhf?c=Ttt&dTkkSG?k kkhfkSA?SPAttd&SkSh?PPtcG?T=Pch&GT?tc0Ad&PT=TAf&S==AAc-AhT-tt)Pdt=f=h?T===TA?&ht?Sc={=tA&T&hG>Sd&df?fPfPTcG&dAAth}zd=fPS=hPdckPS;-=PCtfdGk?-P-&Gk?cc?AhT=hdcN&dTVt=,kd=GM&P&htthfkTSA-P?=dPSkSP?BP==bhSfk-#dt?S=hcT&P=AA&&Tdf-G?GPk=&ctP&=tGGAfAGTdtcad?AchAAT1h&&dtAafd&kcft-hPxTdhd5PdGtTwhh=kdk=Sk-APkThkffS-2?&G?=1c-&==?T&0=kGSG-GG6dtf?Sh?GGd=cAftGk-;qdhfWS=?kP=ThkSf&--?-P&c?SSh?>tkPSO-=PkAASck?Sh-??hGG=hd=f&?6PG==chATT?tt&fhhfTShP-GP=t&S?SP&=-ct&Ptgf=cd?AS??TP?GhcGAhk&P8Gd=T=?&tthh?d&d?SG-tPkG&Ak-k?cGf=&A-&ttPdS-=fS-P?SPT=?cTdP-t?fGT=G?TcctSbSdkSfTTMGeTk?fh-?&AhP>Tff-k?SPf?=AS&TT&hhd=dkS?-PPaGtcvSt?TPt=PAN&Pf-?G=-=PAPT-tS=fch&fT&h-!&PTc=&tThGTcTATT?thv?P-cA&kT&NdrhkTfhtAuTdAfSST?StTdkkGfhfc?cGfc=AST&Pc=kcA&STTh?/hS&Gd-&G!G&c-AtT-S&GGGhcG&c&Ghfd=f?Sk--P dtftSt?PG<=PLcfSShPEPh=tA-T&P&=Tc&&-Tth-?c=cAd&Ah>TTxhf-SShfdSkff&--?&ThdSkk-f-GPt?&Af&%?=kfTh?=AhtkTk)P?hSc?kPA=ScT&?ThtG-;k&-=-&P-Gtc-(tSc?GPPPkctT}tc(St&kcSS?#PdP-c-=ATTtAd?kh&hhdhhdGfdSGAhh?htkSSk-dP-GfckAc-hGcGhcG&dTGSTP-=Acc&tt-AdhTkASA?=ktSh?y&TTfhA&St?TOhG!wd=fkS=AShcJAdGft-G?APhG?A&T-hftGdkf&-Ph?dck?fh-G?hT=dTk=ft?cSCP&AH&dTchGjcAGTTtGBddcfdc?T?tTMPk&dT-=PcGdcPGhT=tT=kcc&fT&h-QtkP?t==PS=?cSATT?tT?f=Tcf&TtGhkdGN?ST-c,SkBfSST??PTtAkPfA-hhtdAktSP?aPPt&d&ffSTPkddk&Sd-cPfGc%dkPSdhkdSkkfA-S?AT-a&fSk&-PPT=cc?A=TSGkc=Ak&AtShAPd=&&SG=T?)Skdfk/?-fGP-dGt&Sh-GhctAhTGhdgGPAc=&hT=hSd?f-TftAoSdTf?Sh?GGdTcA-TGt-htdPkt=-&hh?hhkPfP-PPSGkcdA=-tGdGtcP&wTPfAP?=tAt&ctOhftAkt-x??4PkPfP-r?=G,hPdTfPf-P=Ghct&k?-GG=-ct&PTtSfPA=hAGG-&AhGdPfPSP?hatk&ft-PPKGP!dk&Sc-=PT=tfc?d?cGf=&Afkv?SP-=dGc&ktftcd2IAfh-R?=GP==SP?APP=Yc=&yf-?-P&=?AAcftGXOdhf?S&?kF=kGf=-k?AGkhkdhSh-=P?=PcGSt?APt=PAJ&PffPyPT=&Af?dGA=dcc&fTcShPAc-cT&kt?t-ddkGST?=PSPTAd&kTAh=QAA=TGt=gkdAfkcGTftcdSkkSd-=htkPktSP?yPPt&dGf&-d?PPc=dAT&PThtPkdf--d-=PGGhfT?S?TG?=hA?dc?8PhGT=%&cTSt=,TNtSk-f?&Gc=&ScPGPc=fc&&fkc?GGA=kc&&htdh=Q-f2St-TGdckGP&&tSXfdcf;S???4?kAf?Sh?GPht?kSSP-TPkGUAd=t&hhPCSkSfktdh&ddkcSf-c&kT&2P&kt hkvAkSfAA6T&hcdGkAS=ttb&dtfP-M?PTTohk-f=-fP=dcf&Sc?fP&=fh=fP-d?TPtPSA_&=tfhAc=&dTchf,&k-ftAaAbGc?hGPcwA=TktA-S=d?AGf=&A-&ttP&E=APkSTP-PT=?ch&?ftP-Gec?=?TSth9Tk-dTSG?tGA=Pcc&-Pf=AcfA&T-t&-?=Tck&&TPTq(ckcfG?=-&GtcSAGTkhG==A-&=tkhAdk=&chTSt-=fA=&fT&h-y&PkAu&kt&hS6hf=Sf?=-dGTc?&(TGG?=tAPT}t=akdAPTGT?GG-=GAd&ctdPSPt=h&dTAPc=kcA&STTh?ihkGSd-&PAG&c-AtT-SjG-=tAfcfTcikcpAGTdtc#fd&f-PhcPGkc=Ak&AtShAP-=GA&TSh-IAd=fkSc-kGS=cct&GttGhchAhTGhd6GPfA=&cTPhTdPkcfttTbAdTf?Sh??TPddkhfT-fPhd=?SS=?kPA=kh?f&Sc?GGGcSA:&G=TTGkGfGSk?TG?S&?TPttthdd-kThA?AP-GhcAAT=dhT0?ktfc-fP-S_-hPkTAh=Wck?f-S=?&Ph?dPc=f=t&ycc&=Tchfp&kfGc&STthkdhkh-Wthd?dhfG-d?G&&d=fdS-f?PTGkc&AP&uhS}-dtf&SthTdSkt-?-tPP=,cPM&SS?GGdPAcG&PtPhPdhdPS=-hPfGTAf-SPxGS=TA?&TSfPk=&c{StPkPt=PA!&PfT?AGAc&cfTct-FAhAf=Sc?&dRf-SU-=PkG=htkcS&-AP-=A=-&hT=hTd?kSf&tAj&dAfSST?S&c#GdcSSS&?P=d=A&d?k===kcA&STAfhG-cSAkGk&t_GdkkPSAdGf=Scc&&ftfhTd=k-h=??PfG=-T&=TthT+hdthfd-hhkkkhSG?dPGtPkff*SP?A?G=TcAT&tdnPcGTdTGhd_ckd=P&ktcchh&kcSP-Gk&P=cTPPAthke=kfSGtPCAdPf9S=?/TchTdtSkkT?hGAP-Af&Tt=hcc=&TT=hkqAkk=GTkT&hdd-tkkf-TGdGGctTQ?AGP=AAS&TtSS&GtctAh?-P&=-ct&PtkzkdkkASS-ATdhhdhfG-??SGk=SSy?SP*G=ckA=fk-cG,=cc=&Gtm&-&ShdwSk?Dkk?fkSA?SPAtAdGfSStkkPTcT?T=?AP_ttS&StthS.Tk?fTcdtP#?dStSkT?-Gk=&?dG==fThxGf f&--PPd&SdS&?-Pt=-zcfc-d?A=qGcAtTPt-6AhffT-dhPdGkPSU-=PWTPddkASf?-PS=kAU&k?t=&=tAPTNtP-cGGctAATftcdST=d--f?-GA==ASGGc=AckPkT--dtS^kcSP-cPfG&cfd&S^?SG?GhfT-h?TG?=hA?k&-APk=d=tAFGhTXd?d&&Tt&hTd?khS?AhtAptdTkh-k?Sdkf?Sk-APSGADdfASd?AG??hA?&?TGhddSk?TShf8SdTf?STAThkdHkSSd?kPfd=ftS=?kPA=k0Pkh--?SGG=hP&AGt&hTd?fSS?hSd-kSfT-??TTcdtkhSASSP&=TcS&c?cTlhT&Sk-dhAfLcP8S&PkP&=-ct&-kt?cGG=P=k&thC5ckSm&Sc?SGH=dSU??PUG=ckA=kt-cP.=?A-&PT?cAt-fgS=-GPA=-fS-W?SPT=?cTkPSc?AGhkTS--tPP=*c=&ktffS%hfcfh-GPdGGhkf=ft?GPf?&cc&TtPtTdfkdf&SfP-GA=hA=ThGxckA0&=tkh=GGcSch&AhfRTkSfS-k?Sd%fYSp-=PkG=hhfcS^?AP==Tct&B?tG==tAPTrtPS&GSctSh?&Ph=GAd&GfkP=PtcGAf?kGd=kcA&STA-SP&=fATTdtT&PcPTfTPhX7=kb=-ATtfhkd?kTh=S-Pf=fAdP?=PcGB=k=fh-^k-SPfd-T?dPc=fccdTSAPdPt=?cTTPAhhTJhf-Sf-tSfPtAH&?TchSdcAAt=tAsSdTfSctTdh-gTktSS-k?AGfPAA=&AhdKfdcSDfA?hGW==AP&=PP=TcP&vT=h%?f=tcc&AtM>-d?tk-PdS?f-c?TGh?AGc=AAS&TtS-kG-Ak=-TctG<kAL&&tJh=dkk==G&ctS AccTSTchfI&kfGTTdTThkdttfrTk-ftS&?iGd=khh#-kTh?dG;kkhfkSA?SPAtGk&fT-=P-Gh==ctTk&&h=dGfGSGPi?G=cAD&STt/ScSth_Gkdfc-f?&k-ccG?chA?&htGhhP-chA=&thktPkdS-S&Pk=SGGAcTDtShtkS&-tPh-atkPftckthpPdAt-k-?&Pd=Ac?--PkG-=tAP&tS-Pf=PcGAc?GG==GAd&ctdScGTc=?hcchFz=k?SRThLB^hkGSd-GTkh-d=fd-k?GP?GhcP-?P=G?=hAG&hf=PTG==t&c&fhP*Gkdfh-dhhdTkhSG?dPGTTk=Sd-c?tG?kA-d-APSGTcS.GSt?TPAPAAfT>tctfdPkGSd-hPddhfhSh?GGd=GFtf=-hP&GG=AA?TTPT=ccT&?Thh??Acd&0Tktd=#AT&iT=hks=P?Ac&AtP fdTkPf&?u-cGPc?&?T?hthPkAf&--PfG-ff-G?fP&=-c&kdSTPPPh=SAGG-T+h&dffG-S-h{tfkft-PPJGPh&kSSc-=PT=S=S&GT=hkdMkkTwh=BBd=fkS=A?hcQAkPk}-GP=GYc??Tc=tPh=dhfdSG?tMhfAfh-GPdGGhAk=Sh-&PSGAA-PccSA&T-tfhPdGk==?=&&SGTch==A-&=tkhAdkGGAP&At-=fhS&fT&h-U&=PA&T-tc,?t?hS(T-tP==TccTYT?AAN=ktS-ki?&G&cfA&&ht=xhfk*Sd&f?S&GfA1&AtTjfd-hA-P?fGf=-ccT-twiPT&fkSe?&P?=TAPGAT=hTdtktS-?d?&GG?&&fTMtACTkff-dcP==?cAScPfPc=fc&&ff=PfPT=kA?cAt-6=d<f?-GSTGd=kcA&=TAG=cGA=TktArkPGAkA&tzh=VPdh&thShtdPfCSPActGotdAffScPSScG?Ac&AtSnkdS&kt&hk1AkSfActTG:SddkGSS?kPdGhcTAh&Sthd-fkft-d?&dcfGSc?fP&=f2&fG-AP?PA=hS??dP?GhcGAh-D?7GAkPSt-PP<G=cBdPSd?dPf=Pch&At?Tt3=khS&-G?AG?PhSA?SPT=cch&Gtdh&dAk&S--tP-tGdTkAS??d-t=kSd?SPdGccfAck=?-PkG=cTccThtTdtkfS=tcB?dcffS&?ftTe2k-f?tSaSdSkTS?-TTShtdtf -S?&GGcfS6-=PkGAcS&-T?th8GkdAh-f?&G-=tAPTgt=kkd&fSST??Ph=GA-&ch-dSd-fCSP?fP==kcAtStGh?ddkGSf-cPSG&c-TGTPhf}=kffA-S?Tc?cTAGTStcR?d&fPSt?PGG==Ak&AtPhTdPkhSGhSPc=fc&&?TthPd;kASk-APSGtc?AhTGhd.ckf?G=-PF=dcCA=Tkt=Sh=dcTAcTATTnAkGf=t-htdPf0S=?-PA=ScT&??AhGddkcSf-&P-GtTPTGT=hkUAk?fT-P?hGGfSAcTft&J?dtfP-+PkGk=AAS&htthhdGfdSGcht=dikcSd-PPcdSkhSS-TP?GTh=f&kfh-dSk-ft-P?tT?dGkSft?dPfGAfA-d?&=f=&A-&tt--GGkc&&PT-tGIcd&d--??AGhcGAkTGP==hc=&kTAhk-&=fAAcSTt_-3tk=SA-cPo=?A-&T?TGt=TA?&ht?GL=dcTAht%h?OCdAf?tSFddSkTS?-ThphcdAfT-PhPdSkPS<-=PatPdtk?SP?foGkdfc-f?&=T=tAPTRhA??dAfSST?tPh=GAdT&hdh&d?ktSt?3P==k&AT-TThP9hk=Sd?xPfG&c?AtTGhV AkkfA-S?T=&=hAGTdtc/fdtf--kGSG{==AktNtShtd?Sh=P?dPh=fA/&-tehPkkS-Sf?kPS=kc?AhTGhd=ckfSd--P-GPckA=TG-TlSkkf?-A?GGk=cAf&&t=GkdPfES=?tPA=-cT&c?fhGddkc---&P?Gt&PmhT=hPsAkGfT-G?h=cATAATct&XtdtfP-D?=dk=AA=&TtThhdcfd-H-AP&=cctT=tzhcdkk&SS?dhcGhcG&dt&hf<Tk-SkTAP(G=ckTwTSttz?Sh- -d?tGf=hA-TktPk5?Gfk-W?SGd=?Ag&GtdPPdffdS-?HPP=dc=&GkthSVTk?S--GPkGcc-A&T=Pk3PkHf=-G?AG-=TA??ktGKddcfSS&?-Pt=tAX&=tkhTkBkTS?-hP?TTdPftSP?hPh=hA&&ct=8dc?&PT?thHGdhG?&StPttpGkAfT--kcdTfcST??Ph=?XTfA-hP*GkfJSt?:P==kc=dc-SPkGz=?&k-&PTG&c-AtT-f=Ph=tc&P&&-hTdcfSTfhf)fd&f-S&ASh?2kd&fh-d?=ftfd-f?dPc=fcck{Sh??G-=kcSGf&S;cd5AhTGhdxckS----?tGPcuThTkt&0SdTf?Sh?Gcd=AAf&Tt-hhdPfSS=?k=d=SA &?ThhGdfkcPf?-P-=dcP&fT=h=BAkcST-??hGGcAAcTSt&J-dtfATS?=Gk=AAt&TtPhhkcSTSA?PP&=Act&PtmhhGSkASG-TGQGhc=&dTchfdsc=ft-PPM=fckA&TShdGcdhfG-dP-Gf=TA-tqlfyddTfkST?SPT=?&dtStkhhdffdS--tPP=N-c&kThhSddk?SS-GGdGtcfAhT-thyPkSf=-kG-GS=tA?TktGukdcff-k?-Pt=PAd&=tkhAdSSSS??CPG=kcc&fT&hAdkkPSd-=GGGAc-ATT?thy&c-fc-f?&=A=tAGTFt=GtdAf-ST?GPh=GAd&c&Sh&d?ktSG?XPc=kchSGTTh?/hSgSd-APfG&fdAtTGh_v&kkfA-S?T?P=hA=TdtA fdTf-SthcG!==Ak&&tShTd?khSG?dPc=fc&&-TthPd?k=Sk-APSd=c?AhTGhd+ckff&-At:GPcEA=TPtAz-dTf?Sh?&g-=cAf&&tchtdGf8S=ttPA=ScT&PThhGddkckS-&P-GtcG&7TchkvAAPfT-??hG=cdAcTfhS,-dtfP-kPkGk=AAS&AffP-Gd=AAtTvtGATAC&&t4h=dkk=&f&?tP<Acc&GTchf &kf=S&tt&hcduf&T?h=o?dhfGShA?h(dPk#SG-GPG=-cf&kTcPh=&ch&GtdhG?h=T&dTktS=kAf&kTAhS7APkAzTfTchSdPk=Sdd?X=k&f=-k?AGktPdhSf-&k=?h=&AATAtAdfAkTStkhAdSkAcdT#tP^?dfk-9SS-GA=dSe-=PkGAc-T?T?th_Gkd?p-f?TG-=tAPTat=kkfffSSt??Gj=GAS&ctfdkd-fdSP?3P==ScAhStdh?dkkGS?-cPAG&cA&ATPhYX=kAfA--?TG?=hA&--tc0fd&ftSt?GG.cA&t&&tGhTdPkhSG?dG(GAc&&=TtWdd;kcSk-&PS=dkcAhTGhddSkffT--G:cfcdATTkhdbSdTf??dGSGk=hAfTft-htdPf2At?kPh=SAd&?tShGkdccSf-hP-=kcP&ST=hkh-kSft-?PkGGckAcTf-ce-dtfP-d?=Gk=AAS-=t?_!dGfkSc?fP&=Ac?&Ptdh=k-kAS--TPPGhc&S-Tchf_&fGft-GPKGTk?AATStTdtdhf=-d?cHh=&A?&tt=lDd=fkSAS-PT=Pch&=tdhAdfft&d-tPG=mcA&kTAhSOTUPfh-=PdGAcfATT-hkGAk)f=-kPcGS=tA?&hPApddcffST?-Pt=PA=&=tkhAd?fkS?-hPGGhhTf=STPddXfdS6-=PkG=tT}Ak=SAPh=yc=&PT=GPcdAPTat=wRP-GdShPSPh=GAd&GfAP*PtchASTcTShhk-SkSt?dP&kcSc-cPfG&cfd=SS?cGP=fc?&dtGGGc-AGTdtc+d=SchAhTTh&=AAT&AtShTdSPTA=TAtPttd=fh-&?SGckA-?-APSGTcSddSh?kG6SAAdT?t?h#dck&hc?PPAS-Af&cT-cc=&A&&&t-htd-GGAk&TtthTd&ff-chGddkcSf-&G?GtcP&{T=kk1AkSfT-??hGGcdTcT=t&4-dtfP-;PkGkAA&k&Tt?hhdGfdSA?f=&Akct&Pteh=dkf+SSPTPTGhcG&dTchfdpk--t?fP_G=ckAATShU5?fh-k-d?cGf=&A-TetP(?GAfkSA?SGc=?Aw&GtdhcdPA<S--tPP=Tc=&fTAdS-&k?SK-GPdGcccA&T-h=HPkff=-f?AGS=TA?A=tGLkdcf?S&??Pt=AfS&=tkhAkSkTSP-hGcCTcc&ST&hA<tkPS^?AGtG&c?ATTtthLGkdfcTB?&G?=tA=TxtcxkdA&PST??Ph==Ad&ctfh&d-ktSP?_P==kcA&-Thh?,hkGSd&GPfG&c-AtTPhoC=kk&t-S?TG?c(AGTdtc>hd&f-St?=G?==Ak&AtkP-Phce&kT&P&=&c&&-Tth-?-=kAt&GtthtnhffTc^*,ckff&-fAThSd&O-fh???hGcc&AATdhPd?kt&tthhtdPfOSPtdhkjtkWSd-P?dP&=PS-?dP-GtcPAtk??GGG==fh-c?hGGcdAGkS?PStkCf&-l?=Gk==B&f??sPAdcfhSc?fP&=fe=f&-PPEGt=A=&TdThjckSfkS-h-d-k-ft-P?tTtNhf?SSS-?h==AS-fPkGf=&A-&&Sf?T==ct&GTttc=GA-&GtdhcddPGAk&=tj+ScA&cTAhSJTkSGA&-t&<?dTff-?ttyPk_f=-k=zGS=TA?tdS&addcffST?-Pt=P&kT=tkh&dSfdS?-hPGAdAA&fTTh-yhkPSf-=PkGtcSAtT?hdVGkdfc-fGSG-=tAPTNt=qSdAfGSh??Ph=GTf&ctSh&f-PTSP?-P==?cA&cTTuGkAk=SG-cPtG&c-AtTPGID=kPfA-A?TGG=hAtSftc2Gd&SdSt?GGH==Ak&h?GhTd?kh-S?dPA=fA>S=TthPd+fcSk-&PScTh-AhTThd4tkfSk--Gscfcd&:Tkh-1SdTf?ShhGGd=hAfTft-4pdPf?AA?kGy=S&d&?tlhGddkcSPtRP-GtcPTST=hf{ASSG&-?PSGGc-AcTht&z-=AfP--?=GS=AA-&TtcGfdGfdScG-P&=?cttPkhh=dPkASG-TP&GhAcTTTAhce&ktft-PP>G=fkAAT=tTLTdhfc-dPoPA=&Ac&t:-{udcfkS&?SGddcch&GtddGdfkTS-Pt&?= ct&kThhSdfk?-dPSPk=dcf&fT-tt;PkK&=-kPnGScSA?TdtGUPG&ff-d?-c^=PAd&=tkhAdGAdS?-hPGAfcc&ST&{PGckPS--=PPGAcSATh?Ak_Gk?fc-G?&GP=tTP=ft=qPdAf=ST?tPhcGfd&ctPh&dPktS&?uPht-cA&STTh&8hk=Sd-&Pf=Ck=AtTPhC!hkkf&-S?Td==hAGTdtAlfd&f--N?PGi==ASTftShTd?kT=fTGhva=d=f^-ch=dtk=Sk-APktPdff-SS-tGSPtAG&kt?hhITk-TftAVSdTf?Sh?GGd=cAf&&t-htdTf0S=?kPAkKcT&?ThhGddkcSf?ktPGtcP&}TthkE&kSfT-?Pf*&cdAcTfhdR-dhfP-%h-Gk=AAS&tt?hhdGfdkA?fP&=-ch&Ptdh=dkAtSS-TP?=HcG&dTchfd=k-ft-PP:d-ckAATStTK?dhfG-PT&Gf=&A-TktP^dd=fkSA?G(d=?ch&Gt-hcdSk&S=tkPP=Fc=&tTAh-.Tk?&A-GPdGccSA&T-ttkPtff=-k?AGS=TAG&hrG-CdcffS&?-Pt=GA)&ht?h&d?kTS?-hP==dc&&fT&yP9tkPSu-APkGAcSATtGth7GkdfT-f?&G-=tSPT;t=qkdTfSSh??Ph)?Ad&ctfh&d-ktSP?iD&=kcA&STth?>hkG-&-cPfG&cP&cTPhus=k{Gc&dt=TdXhk=S--?PTG=cA-9?tGN==Ak&=--P-Phcs&kT&P&=Gc&&-Tth-??=kAP&GP?=kc?AhTGth-SG&A:&=P0GAcOA=Tkt=--=GPh-d?TGd=cAf&cfAP-GT=TSA?PPA=ScT&Sk=?-Pc=hS-?dP-GtcPAtSG-AG2=dfh-c?hGGcdAGk#fc?-knSd-4?=Gk==hTS=?kShGhc-A?TKh?=PA-&Ptoh=dK=&AcTGtf>=kS&ft-hf_&k-f&c?TT8-hTkGSt?APPGcc--fPzGf=&A-&&?kP&Gkc&GS??Gh=?ch&GTh-SGUcSA=&htkh=k-khSPShG==TA=&dtJhPc-&AT-ttKPdtGP&ftdh8tAkPS=?fPT?-cfATT=tc=GAF&=tkhAdSkTS?-hPc=&cc&fT&hf??=tAd&httThd-k&S??AgckGfc-f?&GftPfkSA-?Pt=?f?-G??Ph=Gchdf-hPGPt==APT-t?LGkP&?tfh?1hkGfhT-tAh-kSfST=h-m=kkfA-ktGhTd=fSTfh3ufd&f-S&tft=ifk?fGt?Jkd?khSG-hh?h&kPfGtKlPd6k=Sk-=&&h?k.fAS=-&Pt=FG=&cTh8fd&k?S&tTdldTf?Sh??&&hP:tkGf&-fPtP=c?A&&S=?&r&?ThhG8hP-c%APTdt-h&kPfSS--&PccSc?&?T&tTgPkTtt!=dtfP-q?P&AdPfL&tt?hhdGfASc?fP&=PA=&Pt_h=dJPcAdT=Tdh&kkfhSA-tP=kPSf-PP<G=cnY-fT?dPckdfT-d?cGf=ckSfP-&?TdASdSA?SPT=ShTf=-P???d=TAhT=hfTAd=ffSh?LMhkAfh-GPdGGh=k-Sc-A!=kPf=-k?AGkgtktfG-=PA=-f--k?-Pt=PctdS-?PkGc=cSG?APG=dcc&dkA?kGcPkAU&ct?hPdtkcS&hddckdfc-f?cThOAkhSS-c?TGSAvAcTkTcdSkGSSS&?AGkf+St?.P==kc=JT-GPdP&cSA&-cPfG&c-AthGhR)=kkST&&?TG?=hAATdtcVff&S=St?PG_==Ak&&tSYhkTkhSc?dGf=fc&&-Ttj-dwk=Sk-TPSGhc?ThhShdXckff&--PkGPAkAtTktTjSkPf?Sh?GGdA-Af&&t-M*dPfkS=?GGd=ScT&?hbhGdkkcSf-&P=dkcP&gT=Wf/Ak-fT?GtAGGcdAcT?t&(-dt-Pf??=Gk=AAS&TtPhhkcf?Sc?-P&=tct&Pt{h=dfkASS-TPGGhcc&dhchAq&k-ft-PP0=fckTAtdtTg?dhfG-d?tGfct&?&tt=_9dAfkSA?SPT=tch&Gtdh&dfktS-?S?h=)c=&kthhS!tk?S1-GP-*tcfA&T-Ok%Pkdf=-khtGS=TA?TmtG5ddcS-&G?-Ph=PA?&=tkhAfSP&S??dPG=dcc&AT&h-fdkPSk-=P-GAcSATT?tc!Gkkfc-f?&GG=tAA-St=UkdA-kST?PPh=GfT&ct=h&d-ktSP?1==--cA&ATThAFhkTSdPc&kG&cTAtT&hXd:kkfAtG?TGt=hAcTdt&Xfd&AfSt?TG#cVAkTftSpf?=khS=?d=f=fcT&-tKhPdScTSk-APSc?c?&,TGhd=Tkff&--?hGPcDA=TkGNXSdTf?ShhcGd=cAf&&t-htdPfw-??kP&=ScT&?ThhGkdS-Sf-&P-=PcP&dT=bSdtkSfT-?PPGGcdAchflGI-dtfP-N?=Gt=A&?tdt?CddGfhSc?fP&=-A&&Ptih=dSkAS?-T=?TtcG&dTchf+&fSft?=G&GccSAAt?tTX?dhfGtd?cGf=&AP&tt=!zdhcSSA?SPTccch&=tdhcdff &=-tPP=.AT&kT&hSdhckfh-GPd=kcfA&T-(ttTkCf=-k?AGSc=A?tdh=^dd&ff-c?-Pt=PAv&ctkhAdSkhS??dPGAdAk&fT&h-ytkP-k-==k=dcSATT?thuGf:fc?-GdG-czAPTSt=xkdAfS?S??Ph=GAf&ct-h&dAk?SP?NP=c=cA&-TThP)hk&&--cPfG&A&AtTGh_w=A-fA-S?TGP=hAGTdh;YPdTf?St?PG^=cAk&&tShTkGkhSG?dPA=fc&&-h!?dd#kASkPkPSGTc?ThtchdU&kfft--GkGPc8&STktt6Sdtf?Sh?GGdcAAf&tt-}WdPfdS=PSG==Sch&?tdhGddkc?fP-P-=dcP&oT=hfpAkSSt-?PkGGc-AcTft&_-d=fP-k?=Gk=AAG&TtcGfdGfdSctSP&=?ct&PtAh=d=kASS-TP?Gh&GPGTchAm&kAft??PU=AA&AATttTdhdhfG-d?cGG=&AT&thd!bdAfk?AGdPT=hch&ttd{=dfft-?-tGk=l&f&kTAhS:TkTfh?dPd=-cfAtT-hSMtk5Sf-k&0GS=tA?TGtGU-=tffS&?-Tf=PAd&=ekScdSfPS??GPGc!ccT-hGh?dckP-c-=PkGAcSSTT?h=nGkTfc--?&GAd_APTct=-PdAf-ST??Ph=&f-&ctfh&?cktSG?j==--cA&tTThh/hSkSdPc&kG&chAttdhMdGkkSTPE?t=k=h&kTdtcBfd&&-StPdGOc-Ak&TtSBf!tkh-k?dAd=fcT&-ThhPdScTSk-APS&Sc?&1TGh-Gtkff&--&fGPcdA=hkct#SkPf?-G?G=A=cTfAGt-_GdPfcS=?&PAASAS&?t=hGdAkc-k-&GPcfcP&&T=*T}AkSfT-?P&GGcAAcTht&*PdtfT-T?=G&=Ahf&TtPhhdGfdSttPP&=-ct,?trhcdkkh&G-TP?GhhT&dTAhfk&tGft?dPU=kckT-TS8ThkdhSk-dPSGfc?A-ttR/EFkffk--?SG&=?&dTGtd;?dffhS--tPP=)A=&kt-hSd=k?Sd-GPPcOcf&?T-f-}Pkdf=-k?AGGkdA?&htGSGdcfSS&?=Ek=PA>&=fPhAd-kT??kkPG=Acc&&T&RhitSP&A-=P&GActATtKthkGfPfc-T?&Gh=t&?TqhAdTdAS7STP=Ph=GAd&ctAh&dhkt-f?bPA=kAd&GTT(4^hPPSd-APfGTc-&k-Ah%J=kkGc-S?tG?cff&TdtcrfPdf-Sh?Pc^-&AkT-tS+?d?S=SGGdff=fA?&-tGhPdck=?k?_PS=Pc?&=TGYS2cSffT--PGGPccA=tdtAd?fcf?-A?GGt=cAf&&t-Q-dPfcS=?tPA=?cT&&-dhGd=kc=A-&P?GtcP&6TTP?}AkSfTct?hG=cdAt-Pt&9-dt=--)?cGkcdk?&TthhhPffdSA?fP&=-AkSAt h=dkG?SS-tP?=fk&&dTchf?ck-fh-PP?Gdck&-TSSA3?kpfG-k?cGPkFA-&ttP-td=ffSA?Gpd=?ch&GSdhcdSk&S-?=PP=Pc=&fTAhSBTkc&f-GPdGcd&A&T?ttd==&f=-T?AG?=TA?&h)G-{dcfhS&?APt=GA<&=(-hAk5kT-f-hPG=dccAtT&+p%tkPSa??PkGhkGATT?thPhkdfA-fG&TS=t&PTNhG!kkRfS-hGkG2ccAdTdtfh&d-ktTP?{G==kAT&SThh?d-kQSd?cPf!dc-AhTPhdL=k?Ah-S?TG?dSAGTktckf?Af--t?PGh==AP&Ah?d=dPSdSGP=Pc=fc&&-?thPkjk=-S-AP?GTc&fdTG3dMc=ff&-??tGPc#AT-?tAYSdTc?Sh?=Gd=tfP&&t-htG&f/Sc?k=AtfcTT?Th7PddkhSf?t=dGhA=&%tchkHAkSfTt??h=Gcd&&Tftt+-kSc=-VP=GkdkAS&tt?hhdGf-&t?fP&=-k-&Ptdh=dkf?SS?SP?=ocG&dTchP=Ik-ft-Pt=G=cfAATcS#U?kcfGA??cGS=&AP&ttAGSd=fkSA&=PT=Pch&t-fhcdck&&?-tPG=9c=&kThPG8Tk?fhT=PdGAcf&t-dttdkkoSh-k?AGSATh?&hhf{dk-ff-P?-PtAkA}T-tkhAdSkTS?PhPt=dA?&ftGh-dPkP?+P?Pk=GcS&fT?hk8GkdS--fPPG-cAAPTdt=;G?tfSSh??cd=GAk&ct-h&d=AkSP?YP=AScA&-TT,GGAkGSf-cG=G&c-AthPTTw=kSfA-??T=A=hAGTctcz?d&f-St?PGNA=Ac&AtPhTd=kh-d?dPc=Ac&&PTth=dDkcSk-AGAGTcGAhTGhd)ckf-&?=?tG=cpAATkhSvSdTS-Sh?cGd=&Af&&t-kSdtfpSA?kU==Sct&?thhGd-ctSf-&P-d&cP&dT=h?GhkSfT-?;fGGckAct-?GL-kKfP???=Gk=ATS%?t?sddGffSc?tP&=-A&&Ptfh=dkkASS-T=?cfcG&STch?6&ktft?=P=G=c?AATctT(?dhfG?T?cG-=&A=&ttG2Rd=&-SA?SPT=Pch&Gtd cdfk&S-?FGO=)c=&kT=ftP?cdc&A/TciSdhAtTtttaPk<fPcctkhhDtfkSK-hPPd&fcS&?-Pt=-}-S/?w?GP4cSSG?APG=dcc&dkA?kGcPkAy&ct?hPdtkcS&hddkkdfc-f?c,Sd-fdSf?SPcGS=hAc?GGS=GAd&ctd-GG&c-AA?kGS=kcA&STASsPGcfAS&Pthh?QtfkSAhkmtkkfA-S?AT&wGkTftt&%cd&f-St?-TGUkk&fG-cP=dGfSSG?dPc=dkdkt-c?PdkktSk-APSGAd?f&SP-tl&khf&--?tG-hhkkS?-t?;=SGt&?T=hPd?A-T?t-htdPkt=t&Atc0cdtSk-&?SPtk&S=-&P-Gtc-fGSk?fG-=hft-??hGGcdAcTfdcS-k<fA-,?=Gk==J-SGkhhhdGfdSc?f&f=-ct&PtahAdfkASS-TP?GhcGtdhdhf.&k-ft-PP=G=ckTdTStt%?dhfG-d?c=-cGA-T3tP_td=fkSAGS=C=?Ak&GtdhcdPk&S-P-PP=fc=&?TAhS;Tk?SG-GPfGccfA&T=tt#AcSf=-k?A=P=TAP&hnG-zdcfcS&?APtcPALTAhth&dTkTS&-hPG=dcc-fT&h&WtflS>-APk=d=&ATTTthd?kdfA-f?TG-ckfATXt=(kk=fSSt??Gfd&Ad&ctfbhd-khSPG_f&=kAk&Stfh?dPkG?PfkPf=fc-TdTPhd(=k=fA-GhdG?=hAGtStcRSd&f--=?PGd==Af&AtShTdcAfSG?dPccGc&&?TthT?fk=SS-AP&GTcPAhTchdztcPf&--?tGhc_AcTkhdP?dTfPShG0Gd=AAf&&t-Ck=AfbS=?k=f=Sct&?ThGAddkcSf-TP-GtcP&{hGhkNTkSfh-??hGGAfddTfthY-kGfP-s?=ck=hASTLt?(kdGf&Sc?fPt=-Ak&Pt{h=dkkA?SPlP?=fcG&-Tch-+&fPSf-PP-G=AJAATStTdGkAfG-P?cGG=&A-&tNPd=d=fGSA?cPT=cch&G/Shcd=k&S&-tPP=)c=ATTAh=4Tk?fh-hPdGtkPA&T-ttfTkIfc-kGATf=T&5&hhdgdkcff-tGdPhcfAO&ctkhAdSkTT?-hGk=dA?&fTth-dSdhS;?fPkAScSAtT?h#:Gk-At-f?&G-&PAPTdt={?=hfSST??A-=GAk&c{fAhd-fGSP?=P==ccAtctdh?d=kG?t-cPSG&c&AtTAPS{=kkfAGd?TGP=hA&--tcEfd&?ASt?GGHA=P-&AtthTdhkhSc?dPc??c&&hTtjdd7kTSkPAfPGTAEAhtkhddPkf?kPu?h=dcUthTkt&<Sk&f?-ft&Gd=cAf8kt-hhdPf?P??kG-=Stf&?tVhGdSkcSPt*P-GtcPh?T=hf,AkS---PPdGGccAcTft&Y-f?fG-f?=G&=AAS&Tt&-kdGf?ScG?P&=?ct&=tKhT=?kASS-T==Ghc=&dt}tAL&kPft=kPBGcckA&TShdGcdhfG-dc-Gf=TA-Tk?AeUd=fk=d?SPt=?ch-StdhhdfkTS--tPPAs?&&kt,hSdkk?SA-G=dSTcf&kT-h1JPkkf=-GP?G-ckA?dCtGjkdcf=S&?=nk=PA2&=kfhAd-kTSctfPG=dccg=T&h?1tkP&&-=PPGAc-ATT?thkGP+fc-G?&Gc=tAcTm =&-dAfAST?GPh=cAd&c&Th&dcktSt?)Pc=kchSGTTh?Fh?tSd-APfG&fGAtTPh}:ckkfA-S?TG?=hAGTdtcUfd&f?-+?PG(==Akf=tShTd?khSG?dPc=ffh&-TthPddk=Sk-APAGTc?AhTch-Ockff&-ftShSdhAcfG-d?cGf=&A--?&5=AAf&&t-htdPf+f=cdP&=ScT&?ThhGddkcSf-tPTGtcP&VTP-wP&=hct&utfh-cfAhTft&K-d&=k&dtAth=TAc&Tt?hhd?Gt=?TShd&hct&PtHh=dkf=SS-TP?GhfS&dTchf!&k-ft-P=VS&ckAATStTQ?kSfG-PT&Gf=&A-TAtPydd=fkSA?G/d=?ch&GtthcdSk&S-tcPP=xc=&fTAhSLTfGAG-GPkGcccA&T-ttkPkff=-f?AG-=TAP&hhc<hdcf-S&?GPt=PAQTAt-hAdPkTSc-hPG=dA&TdT&h=1tk=SX-=Pk=TA-ATTAth(&kdfc-f?&=f=tAGT4ttekdTfS-Tt?Ph=GAdTrtfhTd-ktTc?>P==kc&&STTh?kdkGSd-cP-=?c-AtTPtt-S=hA?TztShAt&i?fdt&*=d&f-St?-TG8kk&SPd&hhdTkhSG?dPGTthcfhSP?&PTkA-d-APSGTcSdtS-?-P??tAf&At={fdckkSf?dGMdhS-Sh?GGd=G>dfT-A?c?-cd&fTThPThdTfP-f?SdfffSf-&P-G&h&kT-S?k?fGTAPTkPdGhcdAcTftcP?=?c2&dtfhT=TAG&Tt?hhd?Gk&-c&Ptcdct&Pt>hP?d=G&xcGt?:od&kT-S?rGkkPSf-PPxG=cnddfT?kPfkdft-d?cGf=cQTfP?dP&-kfS-k?SPT=?cTk!ScPSG(ck&d?gGS=Xc=&kT=ShPcckGGTStTJSdSk?-k?cPSkkS--k?AGS=AKdk&Sf-TPdGGAfctTAhdh=&AtGhAdSkTSScct&XGkXflTth=NtkPSm-PtGhGkfAhThth.GkdfG=TT-},^Axhf=?fPtdTfTST??Ph=?{kS*-tPGPtcSAk&TP==kcA&STh--ghkGSd?<?AG&c?AtTchxQckkf&-SPdMc=hAGTdtT2fdTf--ktAG+==AkTbtShtd?f-Sg?dPc=fAk&-ThhPddk=S?ThPSGTc?&-TGhkQckf&h--?tGPcdA=TktAkS?&f?-d?GGd=cAG&&hPdcdGfSS=PbPA=ScT&??hhGdfkcSP-&PPGtcTfkT=hSgAf!fT-P?hGGcdAt-Pt&5-dtSf-F?cGk=hfG&Tt?hhk-fdSA?fP&kGct&PtyhcdkkASS?hhkGhcA&dtdhf5&k--tc?PoGTckATTSh?{?dh-A-d?tGfcdA-&ttPKsdSfkSt?SPT=?AS&Gt-Ptdfk&S-AcPP=dc=tkkchSd-k?S?-GP=GcA-TGT?hG/Pfdf=-k?AGSkTA?TPtGFAdcf-S&?Ahy=PAG&=hchAd-kTS?-hP&d-cc&fT&*TrtkGSj-Th?GAcSAThfth:=kd-cck?&GT=tAtTehd,kkT-FStPFPh=tAd&ctfh&c-ktSh?xGf=kcT&Stf?Gahf3SdGTPfGTc-AtTPhSGTkkfA-ScYG?c4AGhdf=jfkSf-Sh?PG-==TkGttS7Pd?f?SG?APc=ff&&-t?hPdck=SS-APchhc?&PTGSTlckSf&--?tGAkSA=TktA?}dTfPShGGTr=cA&&&t&htk?fpS=-?PA=TcT&GThhcddfc---&PtGtAf&rtdhkkAk=fT?i?h=:cdATTfh&,=dtSz-a?&Gkc-ASThtGhhkkfd-&?fP&=-&tTTtV}fdkf-SS?TP?cdcA&dt-hfdYk-ft-PPRSGck&-TSthg?kdfG?dP=Gfc?A-TOtPIGd=Sk-c?SGP=?Ac&GtchckfS-S-?GPP=&c=&ATAdSk?k?Sc-GPcGcAsA&tPwAJPkTf=-f?AGS=TA?TStGUhdcfSS&?-Pt=PAc&=tThAkkkTSP-hP&d-cc&fT&-d!tkGS(?AttGAc&ATTTthuGkd-cck?&Gt=tAtTzhk)kdA-PST?hPhckAd&ctfh&d/ktSh?.P==kA-&StdPcnhkGSdASPfGTc-Ttk?h1d?kkSP-SP-G?AdTSTkh=8fkTf-St?PG9k=AkTGtS/&d?fdSG?Pt&=fA=&-d&hPddk=Sk-APGddc?AhTGkhqckSf&-=hkGPcFA=d?tAM-dT-?=t?GGt=cAh&&tThtk=S&ScPdPA=ccT&?ThhGcdkc-9-&GSGtc=&OThtcnAfdfT=c?hG=cdAATfh;G=dtfP-#cTGk=&ASTd?chhdGfdcS?fPT=-&td?to.?dkk&SS?kP?ch?A&dt=hfdfk-SG-PPXd=ck&GTSh&U?kdfG-P?kGfc=A-dGtP5dd=ffSA?G8d=?ch&GkAhcdSk&S=tkPP=8c=d&TAh-4TS?Gt-GPhGcchA&tStt/PdSf=?O?AG?=TAG&hhGd-dcSdS&PdPtcSAwt=hchAkfkT-f-hPA=dAc&&T&>fMtkcSF?GPk=TcPATt-thdckdfc-fG&GA=t&?TOhG4kkAfS-hPdPhcGAd&ttfh&d-kt:??>GG=kcT&SThh?dhf-Sd?=PfGtc-&ATPvWk-kkSc-SPGG?cTAGtdhS2fkAf--c?PGt==TkTttSOTd?fTSG?tPcc-&P&-hshPddk=Sk-APScPc?TkTGhkyckff&--PTGPAOA=t-tA5-dTf&ck?GG==ctA&&t?htd=fzSTt?PA=ScThtThh=ddf{=?-&PGGtA=&FTchkbTkSSdTc?hGGcd&&TftT;-dt&c->?=Gk=&AS&Tt?hhdGfdSc?fP&=-ct&PtPh=dkkASSt=P?GhcG&dTchfe&kAf?-PPNG=c?AAT-tTpPdhf&T-?cGf=&A=&ttG(wdTA?SA?SPT=&ch&=tdhc=hk&S--tPG=_c=&kTAT-pTk?fh-=PdGAcfA&?GttNPkVfc-k?AGSckA?&htG{fkdffS&?-P&ddd=fhStPkG=ktS?-hPG=dcc&f&&fSdFk&SR-=PkG=d=k?-k-h,=kdfc-f?&G-=tdud5tALcdAfSST?STT5=k&fASTPXGkktSP?eP==kAh&STTh?DhASSd-cPfG&c-AtTPd2&&kkfA-S?TG?cSAGTPtkOfd&f--f?PGd==Af&AtGGdd?khSG??Pc=Sc&&=?khPd*k=---AP-GTAGfATGhdMck?f&--?tcP-SA=TktADSdTfPShPcG==cAS&&tPhtdPfm-APSPA=?cT&cThhGddkcS--&P-Gtc=&;TAhk0Af&fT-P?hG=cdAcTfhk%AdtfP-oPPGk=&AS&tt?Wf=&fdSc?fGc=-ch&PtSPTdkkASS?tP?=ncG&d??hfKTk-Sp-PP!G=ck=&TStt1?kzfG-k?cGPk!A-&ttPdfd=ffSA?S#==?Ai&GtShcdfk&S-fhPP=dc=&fTAh-CTk?Tk-GPdGccSA&T-ttB&k%f=-k?TG&=TA?&ht?-&=?cq&STTtA.fAkTStkhAdSkAc_T&ttt&dPfT-c??P==SSk-tPkGAcSAAS--GPTGtf&-A?&G-=tA-dA?pPG=dcdAGtkGdcfAd&ctfhc?S=A&fAAt?g&k=f-SG?fddkGSd-cP=G&c-AtT=h-0=kkfA-kT&thdSk-Tfh-/fd&f-S&AfhddSdTSk-cPfGf=c&S?fGk=fc&&-T&ShGS=k&f&Gtt(GcG&cTGhd:ckdGA&ktctkuTff-x-&?hGcfG-A?GGd=cAdk{-&?=GCcScdT?tSd-dcS_tdLkddkcSf-c&ehtd^fcSk-TGP=dAP-??hGGcdAch-t&!-dtfPT&?=Gk=AAS&Tt?hhdtcfSc?fP&==ct&Gtoh=dkkh&G-TP?Ghc&&dTAhfd>c=ft-PPmcGckA&TStT=kdhfG-d?AGf=&A-TSThmyd=fk-f?SPt=?A<&Gt-Ptdfk&S-??PP=dc=&?-hhSNTk?Sc-GPkGccfSGT-ttYPkdf=-k?AcSt&A?&htG3ddcf-S&?-hA=PAy&=tShAd-kT-GTAPG=dcc&ST&h-ztSPS&-cPkGAcSATTcthdckkfc--?&GG=tAPT!t=dTdAfSST?GPh=cAdtct?h&d-ktSP?.Pt=k&ATTTTh?:hkGSd?zPf=kAfAtTPh^dTkkf&-S?tG?cff&TdtcMff%f-Sh?PGSdTAk&AtSdAd?f%SG?dq?=fc&&-tVhPd0k=-SPAPSGtc?&;TGhdWcSf-f--?hGPcdA=T?tAd?f-f?-k?GGS=cAf&&t-RcdPfdS=?-PA=?cTt?tPhGdkkcSS-&PcGt&P&PT=hfeAk-fT-&?hGGA?AcTft&rPdtfG-v?=GT=AAS&Tt?hhdGfdScTdP&=-ct&ct5h=dkkATP-TP?Ghc=&dTchfr&Adft-PP/GTckAATStTtPdhfG-d?AGf=TA-&tPcLqd=fkS&?SPT=?&k&Gtdhcd-fdS--tPPGtU-kh-APb+hf-fh-GPdGGhdkTSA-c--=dAf&TtP&hxTkPSf-S!fk-ffS&?-P&hkk&fk-&PPGdcP=-T&t==fA-&fT&h-_&Pdc=TSt-hGk<kPfh?fP&kfSG-f?&G-=&kTSP?-PfG=A-=cT&tGKkk-fPShhtdhktSP?)PPTTdAkT-P-hPccSctTSP-=dc-AtTPttPGGAA,&d?h=S=hAGTdtGtT&H&kP?&cTAd?dTf?-dPG=d=SSc?TPc=fc&&ffk?tPA=kA?AftGh?kPk&-khfdkkff&--?&tkWTf-dT?kPtGcfPSh?GGd=cAf&&tTftd=fcS=?kPA=kT-kh-PPiG-=AAj&G=t=bch&OT=hk>=P&AdAhh9h-dAf-T-h-+-dtfPStA-hhd-dTS=-PP?Gtff-A?fP&=-c&kkST?hPtGdAAT=tPhTd=k&Sf?hPT=&AS-=P?G=ckAATkSGP==nctP=?&GG=&A-&tt--?=HcGAG??Gf=?ch&GTh-?GScGA=&AP==Ac=&kTAhk-&=fAAAfTt5SkdkTSo-A.Pk:f=-k?A&T=TA?&hhcdtdcffS&?&Pt=PA,t=tthAdSkTS?-hGA=dA&&cT&hP2tfSS_-=PkGAA-ATT?thgckdf&-fG&=d=tAPTnt=}kkSfS?TPkPh=GAd&ctfnkd-fS-/?HP==kAS&STth?dQkGS-TtPfG&c-&PTPhdJ=k?Ah-S?TG?AkAGTktcJfcGf-Sh?PGv==Ak&Atc?hd?f:SGPSPc=Sc&&-TthA=Sk=Sk-AGPGTcPAhTGPT3ckSf&-??tGPc}AhSStAH-dTS=Sh?=Gd=cAfT*?=htdPf3-&?kP&=ScT-kThh=ddkASf-&P-AScA&vTchkdtkSft-?G GGc-ftTft&o-fdfP-d?=G?dhAS&Tt?dfdGfkSc?f{h=-ct&Ptdh=dkkA?Sc&P?=(cG&dTch-*&fP-c-GPfG=c?AATStTe?chfG-k?cG?=&AP&ttTPkd=ffSAckPT=Pch&Gtdht=Pk&S--tA-=3cc&kTAG19TkGfh-cPdGccf&k&TttL=kmPP-k?&GS=tA?Tf?&9ddcffGc?-Ph=PA_--tkhTdSfbS?-hPG=dP=&fThh-/tkPSN-=Pk=-cSAhT?hdrGkkfc-fGPG-coAPTSt=nkdAfSSt??Gk=GAk&ctfh&d-S5SP?kP==ScA&PTTh&kckGSf-c=GG&c?AtTGhrCTc?fA-S?TcA=hA=TdttGPd&f-StchGX=cAk&AP}hTd=khST?dPc=fc&t)TthAd:kASk-APSGTccAhTThdIckff&--?t=GcwA&Tkh_LSdtf?ShPhGd=TAf&Tt-htdPf0-u?kPt=Sch&?ThhGkfc?Sf-hP-=fcP&rT=hGPTkSSL-?APGGckAcTft&;=ckfP-N?=&c=AA-&ThGPAdGfSSc?cP&=-cttPtThcd-kASP-TG=GhAcT-TchGq&kGft-PP<G=ASAATPtTEAdhfc-dGc=P=&AG&ttci(kffk-T?hPT=AchTPtdhcdfk&-P-tPT=vc=&kTthSfTSVfh-tPd=&cf&ST-20dtkQS!-kPAGS=TA?&hh;edkkffST?-Pt=P&kTStkxSdSf=S?-hPG=ddh&ftfh-d-kPS=-=GkVAcS&fT?haWGkGfcGfGSG-cSAPTtt=:TdAfSfP??Gk=GAP&ctSh&d=AkSP?rP=TccA&-TTh&aPkGSk-cAAG&c?AtTGhF1Tc?fA-S?T&t=hA=TdtcGhd&fPSt?=G ==AkTd-?hTdGkh={?dPA=fc&&-tkPAdCk=SkcfPSGtc?Ah?Shd#&kffh--?tGPcgTdTfttHSdTf?Sh?GGddPAf&tt-LydPfdS=?kG?=Sch&?ThhGddkcSf&cP-=.cP&kT=hkjAkSTm-??hGGckAcTft&6-f=fP-L?=GG=hA-&tt?l/dGfkSc?=P&=-&w&Ptlh=dkkASS-TP?cdcG&dTchS)&k-ft-PGkG=ckAAT?tT ?dhfG?f?cGf=&AG&ttPH}d=SSSA?SPT=cch&Gtdhck-k&S--tP&=vc=&kTAGuOTkGfh-GPdGccf&kSPtt;=kx-f-k?&GS=TA?Tf?&{ddcff???-Ph=P&kS-tkhTdSfBS?-hPGAdA&&STth-d+kPS--=GS==cS&dT?hdiGkdfc-f?TG-czAPTSt=XSdA-S-d??Gd=GAf&ctSh&f-fASP?kP==ScA&GTTh&dfk=S--cPfG&c?AtT&h59=fSfA-S?TG?=hAGTdtcf?d&f-St?PG<==Ak&Ah?hTd?khSA?dPc=fc&TPTthPdHkASk-APSGTT=AhTGhdJAkff&--?tdPc<AATkth4Sdhf?ShG4Gk=cAf&tt-htdPfY?d?fPT=Sct&?ThhGdd/ASf-tP-GhcP&dT=hk=tkSfT-?PYGGcdAcTft&Q-dtfP-K?=Gk=&Ac&Tt?hhdGf=SA?fP&=-ct&Pt6h=khkAS--TPGGhcG&dTc(hb&kPft-PPLG=ckAAtTtTlPdhf=-d?&Gf=&&?&ttGNvdcfkSA?SPTcPch&GtdhAdfk&S-??PP=zc=&St-hS1Tk?fTcStkq-D&k?S=-APfSGfA-A?AGS=TASd&-t?cGScPA=Tdc?==A-&=tkhAdkc&chTChS=fAd&fT&h-8&PTAPT-tfh=k-AhT&th<GkdfGchTT,ddkkSTkhS_kdAfSSA&dh{QPk?ffS-kS?-cAAd?kG-=kcA&STASkP&cfc&TStSMSkdkhSt??.Af%fA-S?TGSh=k-Sh-P?&=0-TcGTStAdmk&fPtShTd?khS=PhPc=fc&&-xShPddk=Sk-APSGT&?&kTGhkrckSf&-=?tGPA&A=T-tAHSdTfGSh=G=&=cA?&&tchtdTfxShPSPA=ScT&hThh=ddkcSf?^h=GtcP&.tkhk7&kSShPkP5G&cdA&Tft&#-kSkh-%?TGkc-AS&tt?:{dGf-&t?fP&=-AG&Ptdh=kSSPS-?dP?=LcG&dTcY-kGk?Sf-PPGG=ckAATS?k9?kffG--?cGG=&&-SttPYfd=f=SA?GPT=?==&Gtkhcd?k&S?-tPPhtc=&kTAh-OTk?fh-GhTGccSA&T?tt;PkjfhSc?AG-=T&=&ht=4ddAff-;t=Pt=PAgT&tkh&dSfd&c-hPG=d&k&fTTh-.tAfSE-cPkGTcSATT?tht=kdfA-f?TG-=hAPtk?- kd&fS-8??Ph=GAdcAtfhTd-khSP?dP==?kh&STTh?dtkGSk-cPfdGc-AhTPhdz=kkfA-c?-G?cDAGtttczSd&f?St?A%S==Ak&AUdhTdPkhSGtTPc=Sc&&GTthPd/k=kf-AP-GTcPAhT=hd5cA?f&--?tGGcbA=Tkhc2SdTf?-z?GGd=cAf&&t-N?-Pfk-k?kPA=ScAddSG?t?ccPAaT?h?GhcP&DT=hknAkSSh=?Pd=&cdAcTftc-<Gtc5&&TktTdPkdSP_tP-GhcTPkTdhfdkkSfftk{GdkkASS-A&Sq2dtkTkG?SG?cnAccktihcd?kPT?h&!?dhfGSh&kt&d?fdh?-TPP=--cA=TAhc,&dA&ctchcdfk&Sfc=te:?R-f=-G-hPTkPfh-GPdGccfA&ATkT,=kSf=-k?AGkdfkfSttcQ?dcffS&?fT?3pkcS-t-h&d?fSS?-hPGGhhGfc-8?dPAcdSk-hPkGAcSAASt?=P==PA?--PdG-=tAP&tSSPf=TcdSh?tPh=GAd&GSd?=GxccAtTcAS=kcA&STTh?fdkGSd-cPfdGc-AtTPhXH=kkfA-c?-G?=hAGTPtcRSd&f?St?A_S==Ak&AtchTdPkh-cTTPc=fc&TkTthPd7fA-t-&P-GTccAhTGhdlccef&--?tG=c(AcTktA=qdTf?Sh?GGd=cAft&fShtdPfWS=?kG%=SAhtkt/hcddf?Sf-&P-GtfP&rT=hkzTkSfh-?P-hccdAcTf#Tq-dhfP->?=G?dhAS&Tt?kJdGfkSc?f4G=-ch&Ptsh=dkkA?StGP?=:cG&kTchhM&S----PPdG=cfAAT=tTdGkTfG-S?cGT=&A-&ttPd?d=ffSA?PPT=Gch&thThcdSk&-=-tPG=7cc&kThPG{Tk?fh?&PdGAcf&b-=ttFPkL-P-k?&GSchfk&htcgdk=ffS&?-=t?=A9&AtkhTdSf?S?PdPT=dcT&fTTh-:tkP-kP?PkGhcS&;T?th5GffS--fPdG-c?APTJt=;kfGfSSh??GS=GAf&chf Ad-khSP?tP==ScAhSh=h?d)kGSf-cPtG&T-TATPhdQ=k=fA-h?TGccAAGTdtckSd&f?StP=h&==AS&AhdhTd?kh-cPTPA=?c&&ATthPdzk=Ah-AP?GTcGAhT=hdDcA?f&--?tGGcHA=Tkh:uSdTf?-k?=GfcPAf&&t-h&PfccAkTGh?o&d?S%S&?tP&cASS&kTAhS:Tk?fhtqSck?Sk-??hGG=hd-SS?tPkk;SF-H?=Gk==(=f??dPcG&=t&-TtP&=-ct&PtORhdkkASS-TGkGhcG&dTchfy&k-?t?AP/G=ckATTShb<?dhSA-d?cGf=TA-&ttPfRfffkSA?SPh=?Ak&GtdHhdfk&S-?sPP=Uc=hkh-hS!Tk?Sd-GPSGccf&fT-tt{PkBf=-k?AGSk=A?TrtGRSdcffS&P-Nd=PAu&=t?hAd-kTS?P=PG=dcc&ST&h-utkPSP-=PfGAcPATT?thdGftfc-f?&G==tAGTzt=4SdAfSST?GPh=GAd&chch&d?ktSc?MP==kAA&tTTh?Lhk&Sd-APfG&fdAtTPh:E=kkfA-S=T=TcxAGTdth!fdTf-StGkGE==Ak&&tShTd?-h?a?dPc=fAd&-ThhPd<SfSk-APSGhc?AhTGkddTkff&--PfGPcdA=TkhPoSdTf?-D?GGd=cA-&&t-htdGf,S=?kPA=ScThPdhhcdAkcSf-&PftTdMfSS&STGf=dcc&k?hGGcdAcTfths-dtfP-mh-Gk=AAS&Tt?hhdG?d?k?fP&=-AU&Ptdh=dkAtSS-TP?={cG&dTchc%&k-ft-=P=G=ckAATkfcP&GGck&-TPth&SAPTStPJ5d=facPT-h=_cd&&ctThcdfk&SfcctS2AdSf&S&?&G==PA?&tPf=dcfA&T-t&-T=PA-&fT=7-=h&=&htG}ddGGk&?TktPdfTG5kdcffSd--P?GPhShckktALThPd=kPS3-=Pgt?d-k&SA-G?cS=GcTpT?GPcGAPT.t=^o?Pc-&G&ht=O&dtf?6Ah&d-ktSP?dGc=kcA&STTdPd k=Sd-cPfG&c-TthShI!ckkf&-SPdG?=h&GTdtTQfd&f--C?PAWckAk&ttShhd?f-SG?P=?=fc&&-t-hPddk=Sf-APGddc?AhTGhGqckSf&-=hkGPcBA=T&tA5-dTSG?A?=G-=cAS&&t-htdTkGS=??PA=hcT&PThh=ddkt&P-&P-GtAk&{TchkdTS/ft-c?hGhcdAcTfhtkddhf&-w?tGk=AAS&TAkhhd&fdSt?fGd=-At&Ttzh&dkktSS?dP?Ghch&dTAhf%hk-fh-PP:=TckAATStt)?dhfG-dPdGf=&A-&htPWCd=fhSA?SPT==Al&ct&hcdfk&SfcTtS_&{df?SSP-PccIAc-cG*GccfA&Tff&PG=?c-cFT&htdGfkdc-GPkGt=hSh?-Gl=tAr&=tkh=G-c-chTnhk2&c&&AT&h-Ctk-=t&ctTh&gtfdSfhddkkdfc-f?cT{NtkeSc-k?T=Pcd&P?G=i=GAd&ctdS&=kcfAQT?h qfdPdt-S?TGAGzccTSthGtc&AtTPh<DP?Ac?TrTtqS,&AcTStcifd&ff=GA?Gk=tAk&AtShA?Pc-A?TGP&ckc&&-Tth--A==cAT-TThGkkk&-kfcP?Ghc=&dP5G&c>A=Tkt=?fG?cP&A?GGd=cAf&&dkhtdPfr-A?fPA=ScT&AThhGddkcST-&P?GtcP&lT=hkkASafT-P?hG=cdA&Tft&WhdtfG-R?AGk=AAS&T6dhhdGfdSc?fPt=-Aktdt:h=dk--SS-tP?GhfS&dThhf(Tk-ft-PP?=ScfAhTShPy?kEfG-??cGPkVA-&ttP9cd=ffSA?Gqd=?ch&GEPhcdSk&?-kdPP=-c=&?TAhA3Tk&fP-GP?GcAfA&T?tt7Gk1fTT??AGS=T&?&ht=+dfch?S&?cPt=AA0T-tkdA?fkTSA-hPT=dAP&fT&G=6tk&S -APkGTcS&f&tth7TkdST-f?TG-=hAPTS?TakdAfS?;??GV=GA-Sttfh&d--GSP?dP=Akhc&Stfh?dSkGSS-cG-cGc?&?TPhG7=kkfA-ShTG?c-AGT=tc_-d&fAS??PG?==&A&At-hTdPkhS&t-Pc=fc&TtTthGdCkT&?-APSGTTOAhT=hdkcPkf&-&?tGTc_A&TkhTkKdtfhShPfGd=cAf&&P-htdtfD-k?kPT=SAffGThhhdd-SSf-TP-GtcP&S-ThkIAkS?P-?PxGG&d =TfhS8-k-fP-f?==SAPA-TPt?N=dGfdSc?fy&=-A?&Ptch=dSkASc&hP?=PcGtATchS)&k-ft-AhSG=ckAAhttT%Pdh?G?=?cGA=&At&ttG_vS=ScSA?&PT=&ch&&tdht=Pk&S--tcd=1cc&kTAG:sTkAfh-=PdGccf&khdtt1Akr?f-k?&GSckA?Tf?&EddcffP??-Ph=PASSTtkhAdS-PS??JPG=PhT&fT&h-dSkPSd-=PSGAcGSdT?th5GkPfc-S?&G-fdAPT8t=efdAfSSTGAPh=GAd&&tch&d-ktS-AGtku&dGfc-=hGdSkGSd-cPd A<tkh-fhkdSkkfA-S?ATcd?khSSSGP6GPAd&-tdGkc-Ak&AtShA?-=&&Sc&tc,Skzfd-G?SG?kAS&-APSGTcS%cSG-cGSG&cPTdTAvdckAhTktAvSdAAkAGTkh-gPAS&&t-htdPfpS=SkAc=?AS&?ThhGYhP-AcT=th>ckk&ktkhk3AkSfAcFTG%fEtdkf&??Gdk<Sd-m?=Gk==)=f?--P-G=cT&P&ht==PAf&Pt.h=di=A&d&&tf=dch&dTchfxc=?ASTkTTFfdtATThtT6?dhf?=&Tfh=tPk&Sk-APdG-=hS&htd?khSG?dPcAf-kktSc-tPP=xcPdGSS?=PckGS=-GPdGccdfAS&?GPc=AAdAAT?hd=hAc&htGVddGGTATTcGC=AA>&=tkh=?pcS&k?dGd=dcc&fTc-fPA=AAP&Stf5Pk-AhtPthWGkdfGcft=hcHPkTSP-c?tP-cA&StkTPvdkAS?t-bdd-ktSP-ttGhAkOfdThhAWhkGSd-GT>ekd?fcT=hSa=kkfA-kAtmdtGAcT?tcWfd&ff=TTnh-m?AST7tShTd?kTAT&ch?Ofct&&TthPd4kPGTc=tth?dAk&Tchclckff&-f&?htdAkcSt-&PA=ffG-P?GGd=cAdkS-=?P=G=T&fTTPT=&cT&?Thh??==tc&&PtkThdf&kTthknAkSfAAkT&hdd?AATft&=TfcGSThPf&S=TAh&Tt?hhd?PhAATTt=hndASd-t??G&ktSS-hPTGhcG&dTGSGGfcfcAAftPGAcGAATStT0S=Pcd&ktSht=t&S&ttPCVdPGgA&Tct=tSkoSk-&P?-t=&A?Tktf=kA-&kTAhS;APcA?&fTchthAfDft?hPS=cfc-k?AGScfA?&htGgdd&fPS&?-Pt=-0dSSkAhTdTkTS?-hP?TAdfftS=STPPcdA&-APGGAcSATTS?PPd=kAS&t?t=J=tAPTNtPSTGScc=GTThf9&kkf?-EhtkdktSP?7PPtddGSikG??G)=&cTTSt#Ikc-AtTPhC4AfffA-S?T=GGdAGTftcaPd&f-StGPGf==A-&AtShTd&khSG?tPc=?c&&=TthPdLk=SP-AP?GTc?AhT&hd!tf-f&--?t=-c5AcTknA-fdTfTSh?tGd=&AfTtYdhhk_f,S&?kPA=ScT-?ThhhddffSf-tP-=Sd=&UtLhkd=kSft-??hGGc-ftTft&j-k&fP-d?=ck-tASTSt?b-dGf?ScG=Gi=-A-&Ptth=dfkAS--TPcdfcG&dTcUdp&k?ft?PhmG=cGAAT=tT%PdhftcS?cG-=&Ac&ttGj9dAfkShtGPT=?ch&TtdhAdfk&TG-tPP=mcc&kTAhS<TTSfh-GPd=&dhA&T-ttd&k9f=-kGASP=TA?&htG>df?ff?&kGPt=PAF&=tkkCdSkh?j?;P==dcc&fT&h-jtd?Sr-APkGAcSATT?th=SkdfT-f?&G-=tAPT?tdlkdtfS-???GX=GAk&ctPGLd-ktSP?=P==fcA&G?dh?DhkGtt-cPSG&c-ScTPhfz=kffA-S?TG?-SAGTStc5Sd&fPSt?TPG==A-&AhkhTdPkhS=?dPtdPc&&-TtW-d>kcSk-hhGGTc?AhPHhd#Akf-&dG?tGAc^A&TkhqBSkfktSh?&Gdc&Af&Tt-hhdPfS&T?kPA=SAh&?t(hGd-ctSf-&P-k?cP&dT=dk&tkSSd-?PkGGc?AchffAW-kkfP-S?=c?=A&?t=tPl-dGS-Sc?fP&=-ft&PtSh=dGkAS?-TP&GPcG&-Tcg&#&k?ft-GP:GTk?AATStTdhdhf=-d?t*P=&A-&tPh(2dcfk?AkPPT=cch&AtdhhdfS&?G-hPA=FcT&kthhSvTf-fh-TPdGccfA&T-iqdAkyfh-kGtGS=TA?tdh&Cdkdff-&?-Pt=PT9ThtkmkdSfSS?PPPGAdA?&ftfh-d-kPSG-==k=hcS&ST?h?8Gk-fc-f?hG-c-APTGt=UkdAfS?G??G-=GAd&ctAh&d=fdSP?LP=AhcA&-TTd?TkkGS&-cPTG&ASAthThS+=kTfAP&?TGP=h&=TdttGPd&f-StGhGu=cAk&h?GhTd?khP-?dPA=fAtSdTt<kd^khSk-APScT?=Ahtfhdd-kfSG--?t=hcd&-Tkh+#SdTf?ShGQGkcPAfT?t-htdPf(ff?kG?=SAc&?tUhGdPPTSf?kP-AkcP&dT=hSrAkG&d-??hGG&-AcTSt&b-fTfP-??=GG=AAS&ThGPAdGfGScP&P&=-cttPcfh=d=kASA-TGdGhAcfTTchAv&SGft-PPpG=AcA&TTtTiAdhfG-d?chS=&AT&tt=sEkffkShPdPT=?chsPtdhAdfS&aG-tGS=bA-&kh?hSkTt=fh??PdGtcfTPT-ttTck0S?-kPGGScAA?thcAQdkPff-=?-GG=PA?TGtkbGdS?cS??iPG=Gcc&P?1h-etkPPT-=PfGAcGSdT?thbG?yfc-S?&G-A?AGTPt=}hdAfSST??=P==AP&cthh&d-ktSTAfP==ccAhcTThP/hkcSd-thPG&c-At%Thw%ckk-AdP?TGt=hA&TdhTifd&-SStPFG<ckAk&AtSdTT=kh-k?dGk=fA?&-t&-&dHfPSkcfPSGtc?&=TGh-Gtkff&--A?GPcdA=hkctISk?f?-P?G=P=cAP-Ot-htdPPcS=?fPAASPL&?t=hGd-kc-T-&=--dcP&=T=h&0AkPfT-?GtGGcAAcTTt&O-dtfT&k?=GG=Add&TtPhhdGfdSttPP&=-ctkSt2hcdkSAjP-TGdGhct&dh-hfk&k-fh?fP*GTckT?TStTkddhSf-dP-GfcGA-tthPu kSfk-??S=f=?&hTTtd:?dff-S-P>PP={cA&kt=hSdGk?fh-GPd==cf&GT-h&rPkkf=?)?hGScSA?k?tG6kdcfhS&?=_k=PAU&=f=hAd-kTS?htPG=Tcc&fT&h-7tkPSA-=PtGAc-ATT?thkGPhfc?x?&G==tTkT;t=dkdASkST?GPh=GAd&chGh&kfkt->?JGP=kcATkTTxBKhf-Sd?GPf=0AhAtTPh!?ckkf&-SGTS==h&fTdtt2ffPf-SthfGFc-Ak&TtShTd?kh-G?dG?=fA-&-tchPd9--Sk?-PS=Gc?&ATGVfG?kfSP--GfGPcsA=hkct!SkGf?-c?G=t=cT=cSt-,=dPc?S=?fPAAfcT&c?fhGddkcA=-&P?Gt&PGfT=hT%AkPfTPS?hcG?SAcTht&/-dt---b?hGT=&Ah&T-Rhhd=fd-??fGbd=ct&Pt6?fdkk&SS?dhcGhcG&d-AhfbTk--(TfPe=SckATTStTQ?dhAt-dP?Gf=hA-&ttPj k&fk-??SPh=?AF&Gtd,hdffPS-?kPP=5c=tktdhSdGk?Sc-G=fGccf&cT-hA4Pkcf=-k?AGScPA?TctG!tdcfSS&?-Gd=PAA&=tPhAdSkT??ctPG=&cc&tT&d-YtkPSA-=PhGAc-ATT?thLGFAfc-t?&=k=tAGTDtTG?dAfSSTtPPh==AdT&-hh&k:ktS=?eP==kcAScTTsk;hkASd-cPfG&A=Attkh2LAkkf&-S?T=S=h&fTdtt)fd&f-?t?cGFcSAkT?tSdhd?kh-k?dGP=fA?&-TthPd*fSSk??PS=cc?&jTGhdHhkfSP--PfGPc9A=hkfcoSkGf?-c?Gcd=cAfTPt-2AdPfdS=?kPA=S=P&?tchGdtkcSS-&=--dcP&AT=h-jAk=fT-&?PGGc&Ac-Gt&s?dtfG-2?TM?=AAS&T?Ahhd=fdSttPP&=-ctPdtlhcdkkAff-TGkGhcG&dTchfH&=hft-=P6=-ckAATShhd=dhSS-dGTGf=&A-tthSb.k?fk-??SGd=?chTvtdKPdffcS--tPP=nAh&ktPhS%Tk?ST-GP-c-cfA&T-Gf,Pkdf=PkAcGSctA?ThtGdGdcS-?G??=d=PA=&=tkhAdSATS?PLPGcScc&-T&hAn?kP-d-=eSGAc-ATTPth+&c-fc-f?&dP=tAGT9tTG?dAfSSThAPh==Adtcc?h&k?kt-P?sG?=kcASkTThG)hfGSd?APfA&ATAttPhFd?kk-&-SPfT==h&STdP?4fdTf--Y?PGSdTAk&AtSG=d?fxSG?-ht=fc&&-GGhPddk=-STPPS=dc?tkTGhdLckf-S-?PfGPckA=TktAJSGtf?-f?GGf=cA=&&t=yddPfsS=qSPA=-cT&&-dhGdGkct--&P?GtcP&MTTP?*AkSfThG?hG=cdTc=?t&xtdtft-<?cGkcdk?&TthhhAcfdSA?fP&=-AkSAt%h=dk&TSS-tP?=hkG&dtdhfd=k-S?-PP?T&ckAhTSG=!?kMfG-f?cGPk%A-&ttP=&d=ffSA?S?&=?Af&Gtdhcdfk&S-AAPP=kc=&?TAhSlTk?-f-GP-GccGA&T-ttkPfkf=-??AGG=TT?&htG1Sdcf=S&?-Pt=PAI&=h?hAdGkTS&-hP==dA&fhT&h=Ktk=So-=PkGAG-ATTcth.=kdfA-fPnD==tAPT+tt}kd&fSSTh=Ph=GAd&Atfh&d-fSSP?3P==fcA&STTh?WhkGSd-cPSG&c-AtTPh7_=dkPc-?PkG?=hAG&hS-PS=tck-0?TG<==Ak&=SdS=GPcSGk?fPt=fc&&-T&?TPTcGSS?fPSGTc?ATf??kG-=Sc?&=TAGPcyA=TktAdfdTf?Sh?GNT=cAf&&t-htdPfp?=k-PA=ScT&?ThhtddfOfA-&P-Gtc&&zTchk_&kSSdTc?hGGcdAhTftT0-kkAA-#?=Gkc=AS&tt?hhcSfdSc?fPT=-ct&PhkPkdkk&SS?dP?GhcGtdt4hf/Tk-fh-PP-G=AST-TSthB?kdfG-d?c=-cfA-TdtP_dd=fkSAP?Gd=?Af&Gtfhcdfk&-P?fPP=-c=&fTAhS2Tk?Sk-GPkGccGA&TPttdPc}f=-k?AGP=TAP&htG=SdcffS&??Pt=PAe&=tkhAdSkTS?-hPG=kc&&fT&h-(t=-SN-=PkGAcSATT?th=Akdfc-f?TG-=tAPTGt=bkdAf?-k??Ph=GchS=S&?T=dfRSt?7P==kc=dc-SPkG(=?&k-&PhG&c-AtT-f&P?=Tc?&tTthtdAk=SG?ox-kkf-St?PPth-kfSP-G?cdGf=SG?dPc=dhGf?-=?8Pc=Tch&P=&GhchAhTGhd6GP!AkAtTGhA%Tk-hctTdfdTf?Sh??TAMPdTSf?kPSGf-G=kTTh?q-kGSktd{fddkcSf-cT2hhd?f-Sk-SffPSAc&{?hGGcdAcTS*-W-dtfP-MGhGk=&AS&Tt?hhdG-d?-?fPT=-ch&Ptkh=dkSPSS?6P?GhcG&fTckfRTk-Sd-PPSG=ccAATcheQ?dhfG-A?cGS=&A-&ttAGSd=fkSA?tPT=PchTchThAdPk&SA-tPP=LchfSTAhG0TfXfh-=PdGccf&Y-=ttEPkpSf-k?&GScdfc&htGNdk-ffST?-=HAfAd&Ttk>NdSkTS?Pd=S=kch&ftfh-itkPS+&tPkGhcS&dT?hS_GfdAc-f?hG-cdAPTSt=zk>-fSSt??Gk=GAk&ctf?cd-ktSP?dP==kcA&S?=h?d8kGSk-cPfG&cAf,TPhds=fcfA--?TG?=hA&--tc9fd&STSt?GGW==ft&At-hTdGkhSG?dPcPSc&&?TthGdFkcSk?Th.GTcPAhT=hdgckff&f??tGGc!AcTkt&rSkdAcSh?GGdccAf&Tt-htccf+S=?kP&=ScT&?tPhGddkcS-?PP-GtcPAtfS?fPc==c?AG=PTGdtkST-h?(-dtfPStA-hfd?dTfP-c?&GS-=S&?=P&=-ct&-f&?cGt=hAd-hPhGhcG&dTGS{GkGtcG&ATTh-&cATTAtTH?dhf?cPtdhhqTkfSht=5-d=fkSA?kh&hhkaSStfI?dfk&S--&&fhTkSkT--?-G-ckA:&htPG&AGA&T-tt.-Pcck&GTPhAdkTtkc-GPG=?-AP&GTtt6tkSf-wck&dSkTS?-hP=c=cc&fT&h-fSkPSd-=PkGAcSATh?+G#Gkkfc-S?&Gc=tAPTSt=}-dAfSST?GPh&G&G&ct?h&dGktSG?bPhcScA&STThhqhk=Sd-cPf={k=AtTPh1dkkkf&-SPhckc>A&Tdtt7fd&f--S-hGs=TAkT-tShtd?fISG?-ht=fc&&-tGhPddk=-SPPP-=dc?&dTGhd,cf--G-?PfGPcGA=TktAaS=kf?-f?GG-=cAG&&h-PtdPffS=?=PA=GcT&?&=hGdkkcS?-&P?GtcPktT=hk+Ak-fT-??hGGkTAcTSt&+?dtfP-a?hhS=AA-&ThThhd=fdSc?fG_d=ct&Pt_dFdkk&SS-TMkGhc=&dT&hf>&k-ftfGPjGcckA&TSttM?fdAS-d?AGfckA-&ttPE)hcfkS&?SPt=?A0&Gt-Ptdfk&S-?TPP=dc=&k?thS^Tk?SF-GPdGcctA&T-tt>=k-f=-k?AGkhGkP-d--ofdhffS&?-P&tTd=ftShhTdTkTS?-hP?TAdfftS=STPPcdA&-APTGAcSATTSf=Pd=&cT&^tGthnPkASStA(&dAfSST?Sht,hkAfT-tPSPt==AS?kPT=kcA&STA?&P&cPSf-hPfG&c-A&-?-=Pc=tfT-&?TG?=hA?kh-P?t=Gc&&GckGk=TAk&AtShA?Pcc=d?fGr=fc&&-T&?hP==cA&T?P?==c?AhTGth-==QAGclTthGdSk-S&-GPcdTf?Sh?GGdAGAf&&t-d3AdfWS=?kGf=ScT&?hh4GddkcSf-&P-=ScP&jtchk)&kSfT-??hGGcd&=Tftt6-dtfP-Q?=GkAdASTlt?hhdGfdSc?fG&=-ct&Ptfh=dSkA-?&dP?=<cG&ATchfo&fPSb-PPkG=cPAATStTk?kPfG-f?cG-=&&s&ttP Sd=fSSA?PPT=?ch&GtthcdSk&S--tPc=/cT&ATAhS9Tfhfh-=PdcchkA&TAtts&kbSk-kPTcp=tAt&htAEddcffS&h-Pt=TArTdtkhTdSffAG-hPt=d&f&fTTh-ntkPSSTTPkGAcST?T?hJqGSdhT-fPkG-cfAPTkt=kGhffS-f??=G=GAk&ctPh&d=AkSP?8P=cAcA&-TTd?TkkGSP-cPGG&c?AtTThAmckGfA?&?TGP=hAGTdttGPd&f-StPhG0=cAk&h?GhTd?kh?d?dPA=fA&S-Tth&d}kcSk-APS=fh=AhT=hdd?kffT--PKGPcSfTTktA8Sk=f?-q?G=fd?Af&Tt-v-dPfKS=?k-&=Sct&?tahGdkkcSfthP-GtcP&dT=hk4AkSfT-??hGGcdAcTftTVPdtfP-v?=hL=AAS&Tt?hhdGfdSch?P&=-ct&Gtmh=dkfkSS-TP?=dAS&dTchf5cPdcATkTAyfdfff-p-tPT=-fc-P?cGf=&Afkc-GP&GT=hST?APT=?ch&?fPPdGh=TAfThP==Ac=&kTAhk?G=Pct&TTct&&Ae&-k-G#=k=f=-k?AGktck&fG-kP-GP=hPS?PGG=PA^&=txSPG-cGch&=t&htd?tATtlP>tkPSW-PTdhSdGfD-d?PP-Gtc?PAAPh-6PkTfh-?P&dAfSST??GnAkAd&ctfh&f?khSG?NP==kcA&ShT!Tihk=Sd-APfGhc-Atthh{R&kkfA-S?hG?&h&=TdtTgfdtf--k?PG?c&Ak&AtS,Sd?f{SG?kPc=Pf)&-TthPdPk=Sf-APGddc?AhTGhAuckSf&?PGcGGcSA=TPtA{SdTf&SP?GG-=cAt&&t?htdGfwSTt?PA=ScTTdThh=ddf&-h-TP=GtcT&%T=hkdTS{ft-A?hGhcdAcTft&StdtfA-_?TGkc;ASTT.khhdAfdSA?fG8=-ctT+t%hcdkktSS-tP?GhAh&dTchf;Tk-ft-PPe=AckA&TStto?dhfG-PPSGf=TA-tktP.dd=ffSA?Gud=?ch&Gh-hcdSk&S=tkPP=Bc=T=TAh-nTk?&A-GPkGcc-A&T-tt+P9df=-f?AG-=TAP&ht&G-dcffS&PtPt=GA6&=?thAd-kTS=-hPG=dcccST&h?ntkGS,-cPkGAfPATT?th1=kdfc-fPcG-=tAPTkh!BkdAfSSAASh?_&dTfP-Thtd=ktSP?7PPrGdGSfThhArhkGSd-G&thTkPkAT=hG4=kkfA-k&AhfFcfSSG?SftdtSLSt?PGo=PhTfS-cSGGTcfA&Tkt?;vch&-t17}dOk=Sk-=Ahh?d&dG---tGScSft?S?tGPcgAPkc-SPt==-t&-ThhT&kkdSf?kPSGffdS=?kPA=ScT&?ThhGdfffSf-&P-G&hkk=ShStGkcdcG&?Pd=PcdAcTftc-fGhcTA&APhfd-khS=fd?hG=c-A??-Gd=-ct&PTt-dPAc-&;-hP&GhcG&dTG?AG?=?ASTfPk=TckAATStA-dGhcd&TTfttdGkkSGahP?=}ctPfTkhSdfk-fStdhcdfk&S-GfPP=gc=&k?PhSmTk?fh-GPdGcc=ktT-ttUPkSf=-f?AGS=TAc-ftGRddcfPS&??Pt=AfS&=tkhAdAkTSP-hGcgTcc&fT&Ck/tkPS>?AGtG&c-ATtStheGkdfcT!?&G-=tA=T_tc(kdA&.ST??Ph=GAd&ctfd&?SktSP?9P==kA?&Sthdkd3kcSd-APfG&c-At?Phr =kkfT-S?hG?c-A{Tdtc!fkcf-Sh?PGd==A?ShtShTd?fTSG?kPc=Pf.&-TthPfSk=Sf-APSd=c?&NTGhdeckff&P-h=GPcdA=TftAQ-dT-??G?GGk=cAS&&h<htk=STS=?-PAclcT&?ThhGdTkcSS-&PGGtc=&LThhcyAk-fT?&?hG=cdAATfhJG=dtfP-OPhGk=&ASTd?chhdGfd?A?fPT=-&uSft_hAdkkhSS-TP?chS?&dT&hf8tk-S5-PGk=?ckAtTSh?5?dhfG?fGSGfcMA-TPtPgwd=SS-f?SGk=?AG&GtdhcdffhS-?xPP=-c=&STA/SkGk?SL-GPSGcc-A&b-hAwPkdf=-P?AGc=Tt?TmtG(kdcfcS&?APt&P&f&=tfhAdtkTS&-hP&=Tcc&fT&d=OtkGSe?AttGAc?ATtfthWGkdS&?h?TGG=tAhT{t=4kdAAdST?GPh=cAd&Atfh&cGktSP?VPc=kcA&STTh?OhkGSd-cPfG&c?&mTPhib=kkc=-S?TG?=hAGTdtcwfchf-St?PGd==Ak&AtShTd?khSG?dPc=fc&&GTthPd9k=&t-APSGTc?AhTGhd cHSf&--?tGGcyAcTktA=PdTf?Sh?=Gd=cAf&&t-htdPf^S=?kPA=SAW&?ThhGddA?Sf-&P-GtcP&uT=hkt&kSfT-?PvGGckAcTfPh:-dtfP-d?=Gk=AAS&Tt?hhdGfdSc?fPT=Pct&Pt>h=GFkASS-TP?GhcG&dTcG?_&k-ft-GP*G=ck&&TStTQ?kkfG-fP!Gf=&A-&&f&PTGTctA&??Gh=?ch&GTh--G?=TAAc=tPh=dhfdSG?t?==Tct&Pt-hPc-&2T-ttXPdt?hGGcdG?c?A?&htGhh??cT&fTTtc5tkhfhtSrfdSkTS?-T&ShtdGk&-=?=Gck=-S-=PkGAckdGS=?OPt?&ccA&tkhSOAfdd&?fP==fc+&St-h-=cAc&ctfh&dfP=AXTStTh&dSkh-bhGd?kGSd-cPdtPdkkP-d-AP=k-f&-?P=G?=hAG&hS-P6=7ckA=tfcGtfdAfh-GhhdAkhSG?dPGt=d-fcSAh=dSk=Sk-APkTchSdhTchcsckff&-f&GhSd=f?Sf?-PdG=fG-P?GGd=cAdkf-TPcGGcPAhTTPTc?cT&?Thh?-cckAATIh?A?}kffSc?GP?=Sc?&&Tth-dAA&Tct&B-dtf-c&tnhd{ckGfctGhhdGfd?k?fP&=-ANTkt<h=dkk=Gt&?hdKkd-fTSS-&Gs==SJ-&PqG=ckA=kc?SP&G&fc-=?cGf=&Afk?-A?==c=h&-ThPh=tch&GtdhG?t==&dc=tt2cd?&StShS6Tk?fTcStteS/&fGS??-PTkkSf-k?AGS=ATtfG?WP=GtcSA=TdcP==A?&=tkhAdkGGA=T#ttA=c&TGT&h-<tk-=A&?t?hGWhf=ht-GfH=&cT&StkcTW&kGSc?SPtSSf?-=??Ph=GchASGG=sfT=d=STchfX=k-k=Th>&ahkGSd-G&thhd?fShhfAP=GAAd&fTc3*&PXSSk?-?&G?c=AATfGkcPAk&AtShAvxAAr=-GfckcTSkGkh?TPtc7cP-TP=GTc?AhT??CPf=Gc=-PPSGPc8A=TNSPP-==ccA&?=Gd=cAf&&t-htdhPISA?GPA=ScT&S-cPlPcc=A=-tG?GtcP&UTPSTPG=cc=c&t?_SdkkGSS-P?t=ccG&PThGSc=AS&Tt?hT2kT-TPGAThh.kAfkSA??GTc?c=-hG}GhcG&dTGftP&GtAG&nTAW-Rhf-T?hG2?dhfGSh&-hh6-khSc-SPc?GchA&??GG=?ch&GThS=GxcGc!&AhdgtdckTSGh?d=k?fh-G?hTtdckPft?k-h=SckTfTGht=hAA&htG!ddGGhA=t-hc==A-&=tkhAdkc=chTctA=fA=&fT&h-R&P-Ad&hTtT=d-fP-d?A-f=dcA&PTGG-=tAPTCtcPddAfSST??tT=GAd&ctfh&d-ktSPt&P==fcA&STTh?UhktAf-cPSG&htAtTGh{r=kkfhTG?TG?=hddTdtAufd&&dSt?GG%=cAk&AtS5f_tkhS=?dGk=fcT&-ThhPdScTSk-APS=-c?&_TGh-Gtkff&--P=GPcdA=TkPPlSdtf?-r?GGd=cT=cSt-hhdPSGS=?fPA=?cT&c?fhGddkc-A-&P?GtcP&AT=hf:AkSfT-??hGGddAcTSt&b-dtfP-3PAGP=AA-&ThkhhdGfd?c?-P&=?ct&Gtb:TdkfT-h-TP=GhAA&dTchfR&f&ft-GPlG&ckATTSeTbtdhf=-d?AGfcrA-tnCfH>d&fk-A?SPT=?ch&-tdhtdfk&S-?dPP&rAA&kThhSdck?SG-Gcdcmcf&jT-,SRPkGf=GkPSGScdA?TStG#hdcff-c?-Ph=PAS&=tfhAk?c=S??5PGcGcc&fT&d-TSkPSd-=PfGAAfATT?h?DGkffc--?&G-=tAPTGt=MfdAf?ST?PPhccAh&ctSh&kdktSP?E==cAcA&-TThPqhf&Sd?&=oG&cGAtTchYj=kkfA?S?TGP=hAATdt&Yff&hGSt?GGm=cAkt#tSdTT=khS=?dPA=fAt&-tSthdykcSkGVPSGtc?&BTGh-Gtkff&--=fGPcdA=T??hWSdTf?AT?GGk=c&-SGt-hhdPf&S=?kPAAShf&?t4hGdkkc-P-&GPc=cP&fT=h-QAkSfT-?PcGGckAcT?t&CPdt-P-G?=Gf=AA-&ThAhhfGf?Sc?SP&=?ctT=t9d=k#kAS--TPPGh&E&dt&h-8&kGft-GPzG=ckAA?StTlPdhfA-d?&GfckkP&ttGi*GPfkS&?SPT=?AfS&tdhcdf=cS--hPP=lf-&kT&hSdjk?fh-GGfcccfAtT-hc2Pkxf=Pk?tGS=hA?TdtGd-dcS-?=?-Gk=PAf&=tkhAdSScS??dPG=-cc&-T&d-kPkPSk-=PSGAA=ATh?%k#Gkffc--?&=P=tAPTct=zfdAf?ST?PPh=GfT&ctSh&d=ktSP?vP=dtcA&?TThP7hkGSd-c=-G&c?AtTGhzBAkkSdS&?TGP=hh?TdtAHfdTf--ktAGi==AkM=tShtd?ff&&?dPc=fdc&-ThhPd;A-Sk-TPS=kc?AhTGhddAkffh--?hGPc;A=tSNf:Skdf?-A?GGd=cTf&Tt-gkdPfSS=P?PAc?At&?t-hGdSkcSf-&P-=fcP&ST=hGyAk?fTP?PdGGc-AcTPt&dcdt-P???=G?=AAG&ThGhhdGdASc?-P&==ct&Gt h=dTkAS?-TPPGhcG&dTc?f<&kPft-TPEG=ck&TtttT8GdhSS-d?cGfA&AP&tt= XdAfk-h?SGhc=ch&&td)Tdfk&S--tPG=HcA&kThhSmhk?-h?tPdG&cfAtT-hk,Pfk-S-k?hGScTA?&htGpd-tff-d?-Pt=PAf&=dkQ=dSfkS??&PGckccT-hSh-dSkPSP-=PkGAcSTPT?h?uGkkfc-f?&=PAkAPTGt=jGdAfSST??=-=GAP&ct=h&dTkt-PP?P==PcATcTTh&;h-G-?-cPGG&ccAtt-hyp=fSfA-??TGA=hA=TdttdPd&f-StT-G8=cAk&APXhTdPkhSA?dPc=fAtt-Tth=d0f-Sk-APScTc&AhTchd*&kf-l--GK=dc7ATTkttvSdTf?ShPAGd=&AfT_t-nmdP-<-=?kPT=Sch&?hShGfdSkSf-tP-=YcPTkT=hkdhkSft-?PdGGckAcTfhPQ-dhfP-v?=Gk=AASfTt?;1dGfPSc?fP&cPAf&Ptdh=dtkASS-T=?cPcG&kTchS*&f=ft?=PSG=c-AAtPtTx?dhfG-&?cGS=&AG&tt=_>f=f&SA?-PT=Pch&&tdv&kPk&SG-tGP=qc=&kTAhd4Tkcfh-GPdGTcft&tTtt+Ak,S?-kP?GS&TA=&ht&qdf5ff-??-ctckAi&Ttkx.dSfAS?-hGf=dcA&ft!h-+hkPS_t&PkGAcSAtT?thKGfffc-f?&GPcGAPTst=jzSf=T&-TthfM=dtf?z&htdcktSP?zPPtGkkfcSchGk!kGSd-cPdtPdkfSSfS?Gq=tc&&kTthduGfSSk?dP=dtfcSt?PGb=PBtfG?SP=dGf=SG?dPc=dhPf-SPPdP==SAt&GttGhctAhTGhd.GPAAIAtthhSdcfSTSh?{SdTf?ST&fhTEfkTSG-kPG??cTAc?SGy=ScT&?TT?PPc=hAQ-tPAGtcP&FTPSTPt=-AfPtPvGGcdAcTft&x-k?PP-kPSGk=AAS&Af-?&=SG&APTThc^?d=fStkhhdkkASS-ATkY.kSf-SPh-dPk-ft-P?tTf6Af?SP-cGkG=cd&-TtG-cGA-&ttPht?Tc=A?&Thdttkffd?k?PGTktST-tPP=acPdTSGPn-G=TA=&-Pf=fcfA&T-t&-f=TAfAAtPh-dSk&Tdh?1ddcffScShkkkSTGk&fTPGPh=GAfTchfh?c&TkT&h-qtk-Gt&ctGhPhkkt-E?cGS?&cc&StRhd=tAPTBt=qf?%fSST??Ph{?Ad&ctfh&d-ktSP?4B-=kc&&STth?VhkGSP-kPfGTc-&fTPhdq=kffA-GhdG?=hAGT?tc0Sd&f=Tk?PGR==h?&At-hTd&kPSG?dPc=Ac&&?TthGdwkT&?-APSGTctAhT=hdutcPf&--?t&Ac<AcTkddVGdTf?Shc&Gd=AAf&tt-6k=Af1S=?kAh=Sct&?hdPSddkASf?SP-GtcPtXt-hfr&kSft-?PcGGAf&cTfth%-kSfP-w?=GkAdAS&tt?UkdGffScGfG==-ch&Ptdh=k8kA?S?PP?=bcG&kTchGx&kA-A-PPdG=A-AAT-tT(Pdhf&T-?cGf=&&G&ttG_xdTA?SA?SPTTcch&=tdp&Ghk&S?-tPh=vc=&khAfc,TkPfh-=Pd=-cf&tTcttackHfh-k?AGS=T&N&ht=^ddTffSt?-=t=cA_&ctkh&dSfAS?Ph=d=dcA&fTTh-dfkP?IP?PkG&cSAtT?wdXGffSG-f?hG-cAAPT)t=/kcAfSSt??Gk=GAf&ct=?td-khSPcSP==fcA&STThc=fkGSd-cAPG&c?AtTPP&O=kSfA-??TG?=h&chdtcj?d&fTSt?PGFA=A&&AtPhTd=kh-f?dG&ctc&&cTthTd#k=Sk-A=rGTc=AhTThdO&kf-&?k?tGccKA&Tkh=pSfTftSh?AGd=TAfTdt-htkAf0SA?kPT=Sct&?ThGSddk&Sf-hP-GtcP&shAhk+TkSfh-??hGGcPk&Tftt_-?kfP-d?=Gk=AAG-dt?hhdGP-Sc?SP&=-fc&Ptfh=d?kASS-TP?cxcG&-Tch-g&k-ft?=GSG=cPAAT&tT:?dh-G-h?cGG=&Ac&thkL^kAS=SA?APT=&ch&Gtdhckdk&Sc-tPt=mcA&khA4fuTkAfh-TPd=GcfT&Thttg&knft-kP%GS=Tc4&htAqddhffST?-PtckAK&&tkh&dSkTS?-htG=dcT&ftdh-OtkP-k?TPkGtcS&-T?theGSdS=-f?hG-cdAPTAt=dSdTfS-k??G?=GAd&ctf,-d-fdSP?-P==ScAtSh-h?dkkGSS-cGkG&AP&cTPh-K=k-fA-S?TG?-PAGTPtc}fd&fGSt=P=A==AG&Ah0hTkPkh-c?=Pc=cc&&tTthPdxk=SA-AP&GTc?AhTGhdd&ktf&-t?tGGc A=TktAXPdTfTSh?hGdcfAfT&tPhtdTfyST?kGk=STTTAThhtddfcSf??P-GtAG&IT&hkddkSft-??hdAcdAcTftTU-dtfP-w=SGk=AAS&Tlhp6dGfdSc?fP&=-ctTAtph=dkk&SS-tP?Gh&3&dTchfeTk-ft-P=Y=SckAATStTi?kSfG-d?tGf=tA-&ttPbPd=?k-f?SPh=?AA&Gt&hcSff=S-?%PP==c=&&TAkSk-k?Sd-GPfGccSA&w-=?%Pkkf=?!?AG-=TA?ThtGKSdcf-S&?-PtAPAc&=t-hAdPkT-f-hGG=Acc&-T&FSRtkcS9-=GcGAcPATTPthIGkdS&?L?&G==tAAT^t=DkdAS=ST?=Ph=&Ad&Atf &=-ktS=?bPh=kct&StfhcdgkASd-APfGTc-&STPhWdAkkfA-SPEG?=hAGTdh&+fd&f--k?PGE==AkTTtShTd?fSSG?dPc=fAt&-TthPd?k=Sk-APS=hc?AhTGhGvckff&--GVGPc+A=TctA2SdTS?PS?GGf=cAA&&tGhtk=S=S=?-PA=AcT&?ThhGdAkcSf-&PGGtcG&oT=o?/AkSfT-P?hGGcdTct:t&y-dtfP-qPcGk=AA=&TtGhhdGfdST?fc&chct&=t_{-dkfASSGTGtGhcc&dtChfaTk-SS-APdG&ckAATSttq?k?fG-dP&Gf=&A-TktPb%d=fk-T?SPT=?Ak&GtdhcdfftS--tPP==c=&kTAhSdhk?fh-GP?GccfA&T-%8QPk+f=-G?AGS=TA?tdtGUddcfcS&?-Pt=P&k&=tkhAd&kTS?-hGGddcc&-T&hTYtkcSN?AGtG&cPATT=th;GkdfcfT?&G-=tAcT^tcOkdA&PST??Ph==Ad&ctfl-d-ktSP?kGk=kcA&STASAP&cfAdAkT&}?kd&%tkh(H=kkf==tT?nddkk-ST-S?&=2c=-}?tG_==Ak&=kTP==k=GAfTdP&=&c&&-Tth--c=kAT&G&&h?k1fATch-9ckff&-fAhIkt=AAT?tAYSdTfS=GtShT=&Ah&&t-htd-PhA?Tt&?%SdtfcSAPkPtcXSS-&P-GtcP&pT=tkSck?S&-??hGG=h GSS?kPd?&cG&ctShtt?kSft-c?Ad=fdSc?fGP=-ct&Ptk/?dkkASS-A&-h&kSVc-??hG?=?cGTSt&h?cS&kTStT6?dTG?&GTtthj=khT*tt0Od=fkS=T-h-hhkVSk-&h&dtk&S--tP-T=k-ftSS-hPT=Ac&&ttTGAcfA&T-ttzPkak==d?TGc=TA?&ht?PTGf=T&NTkG}=hAe&=tkh=?5=c&dTAhk3GkA&-tYh-_tkPftcctTTSc?&ST?thIGdhcA&=tPhkdGffTkh-7kdAfSSAA-t&dSh&fc-SPmGdcGAST?PA=&cA&STThS-cc-A&T?tcadhk8&fPhED=kkfA--==G?=hAGhdhTRSdTf-St?PGc==AktStShtd?fdSG?fPc=fAh&-tQhPdvk=Sk-AG?=&c?&kTGh?Cckff&--PpGPcSA=TftADSdTSG-G?GG?=cAG&&t-htdASkS=?-PAAPcT&PThhGffkcSc-&P?GtcT&Vh=Sd8Ak&fT-T?hG=cd&&thtTohdtSk-U?=Gk=ASS&TtthhkkfdS&?fGk#Pct&htgV&dkk&SS-TP?=fk&&dTchfdhk-fh-PGki-ck&fTShfm?dhfGPdtdGfcSA-T?tP*=d=fk?k?SG?=?Ad&Gtdhcdff&S-?GPP=Pc=&kTAhSkkk?SP-GPAGccSA&T=o?qPkof=PS?AG-=TT?dttG5=dcfcS&?TPtc=&&&ct&hAdGkTS?-hPGkdcc&AT&hhatk=S -htSGAc&ATththO=kdfc-fP,6==tAPT2%kokd&fS-dtcPh=GAdt=tfhTd-St=??OGd=kAk&St-h?kdSSSk?SPfGtc-AtTPh_==kkSf-SPPG?cdAGTPtkVfkSf-?T?PGd==Af&AtGGdd?khSGGBPc=Sc&&=?khPdrk=?S-AP-GTc?SATGh=Rckff&--?tGPAGAcTAtA)AdTf?Sh?Ght=cAA&&tPhtdGfmSThcPA=PcT&TThh=ddf&Ah-&PGGtcc&XT=hk{Af&ft-c?hGccdAcTft&P?dtfc-n?AGkc_ASTdh?hhdGfdPf?fPT=-&td?tVJddkfkSS?SP?Ghk-&dtkhfFtk-fh-PP?T&ckAtTSdSV?kefG-f?cGPk!A-&ttPkPd=ffSA?Sd_=?ch&Gtkhcdfk&S?=RPP=6c=&GSThSoTk?Sk-GPkGccfA&T=PkwPkef=--?AG-=TAc-ftG{ddcfPS&??Pt=PSf&=tkhAd-kTS?-hPt=-cA&ST&h-btkGSl-cPkGATPATT?thR=kdfc-fG&TS=tA=T#t=mkkSfS-hGkGK=&Ad&&tfh&d-ktTP?uPA=kch&SThh?d-=cSd-&PfcPc-AhTPh*n=k?Ah-S?TG?AcAGTktckf?Af--d?PGk==AA&Ah?d=dPfSSG?SPc=fc&&-?thPdfk=SP-AP?GTc&fdTGhSHcftf&-??tGPcnAT-?tA*SdT-dSh?=Gd=c&A&Tt=htdGfuS=?kPAfScT&AThhAddkcSf-&PTGtcA&8TAhke&kS-T-&?hG&cdATTfh-m-f fT-u?hGkcdAS&Tt?hhdhfdSt?fGk=-Av&Pt?hhdkkhSSPGP?=^cG&dTchP=Ok-ft-PGAG=cfAATSm-+PkSfG-k?cGf=&A-t?tGb?d=f?SA?SPT=?k&&Gt?hcd-k&S?-t=PThc=&-TAhS{TkTfh-GATGcc?A&TPtt+=kzSA?k?AGG=TAt&htGrddcStS&?cPt=cAj&=tkwTk?kTS&-hGj=dcc&ftBRS/tkAS(GcPkG&cSAThGthdrkdfT-fPfG-Ata?TOhkykkffS-k??=dASAkT-tfsed-ktSP?}o==kAS&StGh?ddkGSP-kPf=-c-tATPhd;=kffA-GhdG?=hAGhttcySd&--=T?PG===Ac&At=hTkGSAS=?&Pc=Sc&&-TthPc(k=SA-APhGTcGAhTtt=:ck&f&Gk?tGGcDAcTkthGGdTf?Sh=-Gd=AAfTV?=htdPf3P=?kP&=ScTTtt61dddkASf-&P-GtAh&dtfhkdfkSfT-??h/-cd&fTfttm-dhfP-SzdGk=hASttt?:IdGfdTT?fP&=-ch&Pt6h=dkkASS-TP?GhcG&dTch?0&k-ft-Ph&G=ckAATStTV?dhfGfk?cGf=&A?&ttGy2d=&-SA?SPT=Pch&Gtdhcdfk&S--tPP=Lc=&fTThSoTk?fh&?PdGccfA&T-ttjPk!&&-k?AGS=tA?&htGx=dcffS&?PGG=PAm&=tgSPG-cGch&=t&htd?tATtht;tkPS5-PAhEd0TkPSc-&PSS=f&-G?&G-=tA-Sh-kPf=Pf?-G??Ph=Gchk--S?AGc=Pc=GG&=3hd-&?tTh?JhkGfhcft=hPd-f--d-TP-ScG-T-t-thdcffTfh?Vfd&f-S&AftTdSdTS---P-=kcwAhTPP&==c&&-Tth-?&=cAt&htdGhcTAhTGhd%GP=AfTdThh-kdA=TktAeSdt-4Sh?GGd=cT=&&t?htdPf(S=?k=AcccT&PThh=ddfkSf-&GcGtcc&_T=hkOTkS?TPf?hGAcd&dTfho4-kSSp-{?=Gkc-AS&tt?hhdGf-&t?fP&=-AG&Ptdh=kSSPS-?dP?=dcG&dTch=Ptk-Sk-PPcG=cfAATStT4ccffG-d?cGT=&A?&ttAGSd=fkSA?hPT=PchTchThAdPk&S?-tPP=WAATtT&h=_TkAfh-GPdGcdGA&T=ttBAkoft-kPAOS=TA=&httLddtffS&ShPt=GA7&&tkh&dSkTAS-hPG=dcA&fT&h-9tAfSs-cPkG&cSATT?h-0NkdfA-fGRG-=hAPTdt=W?=hfSST??=f=GAk&ctPGOd-ktSPP=P==fcA&S?=h?dskGSf-cPfG&c-=hTPhdB=kffA--?T=GdAAGTktc:?d&f-St?P?d==Af&At-hTdPkhS&t-Pc=fc&T-TthGdXk=T--APSGTcPAhTGhdd1kff&--?hGPc!A=TktA*SdTf?-B?SkcGAG-d=SPGt-?fkSt?kPA=ScAkf--?=GTk&Sc-&P-Gtc-(AkP?&PS==cc-GP=GGcdAcTdSd?tGTcT&dt-hh!Pkd&hhShhdGfdSGAGhfdfdAdf-dPfPh=?&>&ttT.-cG&dTchf*&f-ft-PPRG=ktAATStTU?dhfG-dGcS?=&A-&ttPgrdhfk?AkPPT=Pch&GtdhhdffcPT-tPG=1ch&kT&hS*tk?SfT&PdGccf&kT-thgPkSAT-k?AGSc&A?T:tGkdTTffST?-Pt=PAf&=tkkfd-khS??EPG=dcc&ft?h-ddkPSd-=PkGA&ST?T?hkgGkSfc-P?&G-cSAPTSt=_SdAfSST??G==GA-&ctSh&d=kt?P?GP==?cA&GTThG<hkG-G-cP?G&cGAtTAhEd=f.fA-??TGc=hAATdtc=?d&f-St?GGQ==Ak&AtShTd?khSG?dPc=fch&-TthPdzA-Sk-APSGTc?AhTGhdtAkff&--?hGPcdA=TkPtqSdTf?-6?GGd=cA=&&t-htd=f-S=?kPA=kd&kh-S?-dff=Sf-&P-G&hkfMSk?&PSGhA=&ft=TdDTk?Sp-GnPk?fP-}?=Glt?kASf-&?&GfcTS&?AP&=-ct&-fG?TPAc&AdTPhd=dAf&dTchfmcPScATf&Ah?d&f=S--GPfkdSS-d?cGf=co=S--k?=GTGcAh&Tht9fk=&=tdhcdfktS--tPP=kAS&kTAhSyAPdch&=t-h?t&kGSd-APfkkSd-k?AGS=A%dS?-tPPGP=t&G??Pt=PA2TktkhAdSkh-f-hPG=dcGdkS=Pd-PcfA&Tftfh-kdf=Sfhd.Tkdfc-f?cTAaPk&fTtAH?dAfSST?S&GdSkT&&tth&d-ktS-cctkNTdtfd-=?DPG=&A--&PcG&c-AtT-f=G-=tcSAhTTGGctAGTdtcXd?cc?&STf&t0ck&S??)SGG?cVA&&TP&=hc&&-Tth--h=?Atc?tShtdckA-k-tGDk-Sf--?tGP=tkcSc-SP-=PAd-dPkGd=cAf&cf9PA=kc&&KTP&Gtk*T&?ThhGddkA?P-&P-Gt&PGfT=hfxAkSfT-G?hctc-AcTSt&9=dtfG-M?TGk=hfG&Tt?hhd&fdSA?fGKd=ct&Pt/d&dkk&SSPT&-Ghc=&dTchfdkk--nPfPdG&ck&aTStTC?dh&G-d?AGf=hA-TCtPy?ddfkS&?SGP=?As&GtkhcdPAHS--tPP=cc=&fTAhG=dk?fh-G=SGccSA&h-fT5Pkkf=-f?AGc=T&GtAt=X-dcf?S&?-Pt=PS1&=tShAdGkTSG-hPtG=cc&-T&+-%tkGSM-cPkGhkGATT?thdGkdfA-fP7r==tAPTQv&Ykd&fS?TA-Ph=cAd&Atfakd-S+hd?sPT=kct&STTh?/hftSd-&Pf=ac-&aTPmk6tkkft-SP-G?=hAGhdhSYfkNf--K?PGP==Akt-tSYdd?fSSG?dPc=fAh&-tdhPdqk=SP-APG=Pc?AhTGdkMckSf&P-ATGPcGA=T=tAN-dTSG?A?=GA=cA&&&t-htdP&aS=?cPA=tcT&GThhtGfkcSA-&=?GtcG&(T=hkWhcGfT-??hc=cdAATft&=ddtfh-v?=Gk=AAS&TPkhhkdfdSA?fP&=-ctSStl9ddkkTSS-tP?=fk&&dTchfkhk-fh-PP?T&ckAtTSp-7?kLfG-f?cGPk A-&ttPdGd=ffSA?Sd =?ch&Gtkhcdfk&S??-PP=3c=tk=thS#tk?fh-GPkGc&f>AT-th2Pkdf=-S?AGccdAPTktGvddcfSS&?PPt=P&k&=tkhAdSkTS?-hPG&Scc&fT&h-mtkPS -=-&GAc-ATT=thX=kdfct??&G-=tAGTvt=/kd&SdST??PhcckT&ctSh&d?ktSP?R==?tcA&-TThPFhkTSd?&P&G&cGAtTAh s=kkfA-??TGP=hAATdt&iff&fhSt?GG8=cAkTdtS_fkGkhSG?dG?=fcT&-ThhPdScTSk-APS==c?&#TGdd&TkffT--?tGPckA=hkfcUSdtf?-q?GGS=cA=T{t?3ddPf5S=?fPA=-cT&?hdhGddkcSf-&P-GtcPccT=hfxAkPfT-P?hGGfSAcTft&g?dtfP-^?cGk=AAS&hhdhhdGfdSGAdtT4hdAkkSTPf=6=GAt-TP?GhcG&dTthfx&k-fttfP4G=ckAATStTC?fhGP-d?cGf=&A-&htP+/=?fkSA?SPh=?Az&GtdGTdfk&S--hPP=lc=T?TAhSOTkGSf-GPdGccdeT-EfPs=kSf=-k?AGkdfkfStt=qddcffS&?-PthUhU&&tfhTkAkTS?-hP?ThdAf=SGSfPhcdAAT-AThAd-fdSkStPG=kc-&fATa#tPA=Tht=}kdAfk=ATPh-rShhfA-TPP=dP=APTdtThtcT&tTTh?Whk?=?&ftk3kd?fc-S-&P?kSS3-S?TG?=TkGSt-=P1dtf&St?PGQ=PhTd=-t??GA=&Sc??Pc=fc&&ff=?G=k=?SS?SPSGTc?ATfu?GG-=SAG&?t-hTck&fTktA3SdAGdAhTdhA*fdtSG-kPGd=f=S=?kPA=khPkh-c?-?==fATTGPP=PcP&8T=h0?(GTAGTdtfh-d&f-T-hSO-dtfPSt&Pth!?fDSS?zfcdcf?Sc?fP&=fkff#-&?=dSfkSS-TP?GThdfT-?-&PP=-Sl?kPgG=ckA=kf-cGkPPc&ActAhqd?f_T)ttC3d=fkS=T-h-hhkNSk-&h&dtk&S--tP-TcdkfTSt?dG==.cG&&t-GccfA&T-tt--kvf=-kPTKT=TAP&hhGxddcff?&??Pt=GAC&ctkxfdSkT-P-hPc=dcc&fT&h-ktfdS_-APkGTcS&=T?h-kSkdfT-fP-G-=hAPTkt=r?=hfSST??GG=GAk&cUfSAd-fdSP?kP==PcAT?h=hPdSkGSt-cPfG&c-StTPhf8=kPfA-??TG&=PAGTStcghd&f?St?GG0=Tf?&AtShTkkkhS=?dPck?c&&-TthGd3k=SkPAfPGTccAhTAhddfkf-&dG?tGAczATTkh?XSkhfPSh?TGdcTAf&&t-htkGfQSh?kP&=ScT&?hhh=ddf_Sf?kP-c,cP&itfhkddkSSS-??hGGcd&hTfhdl-dtfP-P?=G?c=AS&Tt?f-dGfkSc?f!G=-AG&PtCh=dkkAScP=P?=GcGhPTchS!&khft-AhSG=ckAANctT/Pdh-GdS?cGT=&At&thfFudhcSSA?tPT&&ch&=tdhcdff1&=-tPP=^Th&kT&hSkTP-fh?fPd=Scf&kT-qxkfkdS?-kPhGS=TA?&hPG(dk-ff-=?-G0=PA?fAtkz?dS?fS??5PG=dcc&P?4h-CtkPP?-=PfGA&SB&T?hAyGk&fc-=?&=PAcAGTtt=dfdAfSST??^h=GAT&chdh&dPktST-GP==tcAt=TThPlhk=Sd-thPG&c-Ath&hD1ckkfhTG?TG?=httTdtADff&GSStPSGsc-Ak&&tSzhfkf*-P?dGP=fc&&-TtGPd.f?Sk?cPSGhc?&-TBhddPkf?P--?hGPcdA=T??hMSdTf?Pc?GGk=cAP- t-htdP??S=?fPAASP}&?t&hGdTkcSt-&P-?dcP&TT=hhmAkGfTP?fkGGctAct+t&:&dt-TAj?=Gh=At-&TtPhhdAfdSttPP&=-cthGtChcdkkh&G-TP?GhTt&dTAhfdkfSft?SP}ATckA&TSttK?kfA&-d?cGfT2A-&htPqS=TfkSA?SAf=?AN&GtddkdSkTS-?APP=Qc=&khfh-xTk?SA-GPdGcc=^hT-hfYPfSf=-f?AG?=TAc-ftG ddcSPS&??Pt=TcG&=tkhAShkTSP-hP==dctSPT&h-Nt?kSp-cPkGhkGATT?th--kdfA-fG&SG=tA&TKt=/kk-fS-hAhPh=tAdT=tfh&d-StSA?2Ph=kAd&SThh?^hfASd?dPfGtc-AtTPhRdkkkSf-S?hG?=hAGTdhc fk-f--7?PGD==AktktS7fd?fGSG?fPc==AA&-tfhP--k=Sf-APcGTccSfTGhdvc?Gf&-??tGAkSA=TktA-ddTfPShPchT=cAG&&hShtdPfW?=-tPA==cT&AThhcddkc-T-&PAGtc=&+T=hkjAktfT-T?hGccdAcTft&d&dtfh-z?AGk=AAS&TthhhdTfd-k?fPt=-AtTGt3h=dkf-SS?kP?AhAP&dTchfdck-Sk-PPqd&ckAATSttU?dhfG-c?cGf=&APT-tPbid=fbcdTAh=%PdTS=tfmfdfk&S--&&S%?dkk&Sh?dP=StSd?kPdGccfAckd-hGkG=cf&?TGh7&-AGTctGwddcfdcPT?tTF&d=kAHcSA=d=PSG?APG=dcc&dkG?kG==kAc&ctcePd-fSS&hddVkdfc-f?ct}dcktSG?d?hGPf?-f??Ph=GchSk-T?TGAccS=??P==kcA&kf=?PGA=&ct-&PtG&c-AtT-f=G?=tAkP&A&)fzGfkfTtcqfd&f-ShGdGV==Ak&A7chTdPkhSG?dPc=f&&&TTthGd<kcSk-&PSGTctAhTAhd:ckfft--=tc8c.A&Tkhf%Skdf?--PPGd=cAfT-t-hhdPf*S=??hh=ScT&?tGhGdkkc--PGP?=kcP&kT=hkBAkcf--?PfGGcAAcTSt&O?dtfATS?=Gk=AAt&TtPhhkcSTSA?PP&=Gct&PtY8Aktk&S=-TPhGhcG&dTcf&l&k=ft-AP}Gtck&AtatTb=dhfT-d?tGf=&&d&ttGuod&fkS&?SPTAdch&GtdhAdfk&S--tGh=7cc&kT&hS^Tk?S-P-PdGAcf&hT-thjPkdf=-?thGS=TA?tktGYkdcfPT9?-Pt=P&?&=tfhAdSA=S??0PG=fcc&fT&h-thkPSd-=PfGAc-ATTcPf<Gkdfc?&?&G?=t&=S&t=JfdAfAST??Phcc&T&At-h&dAktSP?{P=bhcA&-TThG.hk=Sd-c,?G&c-AtTGhiL=kkSf-S?TG?cd&PTdtc6fdc=SAPtftTdfddfS?k?cPdcPA-&tt?=-Ac&-TthPFtGGcATPtdDPi-kG-?-t?-=SAt&kP8=dcrA=Tkt=Gf=SAv&ktfh=Efdtf=tPdEdPfLS=?7TchTk=ff-=-SGA=fA=TPtThPkdkTSh-TG&k?S--??hGG=hd?S#??PhGPcG&??cGk=AAS&Tt?hhdGfdS&PSP&=-ct&-fh?kGt=GAtAPtfhTd&ktS-?hP-=Ac=&SPdG=ckAATStTj? hPP-d?cGf=&A-TAtP{!d=SStt?SPT=?Ak&GtdhcfffkS--tPP=oc=&PTAkSk-k?fh-GPfGcc=A&tPhc/PkQf=--?AGS=TT?TftGDddcffS&?cPt&P&?&=tkhAdGkTSt-hGccAcc&fT&hG_tkPSHP=P-GAcSATT?th*Tkd?cSS?&G-=tAtTeth:kkTSkST??Ph=AAd&ctfd&dhktSP?>P==kA2&SLThP3hkGSd-APf=kc-AtTGhv<=kkf&-S?TG?ASAGTdtc_-k=f-St?PPttGdhSPkTP==kc=A=&AhPjhd=&PtkhPd.k=S2cShBi=cG&PTGhd7ckd=S&=TPpG2TffSTtT}hdTf?Sh??&AXfktfh-kPcGd==ATT?PTcfcT&?Thh?G-=fAtTGAhhPdAfSk=?=Ph=jccT^Pd=fcdAcTftc-SGAAfcGTTtAd&kdSP?dbddtfdSc?fPcoTdPfG-cPSdSf-SS-TP?GThffdSf?TP-=_Ac&StcGAc&AATStT.SPtch&ATThtdSdtf=-SNdd=fkSA?SPT=?=h9Ptfhhdfk&S--&t?h=dtkhTTdqqTk?fh-?t=ISdD)Pft?kPk=TcTAAtPhdY=^&f&-dPAGPct&GAThkQpfdf?-&P?d?f&S?-hPGGhhGfS-k?d-&=GAcTSttT?dSktSc-Ayck&fc-f?&GftTkSS&SS?h=-AkAtTdt&=cAG&ctfh&dfPP&fT&tkhTdA&?t=h?qhkGfhc=t)nGh5ktSG?SP-=&cG&c?h=k=hAGTdtG-P=fcXAPTATGvTdAS&-dPPdGf?SG?dPc=dFSkt-G?SG?c-SS?zPSGTc?ATkt-cPh=,ft-h?tGPcyAPdT?GPh==cT&SA-&hhcA-Tft-htdPktAcTctSU-kPSdThhGddkcSfhAP-GtcPTkPthkq&kSSS-??hGGAfA&TfttI-k=fP-n?=ckc?AS&ht?^ddGfhScP-Gd=-Ak&Ptfh=dkkASSPdP?=dcG&-Tch-6&S-SP-PPkG=cSAATctTj?khfG-f?cG?=&A-&ttPd-d=ffSA?SPT==ch&&t?hcdfk&?A-tPG=7AAftTAhc/Tfdfh-GPdccSSA&TAtt_TkeSP-kPTGG=TAt&hhd6ddcffS&P-Pt=TA*TdtkhTdSST-c-hPt=dA>&ft=h-ktkGSi?dPk=+cSTyT?thdkkdSV-fPSG-c8APT?hdOkkdfS?.??G/=GAk&ctPG_d-ktSPPfP==fcA&G?dh?3hkG?P-cPSG&&-{TTPhP2=kGfA?d?T=GAAA=TctcuPd&f-St?Pdu==A=&AtThTdGkhStTfPc=cc&tATthGd8k=Sk-hhGGTc?Ahhthd0Akf-&dG?tGtcCAhTkthvSfTh=ShP GdcdAfTtt-dtTcfY-k?kGX=SA-&?t-dSddfkSfPcP-GhcP&=T=h?GhkSfT-?GTGGckAcTPP D-dtfPP??=Gf=ATSd&t?7PdGfGScP}P&cP&c&Gtch=kdkASS-TP?dhcG&=TchT!&kPft-T?GG=ccAAhGtTyPdhf=-d?tCP=&A-&tCAL2dcfkShtGPT=?chtttdhAdfk&-T-hPP=4ct&kTAhSddccfh-GPdAkcfATT-hS-ck;fc-kPSGS=tA?TdtGU-=tffS&?-GP=PAd&=tkGPdSktS?-hPG=dcc&=TSh-_hkP?&-=PfGAc-ATTcPf}GkdfcPh?&G?=tAA-St=ekdAG=ST?PPhcckT&ctSh&k.ktSP?u==?tcA&-TThPmhf?Sd?&GSG&cGAtTchlM=kkfA?A?TGP=hAATdt&gff&STSt?GGE=cAkT&tSOfkdkhSG?dct=fcT&-ThhPdScTSk-APS&dc?&MTGh-Gtkff&--&fGPcdA=TkPP}Sdtf?-5?GGd=cA=ftt-hhdPG-S=?fPA=ScT&c?fhGddkc=G-&P?GtA=f&T=hf;AkhfT-??hcGcTAATSt&%?dtS--5PAGA=AAP&Tt=hhdGfdScPcP&=?ct&ct(hAdkSASc-TPPGhc=&dtAhfk&fAft-GP6Gcck&fTShfdPdhf=-dccGf=TA-&htPzS=TfkSA?SAT=?Al&Gt-Ptdfk&S-AfPP=dc=tkkchSohk?Sq-GPtGcA-TGT?hk7PkSf=-k?AGSkTA?TdtG(-dcf-S&?AP?=PAk&=kGhAd-kTSP-hP&d-cc&fT&fAvtkGSa-Th?GAcSATkAthl=kdfcTh?&GP=tA=Tqt=jkkdc?ST?GPhtkAd&Atfh&d-fk&A?1P==kh-&STth?dfc&Sd-cPftdc-AhTPh(=-kkfT-SP4G?=hAGTdP?_fdhf-Sh?PGb==AktTtShhd?fdSG?SPc==dt&-tphP?-k=Sf-APSGTccSfTGhd_cPGf&-??tGPk&A=T-tAMGdTf?Sh?G=&=cAP&&tPhtdPfqS=PGPA==cT&PThhGddkcSc-&PGGtc&&KTchkuAk=fT-=?hG=cdAcTft&.Gdtfc-B?AGk=AASTh?khhd=fd-??fP&=-ASAhtwhcdkGSSS-tP?=JcG&--thfq&k-=P-PPdG=c?fhTStT{?AGfG-k?c=-AGA?&htP9cd=fkSAP?h==?Ad&GtThcdfk&S-ThPP=kc=&STAhSVTfG-A-=PSGccTA&T-tt}AkTf=-f?AdT=TAP&hhcPTdcfGS&PdPt=PAE&=uShAd=kTSA-hP&=dA&fhT&hA:tfkSX-=PkcAGiATT&thHtkdSG-fPtGA=tAhT_t&4kdAfSSTPPPh=tAdTktfhtd-St-T?8Ph=kAd&Stth?d-f*Sd-hPfkSc-AhTPh?6=k?Ah-S?TG?fPAGTktckfThf--S?PG-==Ac&Atc?hd?f-SGh=Pc=Sc&&-TthA=Sk=Sk-A &GTcPAhtc?TKck=f&?1?tGPcQT=&&tA_cdTf&ShP?Gdc&&-&&tThtkCf9S=?kPAchcT&&ThB_ddk&SfP&GhGtcT&,ThhkdGkS-T-c?h=xcdAhTfhhC-dtfT-O?hGkcfAS&ht?9-kGfd-z?fdS=-ch&PtKh=d?chSS-TP?kPcG&kTcdf-Ak-S--PP?G=chAAt?;=IPkGfG--?cGf=&A--ttPVPd=fASA??PT=&kd&GtGhccAk&S?-tPP=UcTS?TAhSyTAtfh-=Pdcc??A&T&ttDTklfT-kGATf=TAt&hth)dkPff-tGdPhcdA(TGtkhAdSkTT?-hG_=dAS&fTth-dS==SQ?dPkkfcSAtT?thYGk-At-f?&G-f?APTdt=kk?cfS-???GP=GAt&ch-dGd?f=SP?kP==kcA&S?Th?dGkGS&-cP-G&cAA?TPh=(=c?fA--?TGP=hA&--tcLfd&A=St?GG+=Tf?&AtShTctkhS=?d=ctkc&&tTthhdJf?Sk?TdtGTAdAhTchdgckff&?R?t=ucx&STktTVSkhSPShPkGdchAf&&t-dtdcf_-S?kGS=SAT&?Thhhddf-Sf?GP-GtcP&*tGhkd-kSfT-?PAGGc-TfTft&Y-ASfP-d?=cktcAST&t?!TdGfkScP-=G=?Ah&PhSh=dkkASStTP?=tcGTkTch-W&kAf?-PPhG=fSAAT-tT,Pdhf&T-?cGf=&SP&ttG<6dTA?SA?SPTk&ch&=tdhc=hk&-S-tP&=Kc=&khAAPQTf?fh-TPd=kcfA&-kttd?kYfA-k?&GScdfc&htG{dAkffST?-GStcA1TftkGPdSktS??dPG=-kt&fT&h-=ckPSd-=P?kfcSAtT?ST!Gkkfc?-tGG-=hAPT-t=OkdAfc-G?PPh=GSt&ctSh&d?ktSAtSP==kcA?dTThPEhk&&--cPfG&SfAtTGhzdAtTfA-S?TGA=hAGTdtc=?d&f-St?GG{==AkTctShTd?fdST?dPc=fcckd--?tGSkA-f-APSGTcSvh--??Pf==Af&?TctddPfjStSf?T=PAk-dPSGd=cAf&cf=P-Gk==ATActhhTktff-=hcd?kcSf-&PfhTdrf-S?hSkdkSfT-??TT?dkfXfhfcP?=GAk&&AShk{&kGf=fT?T?fc-AfTthP=?ct&Ptuh=dkkAPT=TPG=GcG&dTchd?S=&A=&Gt&hcd=fdT?h-X?dhfGSh&khP{-f?fA?dPAdAfTSA?SPT=Sh=fd-&?TGecGch&PtAeScA&PTAhS%TkS=-&dt?hPc-&PT-ttzPdtGGAhtPT&dddh-3--PA=-f--A?-Pt=PctdP-fPdG>PAAPT=hf;Th-ffST?=Pck=Sc-=PkGAckfkfh-tPt=kA?T#TGhkco&dTBt=wkd=PhAT&hh=+dd&S?-^P?dPf-SP?BP==zd&f&S??PG=cfSd-cPfG&c-hPTPh_i=fSG=-S?tG?c-AGTdtcd-k=f--n?PGh==Ak&Ah?.Ad?fkSG?-Pc=fc&t-tkhPdfk=S--AP&GT&?TdTGhSFck?f&?%?tGPcSA=T-tA(GdTf?Sh?G=G=cA-&&t-htdAfuST?fPA=ScThAThh=ddf&Ah-&P&GtcA&8T=hkkAtPfT-T?hGhcd&kTf:&&Gdtft-FP*Gk=tASTf5khhdtfdPh?fPT=-A-&PtSPTdkkASS=kP?=EcGtd=Thfdfk-SS-PPtG=cGAfTShS6?f:fG-k?cGS=&A=-ktPl7d=SfSA?-PT=cff&GtdhcSGk&S?-t=P-fc=&=TAhcJTfSfhPG&+GcccA&T&ttdfk!SA?t?&GT=TAG&htGsddc&fS&?&PtcuAb&AtkHd>&kTST-h=9=dcA&fTTh-dkcASR-=PkcfcSAtT?hfG&kdfc-fcdG-=hAPh}c&gkkkfS-f??GT=GTdd=tfJfd-f-SP?-P=cS&P&-t?h?d8kGSd-cPfd&c-&-TPh=N=kSfA-cThG?c?AG.?tcRSd&f-St?AnS==Ak&Ad=hTdPkh?GkSPc=cc&&ATtR-djS=-=-APAGTcTAhTThdd&kPf&-t?tGGc2A=TktA6PdTfTShPdGd=&Aft&tPhtdtfx-,?kG-=STfT&Thhhdd-hSf-TP-=PcP&S-ThkVAkSPk-?PbGG&dPTTfhfW-kSfP-t?=ck=&A-TSt?3?dGffScGfGk=-A-&PtPh=d=kA-??cP?=PcG&-Tchf>&S--P-PPGG=ccAAT&tTk?f&fG-=?cGA=&AG&tQPdwd=fcSA?&PTcSchtGhAhcdAk&ST-tP==M&=T?TAh&#Tktfh-hPdGcAGA&T&ttVtkeSd-kGA=-=TAT&hth>dkPff-kPSPt=tAFh&tkh&dSktS??fh&=dcc&fnhh-0hkPSSTTPkGAcShkT?h0zGkd-k-S?TG-c-APTMt=Ckfff-ST??G-=GAd&ct=Shd-fsSP?GP==fcA&?TThc=fkGSd-cPAG&c?AtTP&dx=kkfA-??TG?=hAG?Stc)fd&f?St?PGvAhAk&AtShhkkkhSG?dPGT&kGSdSP?kGR=tchTdhq&?cG&cTGhd9ckd=S&&ThhTd& TSf-cPS==fG-=?GGd=cAddc-hP-=kc&AfTfhPBdchT&ThhGddkG=d&TtAhch-fd-f?TGP?hcT&PtfhShGkGdt?R?t==Ak-kPSGk=AAS&Af-?&=SG&APTThc;?d=fStk4-dkkASS-A&dt&RfdTfdSGPf?t=AAdA=GAc?AATStTnS=-c-T%?&Gh=&A-&tt-S==-ctAS&htTCAd&ft-Tfkd-fkS--tPPGthSf?-k?cPckPfh-GPdGccfA&T-tt_=k&f=-k?AGkhdkTfc-dP-PkcPA-t?tAddAk&htkhAdSkA&dTAtd,Atf&-tSh-OtkPftc-Th0?kMfPSTPsqckAfc-f?&Gft=fSSA?-P==mGd=A&?GdcfAd&ctfhc-tcc&f&=tS<kk,fd-fPkddfGSd-cPfGchTkP-d?&PcGTch&dAchAd/fSST-PPTdtSkSt?PGs=P4TfG?bS?=kcA&kTktSdRkGfkt,scdWk=Sk-=Ahtc2ddAkhS?PdPtGhc?&StthHd*k?fP-dPPfG-f?GGd=cAddT?0SPd=f=S=?kPA=khtf&-cPSPcc;ct&=PP=-cP&#T=h+-ScQA=AhTchGcfAhTft&R-d&GTA=Ttth=T&k&Tt?hhd?PAAfTPhitkd&f-ST?SGtPS&>T=PG=PcG&dTchd?S==cPTGTTHfdTAtT-thdddhfG-d?G&TN-fYSd-SP&Gf=AAhTGPhc)ch&GtdhGPkcfAhTdhk^GdkkTSGh?dkk?fh-G?hh=e&fdSkh4(tkMf=-k?=T&,?f0f&-tPTd&fcS&?-Pt=-htSy-??PGdcPSG?fPG=dcc&dk-PdGck=Sh-=PkGAckbASP?-PS?hcA&TtPWdt=kPSd-T?tdTSIST??Ph=?x)fP-hSPG-=hAA&&hfhhkd&?t-h?<hkGfhcPt=h-jhfkSS-&0Ak=fA-S?TGSd2f!fc-APT=PfP-G?PG2==Axd-STPdGcGfA=Trtc(hct&hTthPd)kPGATPh;TTdTffSS-tGSk-Sd--?tGP=tXffh-SP=dtf?Sh?G=P=cAf&&tPi?dPfpS=?*&G<cd?fU-f?-PTk&Sh-&P-Gtc-s=--?tPSGhcT&AT&htdThkT?tTpPfSfP-j?=GYt=k-Sf-kSTG=cA&-Th&Pg-dhfAS&-uGnP?AG&?hd9ccc&?TchfD&kf=S&Yt-h?cS&kTStT2?dTG?&GTtthv=khTWhLWOd=fkS=A-hfddkAfd-P?-G,ktS&-tPP=UcPdcSS?tPc=&AA-cPTGccfA&TffTPS=&GS&kT&hGr=fif&-t}fk-ffS&?-P&t*k&S-SA??GSckAfT-hS=fAd&fT&h-V&=GAG&ktf9-dhAhTAthXGkdfG=TT=ttdfA=Tct=,kdAfk=GtfhcdSkGfhfzScP-f6-f?wP==kc=ET-=PkPG=fAd&htBwkkdhPT=hAj=kkfA-k&-hTd{ktSTftPSGAc-&c?=GT==Ak&Atk-GGfcA=dTTh?8TdTkh-APfPTkAS&-APSGTcSp=Sd?-PtPPcT&STt4fckATTktAsSdAc&A&tPGfcFAf&&t-h&?kcS&4TGtG=?Af&?ThhGHhPhAc&Gtk>kc=&ST=hk8AkkGtTdAGGcAdAcTft&OfP?ca&ct-hf(?kGfcffPSG=cT&?Tzh?=-ct&PtphAPSkASS-TGGPdcG&fTchtI&k-ftPPPfG=c-AATStT7hdhfG?T?cG?=&A=&ttPj^d=SPSA??PT=?ch&&tdhtkck&S--tT?=Ccc&khASfBTkTfh-tPd=hcf&thdthdCkRS--k?AGS=TS?&hthHdkfffSt?-GSw=A}Txtk}?dSktS?-hPG=-kt&fT&h-d=kPSd-=P?shcSATT?:-wGkkfcPfAAG-c-APT?t=dPdAS??=?PGG=G&P&ctfh&d-AtSP?PP==AcA&?TTh&(PkGSG-cG=G&c?AtTGh{6Tc?fA-S?T=&=hA=TdKc-kd&f&St?TGmctAkTTrEhtdhkh-P?dPc=fc&--TthtdXfkSk-TPS=f=tAhThhdk>kffT--?hGPcSfTTktA8Sfff?-X?GG-dtAf&&t-ScdPfdS=Gkft=SAS&?t-hGd?kc?=fSP-=-cPTcT=hf:Af-fT-chfGGcdActTt&!?dtfATS?=Gk=A8/&TtPhhfGG_Sc?cP&=ActTctHh=dSkASA-TPGGhcc&dTc6kJ&kTft-PP4G=ck&AtttTwTdhS.-dPkGfA&&?&tthUFkifk-A?SGhckchTktdCPdfk&S--tPT=VAS&kT&hS>Tk?fhPWPd=kcf&PT-thoPSySc-kPfGScSA?tStGdfffff-??-Gc=PAp&=tk.SdSf-S??=PG=fcc&=Sth-d?kPPh-=PfGAcSATTcPf,Gkdfc=k?&G?=tTPdht=_cdAf-ST?cPhcc&T&AtTh&dhktSP?EP=kkcA&&TT_/_hkcSd?a?AG&cTAtXGhV*ckkf&-SPdOc=hAGTddA3fdTf-?NtfG^cdAkTktShTd?ShRA?dGk=fAS&-hvhPkkS-Sf?SPS=Pc?AhTGhdkkkSS?--?hGPc2A=TkPA%Sk-f?-=?GGf=c&fS&t-+-dPfkS=?cPAASh&&?tPhGdkkcSP-&GPcccG&cT=h&^AkSfT-?hhGGc=AcTTt&#PdtfT&k?=Gc=At&&TtPhhdGfdSttPP&=-cthht0hcdkkh&G-TP?Ght-&dTAhfdtcdft-hP{=vckAATSRT&=dhSa-dPkGfctA-t%IfKdkkfk--?SPT=?chtetkCSdfkTS--tPP=<f=&ktfhSdPk?Sd-GGdxccf&fT-h&1PkGf=-?thGS=TA?d=tG%kdc-f=A?-G?=PAP&=hPhAk?S=SP?=PGcPcc&fT&h-=tkPSG-=P&GAc?ATT&tPbGk=fc=&?&G?=tAGTatTG?dAfSSTchPh==Adtcfkh&dTktSt?7Gt=kATt(TtpoQhfPSd-cPfG&f-AtThhYdfkkfT-SPfhG=h&5TdfS:fdTf-St?PGSdTAk&AtSSPd?fKSG=d=k=fAf&-ThhPdfk=-kTAPS=Sc?&PTGhkLckP&>--?tGPhhA=TftAkS?&f?-??GGP=c&G&&hPdcdGf=S=?&PA=ScT&??hhGdGkcS&-&PPGtcTAGT=h=eAPhfT-P?hG=cdAt-Pt&O-dt=k-m?cGkAARf&TtThhdtfd-h?fGtAdchTQtI2TdkkASS-T,?Ghch&dtfhf*tk-SSShP6=ockd?TSttE?k4fG--ttGf=&A-k=tP(dd=-k=c?SGS=?A-&Gh?hck-SGS??PPP=?c=&kTAhS=Tk?S?-GPcGcc-A&TA?4YPkPf=Ad?AG-=TA?&ht&G-dcffS&&SPt=GAr&=?thAdAkTSP-hPG=dccTATThTFtkTSB-=PkGAA&AtThthV=kdfc-f?&?h=tAtT:hk6kd&fS-fA=Ph=cAd&htfhTd-f2SP?ShT=kcA&Stkh?d<kGSdtTPfG&c-AhTPh:U=kSP&-??TG?c-AUTdtAEfdhf-Sh?PGd==A?ShtShTd?fkSG?kPc=PfU&-TthPd?k=Sf-APchhc?AhTGhP/ckSf&--?tGAkSA=TktAncdTfPSh?&>-=cAf&&t&htdGf/S=h-PA=ScT&PThhGddf&Ah-&PPGtAA&{T=hkkAtPfT-G?hGccd&dTfhtkddhfc-zGPGk=AAS&TPchhdcfdS&?fPt=-AS&Atdh&dkkASS-tP?=dcG&d2Thf^&k-Se-PPYG=ckttTStT*?kkfG-d?ccftAA-TktP;_d=-kSAP?===PA-&GtPhcdfk&S-ttPP=Sc=&GTAh?LTk&Ad-GP-GctkA&T?ttiPk}fTT??AGS=Th-&ht=adk&chS&?cPtAcAy&=tkdA?fkTS&-hP&=d&A&fT&dGQtkTSx?0PkGAcSATTdth{Tkdfc-fPfG-ckfATzt=#k-GfSSt??=htPAdTStfhTd-StSPG{f&=kAP&St?h?k-kGSdtcPf=?c-&cTPhk,=kGff-SPPG?ATAGTktc6Sd&f=Tk?PGY==TU&At-hTdcAfSG?dPcTUc&&?TthPkGkcST-APPGTc?AhTG<=1Akhf&-t?tGPcJA=tct&dddTSQSh?GGd=c=T&&h3htkSfNSc?kGTP?cTTdThdAddkcSfP&G=GtAf&atkhkk&kSfT-G?h=Scd&PTft&B-dt-k-ePSGk=AASTct?EfkcfdSc?fAP=-ch&P2!SGdkfASS?&P?ckcGTfh?hSdtk-?S-PP1G=ckSATShT8?fdfG-f?cG=)tA-TttPkTd=ffSA?SPT=cff&GtdhcSBk&S?-tPAdSc=&kTAkh8TkPfhPG&OGcAfA&tSttdck/SA?t?&=?=T&?&htG3ddc&fS&P-Ptc=AD&Atkgd4&kT-?-hAf=dcA&fTTh-dkcAS6-=Pk&?cSAtT?Yh-PkdSc-fPAG-AdAPtk>-3fkTfSSh??Ph=GAd-ctf0&d-S>SP?kP==Gcf&StTh?SckGSk-cPSG&c=SkTPh<o=-TfA--?TG?APA=tdtcL?d&f-St?P=G=c&f&AhfhTd?khSGP=PAc-c&&hTthPdok=k&-AGSGTAGAhT=hddBP?f&?J?tctc)AcTktTnSkdAcSh?GGd&dAf&Tt-bS?cfUSt?k=f=Sct&?tdhGd-ctSf-&P-c?cP&dT=LSGPkSSk-?GAGGcdAchfO?V-kffP--?=GP=A&?T&t?1?dGS&Sc?fP&=-Ak&Pt-h=d=kAS?-T=?cdcG&?TchG;&S-ft?=GAG=c=AAhatTl?dh-G?c?cGc=&A&&tt&}ikAS&SA?TPTctch&Gtdhct=k&S&-tG4=rcA&khAd)KTkTfh-hPd=-cfT&hNttEtk{SF-kGdGS=TAA&htT:dkdffSt?-GS=GAR&ttkS=dSktS??,PG=-kt&fT&h--&kPSd-=P?9hcSATT?SAXGkkfc?-tGG-cfAPt&t=skdA-SS???GS=GA?&ctGh&kPS=SP?PP=cTcA&STTh?kPkGS?-cPcG&cPAtt=+kp=kGfAPy?TG?=hTGTctcR=d&fASt?&GYcA&z&At&hTktkhSG?dPc=cc&&ATthhdLkASkPAT?GTc&AhTthdd-kf-&P0?tGTclAhTk_d2SdTfcSh?TGd=hAfTkt-dtkAfoSt?kGI=S&T&?hdhcddfdSfP?P-GtcP&:t-hkdjkSSS-?PdGGcP??Tfhk5-PhfP-d?=GP=AAG-dt?hhdG=kSc?SP&A-hT&Pt?h=dPkA?S-TGGcAc=&=Tc+Gu&k-ft-P3(G=cGAAT&tT,Gdhft&f?cG==&d=&ttGM6d=fkShtGPT=?chk&tdhAdffB&=-tPP=}d?&kT&hSdf=Gfh-TPdhPcfATT-tt/PkSAT-k?AGS/cA?T:tGdf=?ff-f?-=k=PA}&=<kddd-fSS???PG=GccT-Tth-d?kPSh-=PkGAcS&WT?h?xGkffc--?&G-ASAPT?t=<=dAfSST=?Gc=GAP&ch=h&kckt-PPSP==GcAtdTThAyhktf=-cP=G&d-AtTGh>+ckkfhTG?TG?=hkGTdtA+fk*A=St?PG/TfAS&&tSIh=kkhSh?dGt=fc&&-htTPdNf4Sk?kPS=Sc?Tdthhddkkf-c--?tGPc<&=Tkhk7Sdhf?-d?G=f=TAfTSt-dkdPfIS=GkPT=SA-&?tPhGdGkc--?WP-=PcPTtT=hk.AkSSA-?PPGGcfAcT-t&k-tdfP-=?=Gk=A&c&T<&TPdGfcSc?dP&=?ct&ctghT=?kASS-TPSGhc=&dhcSk{&ktft-PP_c=ck&Th_ttdddhSc-d?cGf=&S-&th6_vkSfkST?SGfGtchTdtdPAdfkTS--hPP=SkT&kTAhSGtk?S4-GP-wtcfA&T-t&IPkdf=PkAcGScPA?TGtGkddcS-?G??Gc=P&k&=tkhAdSATS??=PG=Tcc&-T&hAGDkPSc-=PNGAc-ATT?thL&c-fc-f?&Gf=tAGTJ9=-ddAfhSTPzPhAGAdT&hhhTkkkt?&?pP==kcA-STTVdshf-Sd-&Pf=k=TAttkhg=-kkf&-S?tG?cff&Tdtc4fcGf-Sh?PGSdTAk&AtShAd?fOSGPfh?=fAG&-gdhPd>k=?kccPS=cc?&cTGdkQckf-h--PAGPctA=TktAISdGf?-A?GGd=c&d&&t=GkdPf8S=htPA=-cTt?ckhGkkkc-f-&GAGt&T=GT={f%A& fT-P?h=hcdAt-Pt&w-dtTf-m?cGkAA*f&ThPhhkGfd-f?fP&dPctTGt{hAdkkTSS?TGVGhA=&dhPhfdfk--t-GP =Ack&&TShty?fdST-dPtGfccA-&ttP!lkffk?6?SPt=?ch&Gtd)&dfftS-PfPP=dc=hkthhSdtk??d-GGcGcc=_hT-hcHPAdf=-f?AG?=TAc-ftGiddc&SS&??PtAPhh&=tthAdhkT??-hGccTcATdT&iS6tkPS;-=8kGAA.ATtSthJckdS*&-?&=d=tA-T*tc8kdAfS-dtcPh=GAd&GtfhTd-SD&f?}G?=k&t&STTh?khPPSd?GPf=Gc-ThTPh%k&kkS=-SP&G?=hAGTdt-Kfk=f-St?PGh==A?ShtShTd?dfSG?kPcAfhA&-h)hPkdk=---AG?c=cPTfTGdPjckff&--htGPAkA=t?tAK?dTf&SP?G=f=c?A&&t?htdGf_STt?PA=ScTPtThh=ddSc=k-&GPGtAG&Ut&hkdTSlft?c?h=GcdAcTft&=-dtS=-ePTGk=TASTfTthhkcfdxk?fPT=-ch&PtSPTdkkASSd-P?=ycGtdk=hfdtk-Sh-PGfG=ASTPT-*dB?kdfG-d?cGfk&A-t>tPdSd=fSSA?cP-=?&d&G==hcdSk&S?-tPAdSc=&kTAc&9TkPfh-&h-GccfA&A=tt9GkO-=d-?A=?=T&P&hhtbdSiYAS&PPPt-fAu&ctkdhdSfd&c-hPG=d??&fTTh-dkcAS.-=Pk?hcSAtT?4h-PkdS&-fPTG-cPAPTVGTakkTfSSh??Gd=G&dThtfLtd-SASP?GP=AkA &Sh,h?kdkG-k-cG-cSc-TfTPhty=kkfA-SPSG?A-AGTktcqfd&f-?A?P=f==&G&At-hTf?ffSGPSPcc-c&TGTtg=k&kc-P-A=cGTc?AhTGGdjcf?f&?c?tG=cuAh&ctAdPdThhSh?=Gd=AAfT0?=htdPf#dk?kP&=SAdScThhGddmkSf-TP-cth?&bt&hkddkS-T-?GdcSck&hTfQAM-dtfP-vh=GkctAStkt?sddGfPA&?fGh=-PT&Ptdh=dkkASGtdP?GhcG=KTchSm&k=&k-PP{G=P?AAT-tTdG=AfG?S?c=P=&A-&t2P&fd=S-SAPPPT=TchTchThAkPk&-S-tPP=oc=TcT&j=yTk&fh-GPdGcffA&tGttd&k/fA-k=A=&=T&=&hhtQdf=ff-&t-Ptc=AgTdtkWtdSfT&?-hGc=dcA&fthh-dkcAS{-=Pk?hcSAtT?9h-PkdST-fPtG-AdAPtkC-_ffYfS-T??Ph=GAd-ctfqhd-SfSP?kP==Gcf&Sh,h?hkkGSk-cPSG&c=SkTPh1_=L-fA--?Tc?ttAGtStcd-d&SGStP==&=c&P&At?hTd?khSGhdPcc?c&TcTth=d4khfc-AGPGTG=AhT=hd1AkfS4T=?tGPc>=&Tkt&DSkdAcSh?GGdPtAf&Tt-ktkhfV-A?k=T=S&?&?t-SAddfPSf1SP-GhcP&kT=h?GhkSfT-?dPGGckAchffAM-kAfP-&?=ck=A&?t=tP^tdGfTSc?fP&=-ft&PtTh=kdkAS?-TP&GPcG&tTcTh6&k?ft-GPNGTk?AATStThkdhf=-d?t}P=&A-&tt-wCdcfk-TtIPTcSchtAtdhcdfS&=S-tG?=rA?&kh&hSXTS=fh?PPd=ccfA&T-tt6kkoSP-k?AGScTA?Tf?&%ddcffSG?-Ph=PTqG&tk+tdSfhS?P-PGAPGk&fthh-_ckPSd-=G=GAcGSdT?th*GdTfc-S?&c-tTAPtft=dSdAfTST??md=G&S&ct-h&dPkt-PPfP=c-cAtdTThT5hSGSA-cGPG&AGAttGhxdAkcfA?c?T=S=hAGTdtcdAd&S&St?GG4==Ak&AtGhTkckh-h?dPA=fT&&hTt.cdoSASkPSPS=fh=Aht?hdhAkffT--PRGPcSfTTktABSCtf?-+?Gcdt=AfT-t-htdP-US=PS=P=-AG&?hdhGddkcSft&P-=PcP&AT=hSbAkcf--?PGGGc-AATSt&(?dtfATS?=Gk=AAG&ttPhhd&A-Sc?fP&?hch&Gt8d=?dkASt-TPhGh&G&dt&DhXTfdft?=PrG=ckAA?StTd6dhSS-d?&GfckkP&thdBuhfffS&?SPT=?AfS&tdhcdf+?S?-hPPA0hG&kt?hSdPk?-h-GGfc?cS&=T-df:Pk0f=-khAGScGA?T&tGsfdcf=At?-G==PGc&ctfhAdSkTSctfPG=dcc=TTTh?jtf=A&-=PtGA&PATT?thkGPUfc?}?&=+=tTGT.t=k-dASdSTPSPh=GAd&cTth&kdktSP?nGP=kchSGTTh?jh?hSk-APfc&hSAttGhrd=kkSt-SPhckcy&ATddYOfd&f-SthPGgccAkTttShhd?f-S:?dGA=f&h&?ThhPddk=S?ThPSGTc?tkT=hk%cSfGA--PhGPAUA=t-tAd?f=fP?k?G=d=cAf&&t-GtdPSdS=P-PA=?cT&&-dhGkkkc?d-TP?GtcP&DTTP?0AkSfTPSPuG=cdAt-Pt&n-dt-c-d?cGkAA9f&ThPhhkGfd-T?fGtAdchTct8hAdkkASS-Tb?GhA=&dtThfItk-SS&=PE=cckDkT-ttH?dhfG--ttGf=&A-d-tG4dd=-k5t?SGt=?Ah&GhPhcf=fDS-?hPPTPcc&fTAdG6Tkc&f-GPdGctcATT?ttkP?hf=?f?A=S=TAh&htGc-dcSSS&?PPt==AnT=hAhAk-kT?f-hPh=d&c&?T&7PxtfGS^?cPk=TAkATtcthd?kdfc-f?&=T=t&&TXtc!kdAfSST?TPhccAdThtfhTd-StSh?DGA=kA&&Sh>h?kdSSSk?tPfAkc-AtTPhM==kkST-SGdG?cdAGTPtkzfktf-Gd?GGd==Af&AtGGdd?khSG=SPA=Sc&&=?khPdyk=Pt-&P-GT&?rtTGFfXck=f&-=?t===-A=t?tAdfdTf?Sh?GG&=c&-&&h=htd=f5-=PhPAc-cT&tThscddScSA-&GPGtcT&uTThkdTkTfT?c?h=PcdAcTft&gcdtS=-ePTGk=TASTThkhhk=fdSA?fGt=-AkSAtHh=dkPkS--tP?chhP&dt&hfdTk--d-PGkc-cf&hTShT^?dhfG-dhcGfctA-tktP/kd=fGSf?SGh=?h-&=tkhcdSk&S=tkPP=Kc=}GT&h-rTS?Gt-GGfGcASA&tGttd=f&fc???AG?=TA?&htG=ddcS-S&P=Pt==A>&h-ShAk?kTGT? P==dcc&ftbP=qtkPSzczPfG&cStTttthd=kd-&-fG-G-cSycTJh-8kktf-St??Gd=GA-Sttfh&d-SdSG?dP=Akhc&St=h?dckG?d-cG-cGc?&&TPhh6=kkfA-ShTG?cAAGThtcm-d&fA&.?PG&==SS&&t-hTd?khS&t-Pc=fc&-PThhGdufAAt-AGdGT&=AhTGhdkcPkf&?f?t=fcqTcTktAkPdTSSShPPGd=cAf&&t+htkSf S=?kGc=SAdScThhGddAcSS-TP-cth?&6tAhkd&kS-U-?GdcSck&tTfdk3-dtfP-.h=GkcTAStdt?<ddGfPA&?fGt=-%P&Gtdh=dkkASGtdP?GhcGdcTAhS{&k=&k-PPvG=j?A&T-tTk??tfG?f?c=S=&&G&th=d&dcS?SAPSPT=?ch&GPdhck-k&-=-tP==xchfSTA^?>TG-S1-=PdGccf&a-=ttFPkL=G-f?&GScdfc&htGUdPtfSST?-=tt?ALTAtk_&dSS^S?Pd=S=kAt&fTth-utkPS+t=Pk=TcSTdT?hdxGkPc&-fPtG-ktAGTdt=0kdAfGTd??Ph=GSd&AtSh&f-hdSPPkP=cfcATcTTd&dfkG-f-c fGTc?AthAhDRTc?fA-S?Td?cLA=TdCc-kd&SPStPGGbckAk&AGGhTkGkhSc?dP&=fA&&?Tt0=dqS?Sk?fPScTcGAhtAhdd&kfST--Gn=?cH&tTkh=CSdTf?ShGdGdAjAf&Tt-htdPfI?f?kGt=S&f&?t<hGfdkhSf?hP-clcPTfT=8SkPk--k-?=-GGcdAcTfP&7-fdfP?-?=GS=AAc&-t?dkdGc-SA?SP&=?ct&A?Sh=dkkAAG-tPPGhc&S-Tchf0&cGfh-GP*c=hdAAtPtT;&dh-G-dP&=h=T&c&tH?gKd=fkSAhSPTc=chTTtdh&dffkAP-tGc=/kf&fT&hSRTk?SfT&PdGccff?T?th{PkSAT-k?AGSd&APTQtGdf=?ff-h?-=k=PAV&=QkAtdSS1S?PkPG=GccT-hGh?kkkPSh-=PkGAcST-TP%SaGkPfc-f?&G-ktAPtft=dPdAf?ST=?=P=G&S&ch=h&fSkt-Pt9P=cScA&&TT2=.hfG&d-cG-G&c?AttchggTc?fA-S?Td?caA=Td!c-kd&SGStP=G>c&AkTTxFhtkAkh-G?dPc=fc&--TtYcdmftSk-TPS=fdGAhtAhd=fkSfT--?tGPcSfTTktABSc?fP-g?GG-dtAf&&t-GTdGfdS=Gk&c=S&1&?hdhGkSkc--PGP?cfcP&kT=hkJAkS&T-?GkGGA?AcT-t&lAd?fP?f?=dd=&A-&TtPhhd&A-Sc?fP&kSch&GtHhT=?kASS-TX?=yc=&d<cvAn&fPftP=PNckck&dkPtTdfdhGA-k?AGf=tA-Tk?A3Nd=fk=t?-Pt=?&hdPtd4PdffPS-PtPPck&-&ftchSk&k?fh-GPddccf&=T-hT%Pkkf=-G?fGSccA??Pt=,kdcfSS&?=ak=PA_&=Pch&d-kTSctfPG=dcc=TTTh?vtf=A&-=G)GA&PATT?thkGPsfc?k?&=k=tTGTqt=k-dASfSTP?Ph=GAd&cTth&kfktSP?RG==kchSGTTh? h;)Sk-APfc&hSAttch%dAkkSt-SPhckcl&TTdd.Dfd&f-SthPG c&Akt(tShhd?f-Sq?dGT=f-=&?ThhPddk=S?ThPSGTc??&T=hk7cSfGA--GdGPAkA=t-tAd?f=fP?S?G=d=cAf&&t-GtdPSfS=PPPA=?cT&&-dhGkSkctA-TP?GtcP&wTTP?*AkSfThtP*G=cdAt-Pt&b-dttS-d?cGkAA_f&Th=hhkcfd-T?fGtAdchT&tbhAdkkASS-TJ?GhAA&dthhfntk-SS&=P^=&ck=fT-ttX?dhfG--ttGf=&A-c?tGidd=-kot?S=F=?&d&GhPhcf=lSS-PdPPSdcc&fTAdG,Tkc&f-GPdGc-SATT?tt,AcSf=-k?A-&=tAP&h1G-{dcS?S&PPPtc7AH&=G?hAkPkTSG-hPc=dAc&?T&xGwtSSSL?dPkcAA?ATtcthdAkdSA-fPtG?=t&TTJhPjkdAfSSTPtPhchAd&Atfh&d-ktSA?+GT=k&k&STth?khSdSd?tPf=hc-TdTP}kk-kf-d-S=fG?=hAGTdPc<ff;f-?S?PGk==AG&ftSddd?tTS=?kPc=Sc&&=?khPd+k=n#-&P-GTccSfTGhd>chHfT-??tcPthA=t?tA#cdT-?ShPc=T=A&=&&<ShtdPf7S=hkPAcGcTT&Thhcddf.A--&G=Gt?A&dTchk#AkSSdTc?hGGcdPtTStT -kkAA-o?=Gk?SA-&tt?dd=Sfd-t?f=>=-ct&Pb*A&dkfhSSPdP?=?cGTfh?hSkdk-ST-PP+G=ckTfT-!fu?k-fG-d?cGfk&A-tktPd?d=fSSA=S=-=?&f&GhPhcfkk&--TtPPcfc=&cTAYGsTf?Ah-GGSGccSA&t=tt;AcSf=-k?A-&=tAP&hHG-8dcSPS&PGPtccANTAhth&kckT-?-hPG=dcc-fT&L=^tfTS0-APk=d=&ATtcthThkkfA-f?TG-ckfATgt=pkhkf-St??=htPAdTttf6hd-SdSPPk=-=f&d&SThh?4hkGSdtcPfcIc-TSTPhkC=kGcT-SGdG?PPA=TktcQfd&f=Tk?PG ==Gc&&t-hTS?SPSGPSPcA-c&TtTthT?fk=-u-AddGtcPAhTchdatcPf&--?tkScdAcTkhTGadTS1ShGAGd=cAft&fShtkkfvS=?k=&=ScTt=Th2fddf?Sf-&P-Gtck&*tfhk6AkSS=-?Pf &cdAcTfhh8PdhfPPzAGGkccASTAt?dkdGSf???SGT=-TS&PtWh=dkAASS?&P?c+cG&fTch=Ptk-ST-P--GccfAATStTNccffG-d?c?G=TA?&ttAGSd=fkSA-SPt=PchtGf)hckkk&-f-tGc=KAATtT&L-xTf?fh-GPdGcffA&tSttdGkHfA-kPdh?=T&-&hTf kdAffS&?-GkdAAe&=tkt?d-ktS??fh&=dcc&f&&h?jhkP?ycGPk=ccS&AT?xk*Gff-?-SPTG-c#APTFt=_kcAfS-&??=_=GAf&ct=?td-fTSPPfPA=fcA&STThc=fkGSd-cG?Gtc?AthPAf)=fdfA?k?T=&=hTtT-tcdkd&SG-R?GGHATAk&h?GhTd?kh-A?fPA=f&&dSTtR?dnfPSk?SPSGTScAhtPhdD&kfft--Ptcfcm&GTkbGrSkSf??hPhGdccAfTAt-8hdPSk-t?kGT=SAA&?ThhGddSSSf?hP-GhcP&jT=hkkkkSST-?GkGGckAchfth9-ktfP-h?==-=A&?t=tPdddG-PSc?fP&=-ft&PhYh=kSkAS?-TP&9dcGTdTchAJtk?ft-PPrGTk?AATStTjtkdf=-dGcTk=&&-&ttToDdTfk-T-=PTcGchTPtdhcdfk&-c-tGP=WAA&kTThSdTkAfh?PPd=kcf&&T-Otd?kUS=-kPdGScdA?tdthqdk&ff-A?-Pt=PA3t-tkQAdSfhS??dPGcd&?&ftAh-(hkP-.-=P?9hcSATT?:keckkfcPfAAG-ctAPTht=d-dAS??=?P=d=G&d&ctfh&d-AtSPPRP=cScA&?TTh&QPkG-d-cG-Gtc?AtTGh1oTc?fA-S?T=GcdA=Tdwc-kd&S-StP-GXc&AkTT+:htkGkhSc?dPc=fc&--TtzPd5fASk-TPS=fdGAhtGhddTk-fT--?tGPcSfTTktAnSfwfG-x?GAdAkAfTAt-kidPS=S=?G&t=SAP&?Ath=dkkcS--&P=dkcP&gT=Td}&k-fT?GtAGGcAAch?t&B-dt-P=h?=GT=AAA&TwPhhdG-SSc?tP&cdct&PtDh=eTkASt-TP?GhAS&dTtPPL&k-ftPkPkGcck&A-StTdSdh---dPCGfck G&thdvgfffSS&?SPh=?AfS&tdhcdfS?SP-hPPAshG&kt-hSdSk?S&-GPdAdcf&?T-hsOPkdf=PkPAGScPA?TPtGkkdcff?-?-GG=PAk&=tShAdSSSS??=PG=Acc&fT&2fkckPSc-==PGTc-ATtHthB&c-fc-f?&ccclAGTQtTG?dAfSST=tGd==Adtcfkh&dhktST?1===kATtXTt}k7hSPSd-cPfG&f-Attdhod-kkfT-SPfPt=h&kTdd=:-dTf-Sh?PGSdTAk&AtSk&dGf.SGPfh?=fA?&-hkhPdQk=?kdtPS=Pc?&=TGhGacf--G-?P=GPchA=TktA#Sf-fP-A?GGP=cAf&&t-GtdPfcS=?tPA=?cTh?hPhGdAkc-=-&=SGtA=ckT=hTOASPfT-??hcGATAcTht&2Tdt-G-x?==?=A&q&ThfhhdGfdSc?PP&c>ct&Pt^K?dkkhST-TP?GhTt&fTAhfd&c-ft??P9c?ck&-TShf-=dhSf-d=hG-=TA-T%tPUS=TfkSA?SAk=GA/&GXdS=dff?S-??PP=Tc=&k-GhSdPk?Sd-GPkGccfSGT-h-_PkWf=-k?AGSX?A?TPtG,ddcffS&?-Ph=PA=&=tfhAdSkTS?PSPG=Gcc&&T&h?*tSPSG-=P=GAc?ATtfthgGfkfc-c?&GP=tAGTut=.fdAfSST?PPh=GAd&ctfh&d-ktSP?+P==kct&STTh?bhASSd-cPfG&c-AtTPh8tckkfA-S?tG?c!AGTdPTafd&f-Sh?PGH==Af&AtShTdGfcSG?dPc=dhGf?-=?kGP=hAG&GThW=c?AhTGhd+ck&f&--?tGPk&A=TktAQSdTf?Sh?thf=cAf&&tThtdGfrS=?kPhdGcT&?ThN!ddkASf-&udGtcP&+T=hkWAkS-Tc-?hGGcdAcTftTz-dtAS-,?=Gk=TAS&tt?hhfPfdSc?fP&=-ct&Ptw?PdkkASS-TP?GhcG&d?Thfn&k-fh-PP/G=cPAATStTEPdhfG-d?cGf=&A-&tt=E-d=fkSA?kTG>Pfdf-tf+fdfk&S--&&&h=kSfTSh?dGGcdSk-GPf=PcfA&T-t&?f=cck&Gt?h&X?fbf&-t?&=AffS&?-Pt=P&?&=tkhAdSf=S?-hPG=dcc&fT&k-kfkPS(-=PPGAc-ATT?nSEGkdfc-S?&G-=ttPTGt=jkdAf=ST?PPh=GAk&ctfh&dPktSP?7c==fcA&STThAXhk=Sd-cG?G&c-AtTPhyb=kkfAt8?TGP=hAATdtcqfk&AGSt?PG>=AAk&&tShTk?khSG?dPA=fc&&-TtD&d(kcSk-hPSGTc?&hT&hdgckfft--?hGPcjT?TktA(Sdhf?Sh?GGdc=Af&Tt-MfdPfJS=Pk=S=ScT&?tdhGdkkcSftGP-GtcP&)T=hk3A-S-S-P?hGGcSAcTPt&m-kdfP-5?=Gf=AAS&Td?dGdGfdSc??P&==ct&Ph&h=dkkAS?-TP?GhTG&?Tchf &kGft-APjG=AcAATStT0PdhfG-dPfGf=&A-TBh#mEd=fkS=AShcgAdGft-G?APhkt-k-tPP=YcPdh-??d-hcfASTx&=6dkkk=ShthTSt&,-dtfP-/A=h?Tdhf2ddcffScAPhAj&kGd=Sh?&Gf=T&k?dGP=dcc&fTcSfPh=Tc&cPtf9-dhf=kd-hP==-c?--?hG-=tAP&tf=PfdTfcST??Ph=?k=SS-SPk=df5-A?4P==kc=OhST-hGA=dc&T?t)X?&TfSSt?&fd=gAkTdtfhkckA=TdtcQfd&f-?S?PGs==Ak-PtShTd?khSG?dPc==dt&-TthPdSk=Sf-APSGTccSfTGhdxckPf&-??tGAkSA=TktA6AdTfPShPchT=cAf&&t&htdPfY-APtP&=-cT&tThhGddkc&V-&P-Gtc=&^TchksAA,fT-??hGGcdAcTfH&;-dtfP-_?=GkcmASThhwhhdcfdSA?fP&=-ct&Atjh=dkkTSS-hP?GhAh&dTAhfmTk-ft-PP?G&ckA&TSh&!?k/fG-k?cGPk.A-&ttP)hd=ffSA?GCd=?ch&GhfhcdSk&P-P?PP=Lc=&?TAhPOT-?-P-GPdGcc-A&Tttt}AcSf=-k?A===TAP&hhcPTdcfSS&?&Pt=PAITAhth&d?kTS&-hPG=dccSpT&h?Utk=SJ-cPkGAfPATT?thY=kdfc-fPcG-=tAPTddk-tcch?SkGtfATPAkTt=dSfh?cG-A-+AG=SAP&STTh?ITP-ccT-tSHkdSd=-fPdPTGhfT-c?TG?=hA?ktf?PS=d?h-W?tGB==Ak&=fG?tG&=&AdTAP&=Ac&&-Tth-?t=cAT&&Tt}ddf&dtkhdNckffcAdtThSsTkhkf?dPk=SfG-S?GGd=cAdkP-?G/GSfkSt?kPA=ScAdf--P-G?k&SG-&P-Gtc-dGST-AG&k-fT-??hGGcdAcTft&.Pk-fP-/?=GLt?ktfcShPAG-fkSc?fP&=-ct&PTwfGdSkhSS-TP?GTdtkt-=hfn&k-ft-PGTG=ckAATSP=Y?dhfG-d?cGf=&T-=dtP:4d=fkSA?cPT=&kd&Gtdhckhk&S?-tPP=DcTS?TAhS9TSkfh-=Pd=&dhA&T-tt_AkVf=-kGAAf=TA?&htGsdkGff-tPcPt=GA!T?tkhAdSfh-f-hPc=dA-&fT&h-k{f&S(-&PkGTcSATT?Cdkfkdft-fPPG-=tAPT{hf%kdAfS-d??Gd=G&f&&tfhTd-f-SP?YP=Ak?t&STth?dJkGSh-cG-Ghc?&iTPhdq=kkfA??PcG?ckAGTctcefd&---=?PGf==A-&AtPhTf?SGSG?SPc=?c&&cTthPkAk=Sf-APPGTcGAhTG)ceck-f&--?tGGc5&=TTtAv?dTftSh?GGd=cfh&&tGhtdGflS=?k=AA&cT&=ThhAddf?Sf-&PGGtc&&!TAhkgAkSfTPf?hGtcdAATft&F-dtSk-6P.Gk=TAS&Tt?hhfdfdST?fGf=-A*&P9pYtdkkhSS?9P?==cG&dtkhfd2k-S#-PPdG=ckStTStTW?kCfG-d?cG&=&A-&tt=v&d=fkSA?k&&!fkAdf-d?AGP=GAh&AtT=kA_&kTAhSQA?hAATSTch-dfAttktt%Pk_fPcdTGX2t?fkSA?kPkGSA &GTkG>=AA_&=tkh=-Tc=&k?dPh=dcc&fTc??G?=uAdTftTGTAfATT?thN??hcA&=TGTfChfdSA?-STGAc-&dTkGdcfAd&ctfhc-h=P&kTft?vtd-kT-d?cddfkSd-cPfGchafA-k?&Gu=PGGck&TGGcSAGTdtcmdPk=t&fTSGH==Ak&At-dhd?khSGGdfT=fcT&-TthPd=k=?GffPSGtc?t%TGhk{ckcf&-=hkGPc)A=hftAi-dT-?=t?GGk=cAf&&tAhtk=S&Sc?-PA=?cT&?ThhGcdkcSS-&PGGtc=&KTh?SbAk-fTPP?hG=cdAcTfh{G=dtfP-!GcGk=&AStTf-hhdcfdSA?fGk=-&OtftdhTdkkhSS-TP?GhfG&dT&hfdwk-S!-PP?hAckATTS^tH?k8fG-d?cGPkJA-&ttPkdd=ffSAGS&&=?Ad&Gtkhcd=k&-P%GPP=Sc=&?TAhSQTk?ST-GPfGccPA&TPttd=k&f=--?AG==TA?&h G^GdcfPS&?PPt=GAj&=h&hAdGkTSA-hPG=dccTGT&hGCtkPSC-tPkGhAhATT?thkPkdfA-fG&TS=tAhTMhsNkdtfS-hGkGpckAdTktfh&d-ktTP?_Gd=kA-&SThh?d-kwSd?kPfcPc-AhTPhdY=k?Ah-S?TG?AcAGTktc#Pcqf-St?P=h==Af&AtSG=d?fPSG?dPc=fc&&-?chPd=k=Sf-APSGTc?f&TGh=>ck-f&-??tGAkSA=TktAk-dTfPSh?tTS=cA?&&hchtdGfFSA?kPhdGcT&?ThgTddkASf-&VGGtcP&+TchkLAkSS--??hGGcf&dTft&U-d&GT&Pt-hfl=f-&hhkhhdGfdSGcht=d3d=Sd-dPdGt=&AATfPGc#cG&dTchd-tckAf&htA -6hkSSGd--AGGcP&PTPhh=tAc&ttP}odPAdAST-h==GA=&GtdhcddPGA?T=twhcdTkhSPd&ihk&fh-GPdGGhhkT-d?kPSkkSk-k?AGS=A6fS--d?AGtc7AGGTG}ckA.&=tkh=?h=tA-TStdhfTkdf-=-hztkPSR-=PfcScSATT?thk=kkfA-f?&G-=tAPh9hT.kd&fSSt??G9=GAdTftfhhd-ktSP?kP=&kcT&Steh?d-kGS=-cP==cc-AtTPhPU=kffA--?TGckfAGTdtcOcd&f?St?AjS==Ak&AtthTdPkh-cPTPA=Pc&&&TthPdBkhfc-APGGTAdAhT=hd_AkfSiT=?tGPcC&STkt&1Skh-k-)?&Gd=hAf&&t-d9fffdSt?kPt=ScT&?Th?TddktSf?lP-=fcPTW-=hk)tkSfh-?PfGGcdcSTftTu-kdfP-d?=Gk.=AS&Tt?MMdGfdSc?fbG=-ch&Ptdh=dkkASc&hP?=VcGT=TchSL&k-ft-AhSG=ckAAt&tT_PdhfGTT?cGS=&AP&ttP4Od=dfSA?-PT=Pch&=td1&Ghk&S?-tPA=Dc=&kTAT-3TkPfh-=PdGAcf&X-=tt:Pk/S=-k?&GS=TS=&htGQddAffS&?-Pt=PAR&=tkhAdSkTS???PG=dcc&f?Gh-vtkPSI-=PkGAccA-T?thHGk-fc-S?&G?=tAA-St=2kdAfGST?PPh=&f-&ctfh&dAktSG?:P=dtcA&STThP;hkGSd-c-SG&c-AtTGhxwckkfAtP?TG?=hA=Tdtc^fkff-St?PGkcfAk&AtShA?kcW&f&ctS*Pd=fdQ?h=d=k=Sk-APkTcd&kGSk?-PPGh?S-PPSGPc1A=T:SPP-==ccA&?cGG=cAf&&tf-SGtc&AcTXh&=?Ac&?ThhGjhG-Ah&=TtXk&hd Sc?tP-=AAT-GPcGGcdAcTdSPP?GTc&A=&AcctAfdfPtGCAdGfdSc?d&G%kk=fk-c?cGccPA-TSt&GhcG&dTchSk?k-ft-PP!chckA&TStTl?dhfGPdPtGf=TA-&htPHSd=fkSt?SGa=?ch&GtfhcSffGS-?dPP=fc=&GTAhcd?k?fh-GPAGccSA&T-ttWAcSf=-k?AGt=TAP&hhcdTdAfPS&?PPt=PA &h-ShAdGkT-l-hP==dcc&ft3P=BtkPSF?fPkG&cS&d-cthNGkdS--f?TG-AuTfTdtTbkd&fSST??=dASAk&htfVdd-ktSP?>&k=kch&Stdh?dSkG-dP.PfGhc-&-TPhSu=kk-r-S?tG?ckAGTktc:fkdf-St?PGd==Ak&AtSdGd?f_SG?kPc=fc&&Ah-hPddk=-?-AP-GTcPAhT&P-ackff&?=?tGGciAT-?tA>SdTSTSh?=Gd=cfh&&t?htd=f6S=?kPAP-cT&PThh=ddkASf?;h=GtcP&XhkhkU&kSfTtk?hG=cdATTft&4-dtdG- ?cGk=&AS&tt?hhcAfdSc?fPT=-ct&Ptkh=dkkAS--TP?GhcG&dTchf^&kPSG-PP G=c:q?SG?SPd=k=S&kThhV=&A-&ttP!7d&fkSA?SPTkkch&Gtdhcdfk&S-GtGh=.c=&kTThSotk?fhtAPdGccfATT-ttJPkPf=-k?AG?cPA?&htGhh??cS&P&ttG:AdTf-MchTdAkTS?-hP?tPkdfhST?fGhk=S&-=PkGAcks=Sf?cPf=AcA&AtGh?d-kTTkhSRkdAfSSA&dhq+Pk?ffS-kS?-cAAd?kGk=kcA&STASfG-=dcA&ttXhG&T&3t=hx3=kkf=c?tchAdPdMSG?=P4=?-T==TPt=WhkdfG-thhd&khSG?dPGthdTSd-k?Sd2k=Sk-AP-cPc?AhTGhdkAkSfT--?tGPc<A=hkQdYSdtf?-x?GGf=cAfTSt-YddPfzS=?SPA&Sct&?tkhGdGkcSP-&PA=ccP&)T=h=YAk-fT-P?hG&k-AcTft&u&dtfG-4?T.?=AAS&ThDhhd=fd-&PhPT==ct&&t_h=dkfdf&-TPcGhAf&dTAhf4Tk-SkTAP!G=ck&?TStt<?fd-S-k?tGf=TA-&ttPdkf-ff-(?SGf=?ch&GtdSfdff S-?kPP=-c=Tkt:hSdFk?Sk-GP-GccfT-T-th Pkff=-f?AGSctA?&htG1kdcffS&?-=A=PAd&=tfhAdSkTS&P?PG=kccTPT&h?1tkGS^-Th?GAcSATtcth+=kdftTP?&G-=t&tTatczkdA&HST?PPh=cAd&ctfh&h?ktSG?qPc=kc&&StdPc0hkGSdPfPfGTc-At?fhlBckkft-S?TG?=h==TdtAOfdTf-Sh?PG<k&Ak&AtShtd?khSG?=Pc=fc&&PtAhPdik=SuA-tdiddTkGSSfcG-=tc=Tdt=G=c=A=TktA!k=Gcf&AtShkdQkkSPtP>fdPf+S=?RhRhTk=f?tdp?ddkcSf-c&SLkdtkcSk????=Sc?&kt?OPd&A&TGt&2-dtf-&Kt?hdgGA?TSt?hhdGkh=GTctAtkkSfftkWfdkkASS-AToh&dtkTSP?TPT=AcT-cPMG=ckAATStTdddhfG-dP&SP=&A-&tt=7_d=fkSA?hPT=?ch&=tdh&dfS&SP-tPP=2c=&ktkhSfTfPfh-GPdGAcf&ST-tt#Tkmf=-k?AGS=TA?hhh?^ddcff-F?-G?=PAwt?tkhAdSkTS?-hPGcfAt&fTTh-ddkPS0-==kGhcSAtT?hiaGk?fc?fGPG-=tAPT?t=ufdAfSt%??Ph=GAk&ctfh&d-ktSP?oP==kcA&STthG5hkGSd-ctdG&c-AtTPh(_=kkfAtP?TG?=hA=TdtcUfkkf-St?PGk=TAk&AtShA?Pcc=d?fGS=fc&&-T&SS=BcdA?TkthhtdTf-TchP4ckff&-ft?hKddffSTtT4tdTf?Sh??*UddkTfh?LP?G^=AA??SGc=ScT&?TTSPPtc?Gh&=hrh=dSf?S--AGdcuAG-GPPGGcdAcTdfGPk==Af&ctj%f=AAS&Tt?hhkGfdSc?fGth=ct&Ptlh&dkkASS?h=kGhc=&dTthfM&k--t-hP^GcckA&TShkJ?dhf=-d?AGf=tA-&ttPJMkhfkSA?SPT=?Ad&Gt-#kdfk&S-?APP=dc=tkkchSdkk?Sf-GPkGcA-TGT?h-aPkkf=-k?AGSkTA?TStG/Gdcf-S&?AhY=PA-&=thhAd-kTS?-hP&d-cc&fT&9kptkGS>P=&dGAc=ATTcthItkdfcT9?&Gc=tA=TptcYkkdGPST??Ph=tAd&Atfhtd-fk&A?jP==kAd&STth?EhAASd-cPfGTc-AtTPh-i=kkfA-?PkG?=hAG&h-h?&=Gc--!?hG(==Ak&=Sk?t=dc+AkT-tP=Sc&&-TthPdrk==A=AP?=Sc?AhTGthGSG&Ak&dt-h&cdA=TktAqSdTf?fhcPGd=cAf&&t-d2dPf;S=?kIP=ScT&?ThhGddkc?fdhP-GtcP&zT=hSVAkcch-??hGGAkAcTSt&L-dtfATS?=Gk=A&-&TtPhhkccTSc?fP&=?ct&Ptvd=S=kASS-TP?Ghc&&dt&hT{&k?ft-&PuG=ck&TtctT:GdhfA-d?cGf=&&d&ttPXEdAfkST?SPTArch&=tdhAdfk&S-?SPc=Bc=&ktchSxtk?S>-GP-YtcfA&T-hT_Pkdf=-khPGS=tA?TdtGeddcffkT?-Ph=PAd&=tfhAdGAdS?-hPGckcc&ST&h-=ckPSd-=P-GAcSATT?T<gGkkfc-S?&G?=tAP?ft=wkdAf-ST??PhcSAd&ctfhtkSktSP?aPPTTdAkT-P-hPccSctTSA&hGddkASfhkdckkfA-S?AT?d&kTfc?vPcGTcdcGTthPd-lcfS-tP=d=fpSc?GPc=fc&&fSh?hP==cA&T?P?=Gc?AhTGth-==#AGcTtkh+kdk?S&??4?kkf?Sh?GPhh=d&fT?d3Edcf.S=?kP=Tth&&GtShGddkcSdcTtAh&dt&ktfhkLAkSfAcdThhddAkfft?GPk=Gf=-G?=Gk=AAkkA-PPcG==AAtTQPtcSct&PtLhP?_=&Ac&=&Sx kkf&-?ftP&=?Ak&fPk=8ckAATStAShGcAS&ktGh.=&A-&ttP^bS-fkSA?SGh=Pch&Gtdhtdfk&S--tG-=Bcc&kTAhSLTk?-h?hPdGAcfATT-hfYPk/SP-k?&GS=hA?&htGjdfkffS&?-Pt=PAk&=t?d-dSkTS?GGPG=kcc&f?Gh-dfkPSd-=PkGAccT=T?hfDGSPfc-S?&Gc=tAA-St=6kdA-cST?PPhAGPS&ctGh&d=kt-s?iPhGccA&=TT6-Jhk=Sd-APf=lk=AtTPh*dGkkf&-SGTS==hATTdtt}fdTf-?tA?GC=tAkTqtS5fd?khT&?dPh=fct&-tnhPd?kdSk?CPS=hc?&FTGhk)ckP&w--?tGPAkA=TftAYGcdf?Sh?Gcc=cAS&&M-STdPf?S=?PPA=hcTTGhAh=d=kcS--&P-GtcP->T=hG+Ak&fT-G?hGt==AcT=t&dTdtfG-8?cGk=hfG&Tt?hhfCfdSA?fGLd=ct&PtUkkdkk&SSPT&-Ghch&dtHhfdPk--oPfPd=kck&fTStTw?dh&G-dPdGfc-A-T>tPR?GAfk-k?Sc?=?A%&GtdhcdPA{S--tPPA=c=&fTAdS-&k?SP-GPGGcctA&tPRc;Gkcf=-=?AGS=TA?-htGl=dcfTS&?PPt=TcG&=tchAfPkTSP-hP==dctSPT&h-BtScS!-cPkGhkGATT?thfdkdfA-f=&=T=tAhT)h-vkdtfSPTPtPhczAdTStfhhd-fk&A?lP==kTS&STth?JhASSd-hPfGTc-AtTPh?dSkffh-S=?G?cBAGT?tc4Pcuf-St?Pc===Af&Atc-<d?khSG?PPc=Sc&&PTthA=Sk=Sk-APcGTcPAhTGGS_ckff&-??tGPcj&dTktAqSdhfhSh?GGd=GKfS=-c?PGTcPAc&tPt=Sch&=ThhGddkG=f&TPPckcP&IT=h4-?=Sc?TkTGhfdTkPSTdSPA=-AfPGTPh=dGkcf=tG/-dGfdSc?dhS{hdhfT-&hAdTkASS-TPStdk-f?-kSfP==?cT&Pt&GAchAATStTISP&AfAtA&UQddkTk?-tPhG?c&STPfPT=?ch&?kh?AG==G=f&hhd%Ak-!TSA?-Gd=kfh-GPdGccfTdT-ttYPka&--k?AGS=TA?&htG7PdkffS&?-GS=PAd&=tfhAdGAdS?-hPG=Pcc&ST&.PGckPSb-=PPGAcSATtG{Al=kkfc-P?&G-=tAPSTt=HkdAf?ST?PPh=GfT&ctfh&d-ktSP?m==ThcA&STTh?vhf.Sd?&PcG&cPAtTGh5z=kkfA-P?TG?=hAcTdt&7fd&ScSt?GGx=cAk&AtSXfk=khS=?dGA=fcT&-TthPdScTSk-APS=tc?&rTGhd=?kffT--PWGPcJA=tk?AsSdTf?--?GGk=ctftSt-htdPfPS=?SPA=Gfd&?ThhGk-kcSS-&GPJccP&dT=hP}AkSfT?GGAG=cfAcT?t&,-dtfP&T?=Gf=AA?&TtPhhdG&SSc?fP&=?ct&Pt1zddkkASS-hP&GhcG&dTGShPTcdAk&SPk=SckAATStASh=-AS&k=kTtdGkkfP-A:kdtfkSA?SPAd-dGf=-Th&dhk&S--tP-T&d?fTS??tPt=tAA&=tG_6c-&fT-ttHPdtGh&=tPh-EAfPTdhf%ddcffSc&oth,?k-fkSSkf?SccA5?dGd=dcc&fTcSkGS=#cc&TThhP&&Aht0theGkdfG=hTTCjrPkdSS-??tSffSST??Ph==&A&ctfh&d--SSP?dP==kcA&STTd?kckGSk-cPSG&ccAtTPhk.=k-fA-S?TGG=htGt&tcs?d&f?St?TGg=h&k&AtShTk>khS=?dPc=fAuS=TthPdRffSk-&PS=h&k&eT&hdddkff&--PSh=c,ATTkh-mSdtf?Sh?GG-dtAf&&t-oGdPfdS=??hh=ScT&?tchGdkkc--PGP?=kcP&GT=hksAf?-=-PPSGGcfAcTft&3-=ffP-S?=G?=AA=&Th?PhdGfSSc?PP&==ct&P&ch=dfkASP-TPPGhcGkhTchf*&k?ft-PPWG=ktAAT-tTqPdhfG-dPXPA=&A?&thAb5dcfkS&?SGddcch&GtdHtdfkTS-?khA=Qc=&khShSqtk?fhtSPdGAcfAtT-ttrPk0dc-k?&GS=tA?T,tGdf=?ffST?-Gd=PAF&=tkT&dSktS??BPG=kcc&P?9h-ptkP-u-=PfGAcS-zT?thWGkkfc-f?&=f=tAPTOtAq=dAfSST?S&cdkdtff-h?=dPfcSP?bP==vhGkT-G?PG-=P=&T?hSpKdkAhTPh2(=kkfA-S?TG?c}&kcGGTPf-=fhfTc?Gk=TAk&AtShAG&=&&P?fPh=fc&&-T&SSG?c?AP-&=Tt=f-Gd&Td=&??kft-&?tGPc%APk?-&PcGc=h&=?cGA=cAf&&tf-c=?=TA?TG&&%cdAfTtdhTddkcSf-cTVhhk=kTTchkaAkSfT-??hPGt9A&TGt&_-dtf-cGTTtAd&A?Tft?hhdGkhcPchtTbctG&=tGh=dkkASkAAtPYcd=kASt?.o&k-ft-PPDc?ckAATStT=kdhfG-d?cGf=&A-ttcc64d=fkSA?SGA=?A-fctdhcdfSGS--hPP=}c=&?-hhS2Tk?-A-GPkGcA-fGT-tt^PkTf=-k?AcS&&A?&htGsddcfGS&PP=f=PAd&=tThAdSkT-G?SPG=fcc&?T&h-ztf=SS-=P-GAcGATT?thdcftfc-P?&GG=tAPTgt=dkdAfSST?cPh=cAdT&hhh&d?kt-O?zP==k&AGPTThP<hk=Sd-hPf=tcGAhT=h_d5kkfA-SPhc/=hAATdh/>fd&f-?t?=GE=&Ak&ttShhd?Sh?k?dPT=fch&-t?hPd4ftSk-&PS=#c?&dTGhdkkkfft--?tGPcdA=tkh-4Sdhf?-=?GGd=cAf-Gt-zddPfdS=?kPAAST-&?tkhGdSkcSS-&P-=PcP&-T=hSlAkSfT-?P_GGcPAcTSt&C-dtfP-c?=G==AA?&Tt?hhdGS?Sc??P&=&ct&=tvd=ktkASG-TP=GhAS&dTcdOV&k=ft-=P)GcckAA?PtT#?dhf=-d?cGfcSA-&ttPlkkTfkSA?SPAt-k=f-ScP?fA?-PT=?cSAGT=tcSA?AGd=k?PG=Pf=ScfA&T-t&-f=dASAAT-hGXckkhPtcsTdcffS&?f&c;SkAfS-&?&G&c=APT?tt=fA-&fT&h-!&GkAd&GtPhSx?t-k??&Pkkffh-f?&G-=&f?f=-cPtdTfAST??Ph=?RPSd-h?TGfchS=?=P==kcA&kkc?&PG=kA-&PThAScP&STPhjz=kX=P&-t=hc.&AGTdtcyfdTSTSt?PG!==TG&At-hTd?khSG?d=ccfc&&?TthGdpkhSk-AP&GTc=AhTGhdU&kf?&P}?tGcc4&dTkthJSkfShSh?GGdcfAf&Tt-htdPfS&T?kPA=SA?&?tOhGkfS?SS?zP-=-cP&)T=hG.fkSSd-?P=GGckAcTSt&m=ckfP-3?=G&=AA-&ThGdAd=f-Sc?-P&=-ctT=h&hcdPkAS--TP?GhcGf?TchPr&k=ft-&Pl==kkAATPtT)=dhf&-d?c?T=&A?&ttcaudcfkSATkPT=?ch&=tdhcdfk&Td-tPG=Ccc&kTAhSdf=Gfh-=PdcdcfATT-ttuPkSAT-k?AGSASA?TCtGOdc?ffST?-Gm=PAo&=tkT&dSktS??MPG=kccT--Gh-HhkPS--=PkGAcS=tT?h^aGkkfc-S?&G=kkAPTQt=dddAf-ST??dk=GAd&ctSh&d-ktSt?gP==kcTTGTTh?Fhk?=A&ft=hGd&ffhhSAP===APP&=TctdAkdS=dkfSdtSdSt?PG7=PhtfG-h?G=Qc,&*TTtAFckk&Pt=hPd0k=SuA?t-h&dAkGfcd=-cc/c?-PP-GPcsA=T,SdPA==cPATt=Gfc8Af&&t-h&Pfcd&-T?tG=?A?&?ThhGEhPPA=&-Th4kdSk&zdhSd-kSfT-??TTSdkf-f&-?P=GAcfPG?=Gk=AAS&thPhhdGfdScGSPT=?ct&Ptyh=dkSAS?-TPPGhc=&dTthfl&k?ft-cP%G=ckATTSdTEtdhfA-d?hGf=hA-TShhLqd=fk-k?SPt=?A5&Gt-Ptdfk&S-?-PP=dc=&?-hhSMTk?S=-GPkGcA-TGT?hknPk?f=-k?AGc=-A?TftGl&dcfSS&??Pt=AfS&=tkhAdhkTSP-hGccTcA&PT&h&BtkPSg?AGtG&c=ATTPth1Gkdfcdh?&G==tAAT/ttpkkASkST?=Ph=cAd&ttfh&dTktSG?sP&=kc&&STTiA7hkGSd-APfG&c-Ath2hy_=kkf&-S?TG?c?AGTdtc -kGf-St?PPtt-dhS?ShPPGPcP&STkhd7=ct&tTthPdakPGhTdTThPdck&SSd=V&k=f&--?tG-h&kcSt-hPddhfTSh?GGd=G(=Sf?d?hG-AdSA?&PA=ScT&SkA?=G&=fcTT8tkhc&h&ktShkmAkSfAAdtahPd?kff-dS--=Acd-kPtGk=AAS&Aft?&=k=hAP&thGATtPhhdGk?fc-A?&T=ThpPTOhkTchf4&k-fh?GPzG=ckAAhctT>PdhfG-d?cGfA&AT&ttGUsdcfkSh?SPTcGch&AtdhcdfktS-Gt=f=:c&&kTthSdfk?S-?hPdGccf&?T-th{Pk#f=-?thGS=TA?T=tGwkdcS-?G??Gk=PAk&=tkhAdc=hS??fPG=Acc&ST&h-OtkA&S-=PkGActATTPthb&c-fc-f?&=1=tAGTVhAdtd&fGST?APh=GAdT&hhhTdcktSt?wP==kcA=jTThc;hk&Sd-hPf=&ccAtTchmIckkfh-S?T=?=hA=TdtT0fdTf-StPPGM==Ak&&tShTd?khS&?dPc=fcT&-TthPdGk=Sk-AP?=Gc?AhTGth?-=ScA&cTPt=&G1=Sh--Q?kPf?Sh?GPht?kSSPSt?GGA=TA-GcPTcccT&?Thh??==PAT&ctkh=kftGdkkcSf-d?-G?=PhGdGktfhdSf?k}fT-U?=Gk==duft?kPfG-ff-d?fP&=-c&dT-PP-Gf==&--hGkGhcG&dTGfhP=cwc=TdtdWddtk&SA?f/GkSfG-d?cGddAdtfh?f!kkkfkSA?SPAtfk-fdSA?tG1=G?T-tPP=Cc=&fh?hSxTk?fhP=PkGAcfA&T-tt9PS^fc-k?&GS=tA?TStGDddhffSh?-Pt=PAk&=dkdkdSf:S??fPG=kcc&=t-h-8tkPSP-=PfGAc-ATTcPfjGkdfc-c?&G?=tAA-St=.kdAfhST?PPhcc&T&AtPh&dTktSP?zPhxScA&GTTud}hk=Sd-cPf=Bk=AtTPhQdSkkf&-SPd:c=hAGTdh?QfdTf-?wGfGd=TAk&TtShTd?Sd?S?kPh=fch&-TthPdx=tSk-hPS=dc?&STG)dGckffh--PSGPcSA=TkT-NSdtf?-k?GGk=cAffct-htdPfdS=?kPA=Sf=&?t>hGdkkcSf-&PAG?cP&dT=sPKAk-fT-P?hG&k-AcTft&dcdtfG-U?TD?=AAS&TYbhhd=fdScthP&=?ct&=tlh=dkkAk--TPPGhc=&dTAhfdtcdft-GPw=UckAATStTtPdhf=-d?AGf=TA-Tk?A6qd=fk-&?SPt=?ch-AtdhcdfkTS--tPP=qc=&kTAhS#Tk?fh-GP&GccfA&T-f2{Pk>f=-k?AGS=TA?TktGLddcfSS&??Pt=PAT&=tkhAd-kTS?-hPGcdcc&fT&h?atkGS}-=GtGAcSATTGth9Gkdfc-h?&G-=tAGTJtcCkdASfST??Ph=AAd&ctfh&dtktSP?zPc=kc&&STT(kJhkGSd-tPfG&c-AttGhr4=kkf&-S?tG?=hSATdtcofdTf-St?PG_TkA-&AtSlhcmkhSG?dPt=fc&&-h<h=dakcSkGGPSGTc?AhtGhd!ckfft--?hGPAkA&TktA3SPkf?Sh?Gcd=AAf&&t-htdP?=S=PSGt=Sch&?tkhGddkcSf-tP-GtcP&kT=hSJAf?A=-?PoGGh?AcTft&k-dPfP-d?=Gf=AtT&ThG0PdGfSScPSP&=-ct&PhGh=dfkASP-TPGGhAcTkTch-E&Pcft-PP_c=cPAAT?tT0GdhPd-dP&GP=&A=&th?%*d=fkSAPGPT=Gch&&tdh&dfft&d-tPc=lht&kTAhSkTdhfh-APdGTcfh-T-4_d&k%ft-k=nGS=TA?&hh5OddTff-d?-GD=P&kTGtkhhdSGkS?-hPGAdAh&ft2h-dkkPP=-=GS=?cS&fT?=P,Gkdfc-fG-G-ckAPT?t=KSdAS?&=??GS=Gs?&ctfh&f-kPSP?-P==PcAhTTTVGddkGSG-cAAG&c-AtTPh&y=kPfA-A?TGG=h&ctStcM=d&GcSt?PG3A=AA&AtchTd&khGd?dG&=Ac&&TTt=&dgk=Sk-APTGTc&Ahtahd1&kfSt-A?tGtcQutTktAVSfT-dSh?hGdcdAfi-t-d(kAfq-k?kcf=ScT&?Th;hddfdSf?-P-=gcPtVhShkdfkSft-?TGGGAfTPTfh-O-PffP-}?=ck=SAST?t?qGdG?cScP-=?=-A=&Pffh=dkkASS?fP?=GcG&&Tch-8&fPST-PPcG=hPAATStTk?fdfG-A?cGT=&tt&th=dfd=ftSA==PT=?ch&GtGhcdTk&-d-tP==(&=G-TAhh(TkPfh&dPdcc??A&tdttdkk5c^-kPdP&=T&k&hdA*ddAffST?-GkdAAn&=tkktdSktS?PhfA=dA?&ftPh-?SkP?VcGPk=PcS&=T??heGkd&t-fPGG-crAPTkt=kk?cfS-c??GA=Gkh&ch-Vcd?fTSP=dP==kcA&Shdh?d&kG-b-cP-G&&-TkTPht:=ktfAAh?T=Gc+AGtdtc?md&f-St?PG===&v&AhShTdGkh?GkGPcckc&&TTtkkdxS=SG-AGfGTA-AhPthdkckhf&?S?t=?cLkGTk,Aw-dTS?ShPbGd&-Aft&tchtkPf;-=?kkd=S&TtkThzGddfcSf&AP-ctAA&Dt=hkdAkS&k-?GhShcd&ATfhdF-SPfPP_P?Gkc&ASTtt?f-dG-dS&?fGT=-Ah&PP=h=fkf&SS?tP?c>cGTdTcdfddk-Sh-PGdG=A-AAhSXQ%?f{fG?k?c5==&T-tGtPdkd=fPSAGTPTA?dt&Ghfhck-k&PA-t=Pc-c=TSTAw?(TAhfhPGG=GcA-A&tPttdPkW-=-P?A=?=T&G&hhAIdfcSdS&PPPtc=A}SktkhAd-kT-=-hPG=dcc&fT&dk9tfAS,-=PkGAcSAThdthdTkdfc-f?&G-=tAtTrhh>kdAfSST??PhcfAdtdtfh&d-ktSP?VGS=k&f&STTh?*hkG-fP?PSc-c-d-TPhiK=fS-P--GPG?h?AGTdtcpflff-?=?PG3==Ak&Ah?d-d?SASG=TPc=fc&&-hGhPkTk=Sk-APSGTc?&_TGFh.ckff&--?tGPA-A=hdtA8SdTf?Sh?GGT=cTf&&t-htdPfHS=??PAA-cT&?ThhGddkcSt-&=PGtcP&MT=hkdTG-fTP=?h&ScdAcTft&+cdt-A-q?=Gk=AAS&ThfhhfTfdSc?fP&=-&WT&tedhdkP&SS-TP?GhAS&dEdhfffk-ft-PP>c,cktfTStT+?dhfG-d?AGf&-A-hPtPind=fkSk?ScP=?ch&Gtdhcdff&S-G=PP=sc=&kTAhSddk??A-GPdGccfA&tPhTJPSTf=?t?AGS=T&GT-tGkhdcGtS&?-Pt=P&?&=ddhASkkTPf-hPG=AcchfT&h-utkPSq?APcGAT-ATdkthsGkd-c-??&AP=tAGT>-kIkfAS?ST==Ph&cAdfdtfikHTktPc?^tA=kc&&STth?dfc&Sd-cPfhtc-AhTPdp&&kk?t-S=hG?h-AGhdf=_fShf-Gd?P87==Ak-htSf4d?fdSG?fPcAfhA&-dkhPSfk=Pz-AG?c?c?h-TGStKckff&--PfGPTSA=*GtA<?dTSG-G?GA?=c)G&&t-htfPfPS==PPA&=cTTPThdGk?kcP=-&cGGtdk&_tA^dYA-&fTAf?hGGcdActtt&fAdt?h-E?AGkAA&3&TdThhSAfdA-?fGt=?ctj4tBkcdkkASS-TP=GhTh&ddfhfBtk--tc?P3&dckttTS-Go?fdS?-kcSGf&TA-&ttP9QkhfkGf?SAP=?Ad&GWd<fdf?-S-=dPP;tc=TSh-hSSGk??=-GPdGccf&TT-kP2P-Af=-S?AcSTPA?8=tGfSdcAdS&PP=d=Pt&&=d-hAdSkTS??dPG&AcchhT&hP!tSP-d-=cTGATPAT-Sthdcf)fc=6?&hG=tAPTMt=dIdA?hSTcfPh=cAdT&hSh&-dkt&t?_P==k&AGPTTfkQh?SSd2dPfG&ccAtdSh1fckkfA-S?Tcz=hh?TddA8fd&f-StP?G8TGAkh&tShTd?kh-=?dA?=ftA&-tzhPkkf?Sk=GPSdSc?AhTGdd6hkfP=--cAGPSPA=tSt&*S-Af?P&?GGd=c&-tGt?fTdP&nS=?kPAc?h-&?dhhGftkcSf-&P-=GcPhTT=fkKAk?fT?GPkGGThAc-ct&K-dt-P--?=&6=Ahk&TGThhkcSSScckP&&kct&Pt+7AdtkAGS-TckGhcG&dt&1t_&??ftGSP_G=ckAA?StTSSdhP=-d?&GfctcK&tk?LUc9fkSA?S=T=hchlPtdf=dfTfS-PBG?=et=&k5GhSgTk?-dPkPd&Acff=T-ttQPfkS8-kcTGS&cA?&htG6ddTffGA?-&!=PAk&=hShhdS?TS?G&PG=dccT-hGh?ShkP==-=PkGAcS-ST?fd9Gkdfc-S?&G-AAAPdft=ikdAfSSTP?G==Ghf&ckhh&-GktSPP?P=T-cACPTTh?1hkGS?-cAPG&c-AtTPh0l=f?fA==?TG?=hAGTdtcdSd&PASt?PG_==AkTdtGht-Tkh-k?dPA=fct&-TtkcdLk=Sk=TPSGTc?AhKAhdNckfGk--?tGPckTfTfffwSSSf?Sh?GGfASASd-t-l&dPf2S=?GPh=-hP&?dfhGdkkcSS-&P-&dcP&#T=fAxAkSfT-&PfG=t&ActSt&#?dtfT-l?=A-=AAS&TkchhdGfdSc=?P&=-ct1ctMh=dkkAPP-TP?GhtT&dTchf &-Gft-PPoTdckAATStTf=dhfG-dAqGf=&A-&tdc;ad=fk=-?SPT=?A-&&tkS?df-tS--hPP=?c=&kgthS+Tk?Gf-GPdGccfthT-ttzP?ff=-k?AGSTwA?&htGS?dcffS&?-Ad=PA2&=kGhAdSkTS?=kPG=dcc(TT&h-<tkPPf-=PkGAt&ATT?thdcSkfcc:?&Tc=tAPT+V=dhdAGdSTAfPhTdAdT&Qah&?SktSc?QP==kcATGTTSf!hPPSd-&Pfc&cAAtkSh6-?kkTt-SGTGh=h^-TdfP7ffPf-StPGGltGAkdPtShTd?khfk?d&P=fhA&-ThhPd?kTSfcGPScfc?&0TGhk*ckf?h--?tGPctA=TktAackdfP=T?Gch=cAS&&t?htdP?fS=?kPAc?cT&?Thhtd-kA=k-&c*GtcG&iT&hk%A-PfT-??hAtcdAcTft&fGdtfP-)crGk=AAS&Td=hhdGfdP=?fP&=-AS&AtdS=dkP2SS-tP?=kcG&dmThfm&k-Pd-PP7G=ckttTStTR?fPfG-d?cGf&hA-&ttPk?d=fkSA?cGd=P;o&Gd=hcdSk&SP-tPP&fc=&kTAkPsTk?fh-GcSGccfA&tTtt_Pkofh-??&T?=TAh&ht=.ddtffS&=GPt=PALhktkhAdSkTP=-hPG=dcc&fT&h-It-cS^-=PkAfcSATT?thfAkdfc-fAAG-=tAPT?tT%f?tfSGf??Gr=GAk&ctfkhd-ktSPG=P==kcA&?hPhP?fkGS=-cPfG&cA&kTGS-I=?kfA--?TGP=hAGvStcEfd&fGSt?PG2=A&&&&fchTSPkhSG?dP&cTcTd&Tth=dWk=Sk-TGtGthtAhdchdOckfSk-=?ht.c:{-Tkt&;Skkf?Sh=AGd=cAfkqt-htdPf9P&?kPA=S k&?ThhGdd-TSf-&P-tScP&ET=hkftkSfT-?&PGGcdAcTfdhI-dtfPcP?=Gk=AAcTdtP-=dGfPSc?SP&=?ct&Pdfh=dkkAS=-TP?GhccTATAStK&-Gft-PPzGhc?A&f*tTdhdhf=-dP+Gf=&tG&ttPULfSfkSA?SPT&=ch&Gtd--dfk&S--tcc=Cc=&kdAhSeTk?fhGAPdGccfhTT-ttWPk5?&-k?AGSTdA?&htG7dSTffS&?-Gh=PA1&=tGhhd-GcS?GtPG=kcc&?T&h-SdkPS_-=PcGAcSATT?kk(Gkdfc-S?&G-=tAPLft=+kdA-PST??Ph=tA-&ASdh&ffktSG?oPc=kcAhPTTh?5hSSSd-cPf=kc=Ahf?hqdSkkf&-S?hG?=htATdtcsfk=f-St?PG}&&Ak&AtSfdd?khSG?PPt=Ss&&-TthPddk=SS-APS&%c?AhTGh-!ckff&--cdGPcYA=TftAYSdTf&-f?=tk=chP&&t?htd=fWS==-PA=ScT&PThhGddkcP?-&P-Gtch&uT=hkddkGftAG?hcUcdAATftt_-dt?c-8?=Gk=&AS&Tt?hhSAfdSc?fGS=-ct&Pt?hTdfGtSSPtP?=acG&kTchffhk-ft-PcfG=ckAATchdoPGffG?-?cGS=&A?&ttPffd=fkSA=PPT=?ch&tt-hAPGk&-c-tPG=_cT&kTAkPxTk?fh=dPdGccfA&yGttVPk Pf-k?AGS=Tt=&htGpd--ffS&?-Pt&cAC&=tkfPdSkTS??-P&=kd}&fdfh-rhkPS?-=PkAtcSATT?kG0Gkdfc-f=hG-=tAP,ct=zkdAfSGI??Ph=Gt&&ctfh&d-?dSP?6P=&hcA&STTh?SkkGSd-cAdG&c-AtTPkfq=kkfA=f?TG?=hAtT-tA?cd&f?St?GGs=cAk&AdPhTd?khSA?dPc=fAk&=Th-hdu?PSk-&PSGtc?Ah>Ahd3ckffh--?tGPc?ATTf-S*S-?f?-9?GGS=cAfhht-htdPfhS=?kPA=StC&?ThhGdGkcSf-&P-&dcP&iT=Kk7AkSfT-&PfG=pAAcdct&1?dtfc-7?=A-=AAS&Th-hhdGfdSc=?P&=-ct&ttQh=dkkAPP-TP?GhAG&dTchfdkk=fh&kPB==ckA&TShdD?dh?A-d?cGfcAA-&ttP:%S&fkSA?S=?=?ch&GtdkTdfk&S-&PPP=+c=&k7thSQTk?c=-GPdGcc=&zT?-c6Pfcf=-f?AG?=TA?pktG(ddcSkS&?-Pt=Ptf&=tkhAkSkTS?-hPt=-cAfUT&WkBtkGSg-APkGATPATT?thdPkdfc-f?&AG=tAPT_h=bkdAfS-f?cG;b?AdjTtfhTd-fkSP?>c&=kcA&St&h?jhkGSdGTPfG&c-TGTPh.4=kk?t-S?TG?RAAGTdtc8fShf-St?PtT==Ak&Ah?Acd?=tSGtSPc=fc&TPtchPG4k==P-APSGT&?&TTG?d8c=ff&ch?t==c=A=SStAc-dTf?Sh?GGG=ckf&&-PhtdPfXS=?-PALfcT&?ThhcddkcST-&tSGtcG&_TAhkkAPffT&??hhPcdhATft&-cdtc=-o?=GkcfAShThdhhGcfdTT?fhf=-TtTGtO?AdkchSStGP?cdAh&dSThfd?k-ft-P=Q=SckktTS?Ib?S-fG?f?TGfd;A-t&tPK+d=SS-S?Shk=?;d&GtdhcdfA&S-TdPPM-c=&STA;Sd?k?Ad-GT-Gcd?A&8-hhCP=kf=?G?A&i=TA?tftGPSdcffS&?-PtcPAG&=-ShA-tkTA=-hcG=&ccf-T&-cztkTSB?AG;GAdPATSfth.Gkd-c?k?&hG=tkcT!P-MkfAhPSTT=PhjAAdDTtf(&dckhA=?I=&=kdt&SvTh&Bh=cSd=GPfttc-Atthh>P=kkcT-S?hG?Ah&jTd-ACfG&f-c&?PG2cGAkfttShTd?fkSG=dGG=fdh&-PdhPGPk=PkPSPSsMc?h&TG?kOc-f-S--tdGPc-A=hktAOSfdf?&L?GhS=cAS&&:-1ddPcdS=TkPATfcT&?tThGGkkcS--&PPGt&P&TT=?SqA=-fTGt?hGGc-AcSPt&>-dtf=-*==G&=AkG&T_chhGPfdPc?PP&u=ctm&tJ?PdkkATS-TtGGhd&&dT&hfk&t-ft&cP.hAckekTStTjGdhcT-d?cGf=TA-hth=)9GtfktA?SQc=?cht-td?TdfcdS-?6PPArcc&kShhSG#k?S?-GPdcdcffkT-tt_Pkff=GkPkGSdfA?hftGcQdc?f?S?-hS=PdX&=tGhAdcfdSPT?PGTAcc&ST&hP!tkPPf-=PkGAdSATT?th<G-Sfc-f?&c?=tAPT9h=-TdAccSTPkPhMhAdT&h=h&G&kttA?5P==kcAtdTT?cph=hSd-APfc&A&AtSAh7P&kkSk-S?T=P=hktTdtc.fdhf-PtPbGpJhAkthtSGAd?-h-??dh7=fN&&-tShPd?kTSfTkPScSc?&bTGhfVckf?h--?tGPd_A=TktA1S-#f?Sh?Gcf=cAf&&h--=dPc?S=?tPA{AcTTGt=hGGGkcP--&P-GtcP&&T=??4A=AfT-P?hcGAcAcSPt&PGdtft-r?==A=Akc&Tt?hhdAfdPc?-P&uActtAtJk=dk-AS?-Tt&GhyG&dtbhfdkk=fh&tP5TkckA&TSthw?dh?A-d?cGfu&A-&ttP,8S&fkSA?S=T=?ch&Ghd--dfckS-?cPP(Pc=TStthSGSk?Ac-GPdGccfATT-?kNP=Pf=-f?AcSAfA?SftGPSdcGdS&?-=d=Pk?&=tkhAdckTP??TPG7PcctPT&?c<t-PSt-=tGGAuSATkTthfGf=fc&=?&hh=td6T0d=dcdAccSTccPhtGAdhchAh&GAkt=k?rAS=kAd&GTt?T%hkhSd-APfGTc-AtKch7R=kk---S?TG?ch?cTd?rBfkGf-&-?P=k=&AkSktSG?d?khSG?dGS=fkH&---hPddk=?k?fPSedc?fdTGfG9ckf-f--tSGPc^A=TftAfSkkf?&-?Gkd=ctc&&t-+AdPcSS=TGPA=?cTt?kthGG?kcAP-&P&GtcPchT=?=pAkSfT-=?hAGA=AcSct&k=dtS=-w===c=AkA&TS?hhdtfd-0?PPT:TctdktxhcdkktSS-Tc=GhcG&dSchfQ&k-ftGcPUG=ck&tTStTa?dh?A-d?cGf.-A-&ttPdsPSfk&k?SG==?kP&GhfhTdfcSS-??PP= c=&ktfhSGkk?AP-GPkGc&f&?T-?f7P=Sf=-=?AGSAdA?S?tG#ddcf?S&=-GP=PkP&=;?hAk&kTP??PPGpGcckfT&hAWtkTSS-ctcGAt&ATTPth{AkdfcG??&G-=tkPT t=%kdA?PST??PhcTAd&ctfh&SGktSP?wtf=kcA&StT-dKh=hSd??Pf)Sc-T)thh8GdkkTd-S?TG?=h&PTd-hsf=Sf-Sh?Pc,ASAkS_tSPdd?f?SG?dPh=fkf&-TthPdfk=Pk?PPS2Sc?tfTGP=>c-f-G--t-GPFyA=TGtA,ckdfP&P?G=t=cAS&&tGhtdP?fS=?kPAnScT&?ThhGSSkcSf-&GAGtcP&WT=k-NAkSfT&d?hGGcd&cktt&P&dtSf-,tdGkcTAP&T-thhA-fdSc?fP&cPctf&t(Pddkk&SSPTPtGhdT&dSthf-ck-ft-hP!!RckAATShf_?Shfc-dtdGf&+A-T=tPf5ktfk&k?STT=?{?&GdddkdfcfS-TGPPt=c=hkhfhSGSk?Gf-G&dGcTfTST-?-%P?Af=GT?AGccdAPSPtGkWdcfSS&??Pt=Ptf&=tkhAkTkTS?-hGGt&ccfcT&ydUt=hS<?AGSGAd&ATtfthuGkdfc-A?&hc=tkhT_tcrkfAfhSTTAPhx=AdHktfh&dtktAt?rP==kcT&SQTzT#h=hSdPtPfCnc-tttkh_GRkkGm-STAG?=hSGTd-haf=ff--7?Pc2-=AkSdtSPkd?P?SG?dGT=fkS&-TthPddk=Pk?APSM-c?-hTGPtWckf-S--tSGPdGA=TStAkSkdf?&??GhP=cAc&&t-jsdPc=S=?kPA=PcTh?h=hGGckc?P-&CPGtTPTGT=?A9AGSfT-&?hGtc-AASTt&f-dtfG-o?&Gk=AtP&Tt?hhGGfdSc?fP&&Gct&PtjdSdkkASS-Tc=GhcG&df?hfW&k-StAkP(!kck&PTS?P.?fdf&-dtSGfhTA-&ttPa}kGfk&k?ShP=?A!&Gud8NdfcfS-TSPPTtc=&khkhSG?k?fh-GPPGcTfTST-?P#PSSf=-A?AASASA?SGtG?ddc?1S&=-=?=Pk=&=-&hASdkTP?PPPGHccc)PT&d&pt-P-G-=tAGAthATPothFtk-fA&T?&cP=tAGT>tc6kdA?PST??PhTGAd&ctfs&P^kt&o?zG-=kk-&Sth^?%hckSdT&PfG&c-Atthh!G^kkA--S?tG?Ah&PTd?d+f=kf-=&?PGy=&AkSStShTd?f-SG=dG==fk-&-HkhPfdk=Pk?cPSJ?c?dhTGScJc-f-S--tPGPdcA=kAtAfSf-f?&G?G&-=cTf&&d-d?dPc=S=cTPAktcT&&tfh=GAkcSh-&P?GtcG&.T=k-4AkSfT=P?hGGcd&cG-t&PtdtSf-qtfGkcT&=&T?bhh?&fdSc?fP&=?ctfttMPfdkk&SSPTG-Ghdh&dShhf-fk-ft-APnKkckAATStt%?ShST-dtfGff&A-B-tPUzdtfk&k?Sh?=?Ad&G!dS=dfcSS-T-PP=Pc=&k&chSGPk?fh-GPSGcTfTST-?GWPSSf=Td?AASA-A?S=tG?ddcf=S&?AGk=GkA&=hthAd-kTS=-hPG&Scc&fT&?-5tkPSW-=c-GAcSATtTth{GkdfcG??&G-=td?Trt=2kkAGhSTtMPhcSAdS-tf^td?kt&k?3=A=kcA&STTdf.hcLSdT-PfGTc-TttkhyGdkkAk-SPSG?=h&PTd?SEfd&f--d?PA ASAkS-tSkdd??hSG=d=d=fk?&-fthPd?k=SG-hP-wGc?&STGhkHck?f&--cdGPc7A=SktA;SdTf?Gk?GGd=cTP&&t-htdP?fS=?kPAhkcT&?Th0G?&kcAT-&GdGtkk&ItA7hgA=hfT?S?hGGcdAcTPt&PTdtAk-6?cGkAAA-&T-thhGhfd-d?fP&=hctSdtIh=dkktSSGTPGGhkk&dhthfk-k-?t?PPB}fckdATShfL?k-f&-kt-GfTPA-&htPrfd=fkPt?SPT=?dh&Gtdhcdf-hS--tPPA-c=&kTAhSSzk?fh-G&tGccfA&t-S=gP=cf=-t?Ahh=T&GTftGP&dc&tS&?-Pt=PAk&=-chAGhkTSP-h=G=hccfAT&?&CtktSo-=PcGAdtATT?th#Akd?c?h?&hh=tTATF--gkSAS-STtMPhhGAdTjtf}kd=kh&k?JA?=kc&&Stdh?eh-ASd-cPfh&c-AtTPh#f&kkfA-S=TG?=hAGTddT_fd&f-Af?PGI==AkhttShTd?=-SG?dPccf0P&--GhPd&k=AT-AG?=cc?fcTG=fIckff&--GGGPdGA=STtA.-dT-?-??Gh==ckc&&ffhtdPfGS=T&PA=ScT&&ThkGkAkcAT-&==GttP&<M=o?:A=tfTA??h&ScdtctAt&PhdtAd-Vc-Gk&A&&&T?Mhh-&fdPt?fc&cTctSdtUSSdk&-SS?fPc=)kf&dhhhfDTk-fh-PP9A&ckAATS;=<?dhfG?d&-Gfd?A-TctPPAd=SS-c?ShG=?dk&Gtdhcdff-S-T?PPyAc=&fTAdSstk?AP-GtGGchdA&T-hGRP=cf=-k?AGc=Tt?t-tGPAdc-PS&PtPt&P&P&=-&hAPSkT?T-hcGc=ccfTT&?hUtStSnG=GcGAdtATdcth-hkd?c?A?&hh=t!kTlGfgkkdfGSttdPhAfAd&AtfhTd-ktPc?gP==k&t&STTh?dhGfSdTSPf=Gc-f=TP*kd=kkA?-Sh&G?=hAGTdNkWf=Sf-&=?PGd==TkTStSP-d?c?SGchPc=f&?&--GhPdgk=SG-AcSGtc?f=TGd-ocGhf&G-GkGPdcA=fktASbdT???P?GhA=ckT&&kdhtSPSGS=T&PATGcTt)ThkGk=kcAT-&&XGtSd&lThh?%&=hfTPh?hG=cdAATft&fGdtfP-6=cGk=AASTT-chh=kfd-??fhP=-&0TAt!PSdkA&SS-TP?GhA?&d-khfGPk-fh-P=.=hckffTS-T_?-tfG-dPPGfdSA-T,tPvkd=-k?G?Sh?=?kP&Gd=hcdfktS-T=PP=Xc=&STAkSk-k?Ac-G=-GccSA&,-!?4P=Af==P?Ahk=TA?-htGPcdcctS&?PPtAPP;&=-&hAGTkTGT-hPGcTccfhT&h-wtkGS_G=PSGAkxATP?th=-kdfc?&?&hh=tffTCtApkfASASTtdPhdkAdTdtfh&kPkt&S?NP==kct&SvTmk/hc-SdPtPfc=c-ttthh_G?kk=A-SPfG?c-A&Tk?Guff&f-Sh?PGS==AkhttShTd?=hSG?dPc=fTh&-TthPfGk=Sk-APS&Xc?AhTGSf5ckff&--cdGPc1A=k-tA/SdTS?cc?Ght=cAh&&?fhtk=ffS=tVPAdtcT&?ThhGd?kcAt-&hfGtcG&mh=h=gA=hfTTB?hT?cdAcT-t&GkdtfP-r?hGk&AAP&T?fhhf&fdTh?fc&=TctSSta-=dkSPSSGTGtGhk-&d-ShfkGk-?t?hPz#?ckhhTS?t>?Sh-R-dtPGftPA-SStPv?dTff&=?SGh=?AX&GtShcdf-hS--tPPATc=&kTAhSSKk?fh-Gc1GccfA&T-kd6Pksf=GK?AGS=T&?kctGPtdcfhS&tfPtc=&=&=?ohAP}kTS?-hPG=kccftT&PfItkGS_P=PfGAdhAT-.thHhkdfc-T?&8k=tAPT8t&pkSAScSTtfPhA&Ad?Gtfk&ktkt&S?*T==kAd&Stfhcd c?Sd==PfGTc-&kTPhxf&kkfA-STTG?=hAGTddT/fd&f-???PG6==AkhttShTd?PhSG?dPc=fTh&-TthP?dk=Sk-AGStGc?f&TGhT}ccdf&?PP?GPdtA=dStA)SdTf?--?Gh&=cfd&&t?htfPfAS=TTPAqtcTdSThhGkTkc&M-&P-GtcT&yC=3T}AcdfTPc?hCScdtctft&Gkdt=P-)AcGk&A&&&T?fhh=kfd=A?fc&cTctSSt_fTdk-hSSGTGtGhk-&dk-hfc?k-SS-APdWPckh&TStte?k#fG-d=TGf=&A-hStP4(d=SkhT?Shc=?AA&G-hhck-f=S-T&PPchc=&kTAhSdAk?Ac-GthGccSA&h-nPNP=Af=&A?A&A=TA?tctGPtdcffS&??Pt&P&f&=-hhAASkTPT-hPG=AccftT&Pkntk=SCP=&dGAkvAT-dthyhkdfcSk?&Uf=tAPT4t&_kSAS&STtSPhA&Adf&tfk&kTkt&-?_T==kAd&StfhcdecPSd-TPfGTc-&kTPhLf&kkfA-STTG?=hAGTddT.fd&f-P=?PGR==AkhttShTd?=kSG?dPc=fTh&-TthPPSk=Sk-AGStGc?fTTGhTzcckf&?PP-GPdhA=?ctAISdTf?-S?GhT=cfk&&t?htfPSdS=TtPA8hcT&TThhGd-kc&d-&P-Gtcc&vU=ht)AckfTPc?hhncdtctft&Gfdt=P-s?hGkcdAG&t?-hh-tfdSA?fPh=-cthct{h=dk=ASS-TP?GhTA&dTchfkAk-ft-PPBA&ckAATSfAU?dhfG?d&-GfdcA-TctPPhd=SS-h?Sh&=?hG&GtdhcdfktS-TcPPvhc=&fTAdSk?k?AA-Gt&GcccA&T-u=NP=tf=-k?AGP=Tt?TAtGPhdc-PS&&SPt&PAf&=?#hAPSkTS&-hPt=-cASkT&dhYtkGSn-&PkGATPATT?thPGkdfc-f?&AG=tAPTi4PWkdAfSST==Ph=GAddPtfh&d-ftck?WhP=kAP&S-&h?kdf-SdT=Pfcgc-AtTPh:dhkkAP-St&G?c9AGhdtt_f=Gf-&??PAG==AkTktSPAd?khSG?fPc&fAk&--&hPfSk=tG-AcSccc?fTTGf?Vc=df&--fAGPd&A=-stA5?dT-?-t?Ght=ckh&&k&htdPfkS=tdPA=ScT&PThkGdhkc&k-&d-GtfS&;T=hhvAcdfTT-?hGccd&ETPtTGfdt-T-Y?cGkc-AS&Td=hhdGfd=d?fP&=-cthct.h=dkcGSS-TP?GhTA&dTchfStk-ft-PPwA&ckAATSfEg?dhfG-d=TGf=&A-dktPa/d=fkPt?SPT=?hP&Gtdhcdf-hS--tPPT?c=&kTAhSSvk?fh-GAAGccfA&T-kdiPknf==P?AGS=TA?5ktG(ddcPtS&?-Pt=PGc&=?dhA=kkTS?-hPG=TccSkT&h?!tkGS9P=GhGAkfAT-fth0hkdfc?&?&;?=tAPT(t&ekSAS-STtPPhA&Ad??tfk&kdkt&G?iT==kAd&StfhcdmccSd?TPfGTc-&kTPh,f&kkfA-STTG?=hAGTddTYfd&f-PG?PGY==AkhttShTd?=1SG?dPc=fTh&-TthPPkk=Sk-AGS-?c?S3TGhTKcc-f&?PGGGPkkA=dGtA;SdTf?-T?GV*=cf-&&t?htfPS=S=tdPAddcT-TThhGk?kc&S-&P-Gtc=&Us=aAUAc-fTPc?hd&cd&yTPtTGPdt?f-0?cGk=&AS&Td=hhdGfdcf?fP&=-AtdPtQPcdkfPSSThP?GhAA&d-=hfGTk-fh-P=3=TckfcTS?ci?A?fG-dP?GfdTA-&ttPJkd=?k-q?Sht=?Tf&GhGhcd=fDS?t*PPASc=&fTAh-_Tk?Pk-GPdGchTA&T-ttdPP2f=Tf?A=x=TfG&htGd&dcAkS&t?Pt=GAUt=h&hA=fkT&f-huh=dccT-T&P? tkPSM-APkAAAtAT-Pthk&kdPS-fPkG==hf=TBddUkd&fSSt??Ph&AAd&ctf?fd-ktSPP>&==kk&&St=h?=dkGSd?^Pf,Ac-fhTPhdI=SkS?-St&G?d&AG?Gtc0fk?f-&h?PGW==AS&AdS9kd?AmSGG-PchTc&&AtkhG=kk=?--AP-GTcPAhTGkS^ckff&AT?tGPcz&=kktAG-dTSkShtcGd=cAP&&?Sht=Gf9Sc?k=AcScTS-ThPSddPdSf-&P?GtkG&OT=hk!&kS?T?-?h5=cd-cTfkf^-dt&P-jtGGkd&AS&ht?dh?Pfd&c?fhA=-S-&PtItGdkcTSS-TP?=dcGhdhkhfGtk-?k-PATG=cGAhT-P9K?-SfG-k?cGS=&A-.dtPJFd==kSA?SPTc?kh&G?fhcdhk&&G-tPPcSc=SkTAP?5TkPfhPGG&GckfA&S-ttS?k(f=-f?A6S=TAG&htcCdfcSGS&t?PtdPAWCdtkhAk=kT&=-hPG=dc&&fL&a=;tccS:PTPkhAcStTtfthGAkdPh-fTcG-=tSPTw?c k=tfSSh??=h-AAdS&tfmSd--=SPGJf&=kkT&S-hh?A-kG?ddTPfKtc-SNTPdh0=-k-f-SthG?dPAGTPtcd-c?f-Td?PGS==Ak&Ah?dPd?AfSGGtPc=fc&&-t=hP=fk=SS-AP-GTAGTfTGPS cPGf&--?tcPA?A=--tAGPdT?hShPcGt=cfG&&tGhtdPf>S=PkPAdPcTSAThhcddSc)?-&hGGtkc&)fhhkkAPffTT=?h(AcdT-TfhkY=dhA&-gPGGk=&AS&ht?hhSAfdSc?f=T=-ct&Pt7k&dkkASS&=P?GhcG&dh:hfGhk-&f-PPdG=ASTfTSPDy?PSfG-d?ccfA=A--dtPGfd=?ASAP?=d=?fS&GtShcdfk&S-PfPPdfc=SPTAh?MTS?ST-GhSGck?A&fAttkPktf=T-?A}P=TTd&htt9-dAAGS&?=Pt=GA^&AtkhASPkTS?-h=c=dcc&fT&kG.tkPSj&?PkGAcSATt&thGAkdAh-f?TG-AVAtTq?&mkPzfSST??=hc=AdSTtfPhd-?PSPPkGk=kf0&StYh?}hkGSdP-Pfnhc-SfTPhkv=Sk-S-ShwG?kkAGfPtckff?f-Td?Pvf==&T&Atc!ddPASSG=TPc=Sc&&PTthPSfk=Sk-A=SGTc?AhTGkSCckff&&f?tGPcwA=kStAGPdTAASh?=Gdc&AA&&?Ght?hf!S=?kGTc=cTScThSTddkcSfP&P&GtkA&)-ThkSSkSSh?G?h9tcd&ATft&J-dtSS-1tTGkkdAS&ht?dhk=fd&t?f+%=-Al&Ptg%-dkchSStkP?GhcG&dthhfGhk-ft-Ph-G=c?TdTStTL?SAfA-k?c=-dGA--?tP--d=fkSAGSS-=?fP&G?=hcS&k&-P?hPPdcc=TfTAhSRTk?ST-Gh=GckTA&TPttkPfTf=Tc?A2&=Tdh&httaSdcAcS&GPGd=GAX-dtkhh=GkTS?-h=c=ScA&ft7P=)tkPSmG-P-G&cSTT==th=4kd&d-fTfG-cSk=T9Pd<kS?fPSt??Ph=GA-Sttfh&d--=Sc?dP=Ak?t&S??h?=PkG=m-c=fTAc-SPTPP=l=fTfA-cPdGPkcAGCAtc Sd&fPSt?PAf==Ak&Ak&hTd?khSG=SPc=fc&STTthPdmk=k&-AhTGTfdAhT=hd,cTkf&TT?tGPcmA=Tkhd-PdTA=ShGkGS=AAf&tt-mk=AfsS=?k=-=Pct&?hdPSddcTSfAdP-GtcPt.tAhfGtkS&x-?cGGGAfAtTfPds-khfP-W?=GkAdAS-Rt?GSdGffScGf=G=-fd&P?fh=kPkA?SP-P?dkcGSSTc{t!&kASk-Gh-G=&hAAT-tTKPdhfGGS?cGf=&hT&ttP!ed=d&SAtPPTdAch&=tdht=Pk&S--t??=kcc&kTAGPITk?fh-=PdGccfA&fhttvPk_SA&t?AGS=T&=&htGXdk(kAS&?-Pt=AAI&ctkh&dSfd&c-hPG=dct&fTTh-dkcASW-=PkAAcSAtT?thhPkdfc-f?&G-=tAPTI%tpfd&fSST??Ph=GAdtPtfh&d-ktSP?dP=Ak?t&STTh?zhkG-=-cG-cGc?AhTPhd,=kkfA??t=G?cdAGtStcVfd&fA-k?GGf==A-&At-hTdPkhSG=SPc=fc&&?TthPdIk=cG-AP?GTcGAhT=hdd&fcf&-P?tcfcoA=TkhTdddTf=Sh?cGd=cAft&hAhtdcfsS&?k=-=SAhT?Thh&ddf=Sf-&P-ctA?&LTThkYhkSSS-?Gd=fcdAhTfttH-dtfPPHk&Gkc(ASTkt?xSdGSftP?fGk=-A*&Pt h=fkfdSS?fP?=-cGTkTchfd-k-S--PP*G=ckAAt?rcw?kPfG-k?cGf=&&PT=tPH=d=SGSA?SPTcG&d&GtAhckAk&S--tPAc}c=&cTAd-^TkPfh-GG=GAchA&TcttvPkpf==N?A=d=T&d&htG#ddcS&S&PdPt==AD&AtkhAfdkTST-hGf=dA?&fT&L?JtktSX?-Pk=?cS&d?tthd_kd---f?TG-=tT?TEhd;kkffSST??G-=&AkTktfhTd-khSP??P==kTt&STTh?ddkGSd-cPfAhc-AtTPhSm=kkfA-ScCG?=hAGT=tcwfd&f-Gd?PG;==A-&AtShTd??kSG?dPc=cc&&-TthPSfk=Sk-AP-GTc?AhTG;hNAk&f&-T?tGPc(A=t-tAytdTf?Sh?GGd=c&G&&tthtd=fwSA?kPA=TcT&?ThsdddkcSf-&GhGtcP&oTAhk;AkSfT-T?hGGcdAcTft&9-kkSf-x?=GkqSAS&tt?dd=SfdSc?f=-=-ct&PI_AtdkkASS-TP?cPcGTfhfhf/&k-Sd-PPDG=AS&STStTx?fGfG-d?ccfA=A-&ttP}Cd=ftSAP?=?=?ch&Ghdhcdfk&S--hPP=1c=&fTAhS#TfGSt-GPdGcAdA&T-ttd=kPf=-k?AG&=TA?&h6tdddcffS&cdPt=GApTttkhh=GkTS?-hAS=dcA&ft%P=#tkPSM=?PkG&cSAT?=th!GkdfA-f?&G-A<ffTCt=8kkTfSST??=htPAd&ctfh&d-fGSPPk=-=fcT&Stfh?DhkGSdtcPfG&c-&vTPhkM=kGfh--?tG?=hAGTktcNSd&f-Gd?PG1==Ak&AtShTkGt&SG?fPcc}c&&-TtY=kSk=S--AG?GTc?AhhGxcvck?f&-G?t=kcM&AT&tAQ=dT-fSh?GGd=cAP&&tGhtd&f8S=?kPAc=cT&GThhGddk&Sf-&GSGtc=&jTchkLTkSSh-T?hGAcd&&Tft&O-ft-k-E?&Gk=tASTPt?ddkffdSh?f=P=-ct&Pt1^GdkktSS?kP?=dcGtdTthf*hk-Sd-PPSG=ck&tTShu7?kdfG-f?cGfcdA-TktP7+d=fkSAP?=k=?AS&Gh-hcdfk&S-?PPP=?c=&STAhSXTk?Al-GP?Gcc-A&T&tt#AfGf=-k?ATT=TAP&httdTdcf&S&ATPt=GA_&&tkhh=GkTS?-hT<=dcA&ft>P=UtkPSmAkPkG&cSATtdthn&kdfA-f?&G-cSFcT*ttIkP;fSSt??Gd=GA-Sttfh&d-GfSP?dP==S&-&-tkh?dfkGSd-cG--Pc-&fTPWP_=kkfA-cPdGPcSAGTftc)Sd&fPSt?PAf==Ak&AtGhTd?khSG=SPc=fc&&?TthPd<fAPT-AP=GTchAhTGhdd&fGf&-c?t=8c0A=TktARcdTfASh?=Gd=AAfTkt&htdAf,ch?kP&=ScT&?tfP&ddkcSf&kP-GhcP&S-ThkJAkSc--?P%GGcdTkTShd/-dhfP-M?=GkP&ASTkt?iQdGfkSc?fkA=-ct&PtBh=dkkASSh P?GhcG&kTchf5&");
		local t = 0;
		a.jJdKlafE(function()
			a.bxiHnZTG()
			t = t + 1
		end)
		local function d(d, f)
			if f then
				return t
			end;
			t = d + t;
		end
		local f, t, r = n(0, n, d, s, a.mQcqR_Pj);
		local function k()
			local f, t = a.mQcqR_Pj(s, d(1, 3), d(5, 6) + 2);
			d(2);
			return (t * 256) + f;
		end;
		local b = true;
		local b = 0
		local function _()
			local e = t();
			local d = t();
			local h = 1;
			local e = (f(d, 1, 20) * (2 ^ 32)) + e;
			local t = f(d, 21, 31);
			local d = ((-1) ^ f(d, 32));
			if (t == 0) then
				if (e == b) then
					return d * 0;
				else
					t = 1;
					h = 0;
				end;
			elseif (t == 2047) then
				return (e == 0) and (d * (1 / 0)) or (d * (0 / 0));
			end;
			return a.sIDYVvzs(d, t - 1023) * (h + (e / (2 ^ 52)));
		end;
		local g = t;
		local function p(t)
			local f;
			if (not t) then
				t = g();
				if (t == 0) then
					return '';
				end;
			end;
			f = a.yrFhC_Mt(s, d(1, 3), d(5, 6) + t - 1);
			d(t)
			local d = ""
			for t = (1 + b), #f do
				d = d .. a.yrFhC_Mt(f, t, t)
			end
			return d;
		end;
		local b = #a.XG_tvKvv(o('\49.\48')) ~= 1
		local d = t;
		local function ed(...)
			return {
				...
			}, a.LXvugQYU('#', ...)
		end
		local function td()
			local o = {};
			local d = {};
			local l = {};
			local s = {
				o,
				l,
				nil,
				d
			};
			local d = t()
			local n = {}
			for e = 1, d do
				local f = r();
				local t;
				if (f == 3) then
					t = (r() ~= #{});
				elseif (f == 1) then
					local d = _();
					if b and a.ItuXzebJ(a.XG_tvKvv(d), '.(\48+)$') then
						d = a.OoudtgHJ(d);
					end
					t = d;
				elseif (f == 2) then
					t = p();
				end;
				n[e] = t;
			end;
			for d = 1, t() do
				l[d - (#{
					1
				})] = td();
			end;
			s[3] = r();
			for s = 1, t() do
				local d = r();
				if (f(d, 1, 1) == 0) then
					local l = f(d, 2, 3);
					local r = f(d, 4, 6);
					local d = {
						k(),
						k(),
						nil,
						nil
					};
					if (l == 0) then
						d[h] = k();
						d[c] = k();
					elseif (l == #{
						1
					}) then
						d[h] = t();
					elseif (l == u[2]) then
						d[h] = t() - (2 ^ 16)
					elseif (l == u[3]) then
						d[h] = t() - (2 ^ 16)
						d[c] = k();
					end;
					if (f(r, 1, 1) == 1) then
						d[e] = n[d[e]]
					end
					if (f(r, 2, 2) == 1) then
						d[h] = n[d[h]]
					end
					if (f(r, 3, 3) == 1) then
						d[c] = n[d[c]]
					end
					o[s] = d;
				end
			end;
			return s;
		end;
		local function fd(f, d, t)
			local e = d;
			local e = t;
			return o(a.ItuXzebJ(a.ItuXzebJ(({
				a.jJdKlafE(f)
			})[2], d), t))
		end
		local function _(y, r, o)
			local function fd(...)
				local k, z, m, td, b, t, s, g, p, dd, u, f;
				local d = 0;
				while -1 < d do
					if 3 > d then
						if 0 >= d then
							k = n(6, 23, 1, 3, y);
							z = n(6, 78, 2, 37, y);
						else
							if d > -3 then
								repeat
									if 2 > d then
										m = n(6, 26, 3, 28, y);
										b = ed
										td = 0;
										break;
									end;
									t = -41;
									s = -1;
								until true;
							else
								t = -41;
								s = -1;
							end
						end
					else
						if 4 < d then
							if d >= 4 then
								for t = 43, 58 do
									if d ~= 5 then
										d = -2;
										break;
									end;
									f = n(7);
									break;
								end;
							else
								f = n(7);
							end
						else
							if -1 < d then
								for t = 29, 73 do
									if 4 ~= d then
										g = {};
										p = {
											...
										};
										break;
									end;
									dd = a.LXvugQYU('#', ...) - 1;
									u = {};
									break;
								end;
							else
								g = {};
								p = {
									...
								};
							end
						end
					end
					d = d + 1;
				end;
				for d = 0, dd do
					if (d >= m) then
						g[d - m] = p[d + 1];
					else
						f[d] = p[d + 1];
					end;
				end;
				local m = dd - m + 1
				local d;
				local n;
				local function p(...)
					while true do
					end
				end
				while true do
					if t < -40 then
						t = t + 42
					end
					d = k[t];
					n = d[j];
					if 149 > n then
						if n < 74 then
							if 37 > n then
								if 17 < n then
									if 26 < n then
										if n >= 32 then
											if n > 33 then
												if 34 < n then
													if 34 ~= n then
														for t = 32, 96 do
															if 35 < n then
																f[d[e]][d[h]] = d[c];
																break;
															end;
															local d = d[e]
															local e, t = b(f[d](f[d + 1]))
															s = t + d - 1
															local t = 0;
															for d = d, s do
																t = t + 1;
																f[d] = e[t];
															end;
															break;
														end;
													else
														local d = d[e]
														local e, t = b(f[d](f[d + 1]))
														s = t + d - 1
														local t = 0;
														for d = d, s do
															t = t + 1;
															f[d] = e[t];
														end;
													end
												else
													f[d[e]] = f[d[h]][f[d[c]]];
												end
											else
												if 33 ~= n then
													local n, s;
													for r = 0, 6 do
														if 3 <= r then
															if 4 >= r then
																if r > 3 then
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															else
																if 4 < r then
																	repeat
																		if r < 6 then
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e]
																		f[n](f[n + 1])
																	until true;
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if 1 > r then
																f[d[e]] = o[d[h]];
																t = t + 1;
																d = k[t];
															else
																if r == 1 then
																	n = d[e];
																	s = f[d[h]];
																	f[n + 1] = s;
																	f[n] = s[d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												else
													local n, r;
													for s = 0, 6 do
														if 3 <= s then
															if 5 > s then
																if s > 0 then
																	for r = 10, 75 do
																		if 3 ~= s then
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if s > 2 then
																	for l = 39, 64 do
																		if 6 ~= s then
																			n = d[e];
																			r = f[d[h]];
																			f[n + 1] = r;
																			f[n] = r[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = f[d[h]];
																		break;
																	end;
																else
																	n = d[e];
																	r = f[d[h]];
																	f[n + 1] = r;
																	f[n] = r[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if 1 > s then
																f[d[e]] = o[d[h]];
																t = t + 1;
																d = k[t];
															else
																if s >= -3 then
																	repeat
																		if s > 1 then
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	n = d[e];
																	r = f[d[h]];
																	f[n + 1] = r;
																	f[n] = r[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										else
											if n > 28 then
												if 30 > n then
													local r, s, a, _, b, u, p, n;
													for n = 0, 6 do
														if 2 < n then
															if 4 < n then
																if 5 ~= n then
																	if not f[d[e]] then
																		t = t + 1;
																	else
																		t = d[h];
																	end;
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if n >= 0 then
																	for o = 29, 81 do
																		if 4 > n then
																			r = d[e]
																			f[r] = f[r](l(f, r + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if n >= 1 then
																if n ~= -1 then
																	for l = 10, 94 do
																		if n > 1 then
																			n = 0;
																			while n > -1 do
																				if 2 >= n then
																					if n < 1 then
																						a = d;
																					else
																						if 1 ~= n then
																							b = h;
																						else
																							_ = e;
																						end
																					end
																				else
																					if n < 5 then
																						if n > 2 then
																							repeat
																								if n > 3 then
																									p = a[_];
																									break;
																								end;
																								u = a[b];
																							until true;
																						else
																							u = a[b];
																						end
																					else
																						if n ~= 3 then
																							for d = 21, 71 do
																								if 5 ~= n then
																									n = -2;
																									break;
																								end;
																								f(p, u);
																								break;
																							end;
																						else
																							n = -2;
																						end
																					end
																				end
																				n = n + 1
																			end
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		r = d[e];
																		s = f[d[h]];
																		f[r + 1] = s;
																		f[r] = s[d[c]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	r = d[e];
																	s = f[d[h]];
																	f[r + 1] = s;
																	f[r] = s[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																f[d[e]] = o[d[h]];
																t = t + 1;
																d = k[t];
															end
														end
													end
												else
													if 30 < n then
														for d = d[e], d[h] do
															f[d] = nil;
														end;
													else
														local d = d[e];
														local t = f[d];
														for d = d + 1, s do
															a.zVSAliLu(t, f[d])
														end;
													end
												end
											else
												if 24 < n then
													for o = 17, 90 do
														if n ~= 28 then
															local n;
															for c = 0, 4 do
																if c < 2 then
																	if c ~= -1 then
																		for n = 23, 57 do
																			if 1 ~= c then
																				f[d[e]] = f[d[h]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]] = f[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f[d[e]] = f[d[h]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if 2 < c then
																		if 0 <= c then
																			for n = 17, 87 do
																				if c > 3 then
																					r[d[h]] = f[d[e]];
																					break;
																				end;
																				f[d[e]] = (d[h] ~= 0);
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			f[d[e]] = (d[h] ~= 0);
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		n = d[e]
																		f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
															break;
														end;
														if (f[d[e]] ~= f[d[c]]) then
															t = t + 1;
														else
															t = d[h];
														end;
														break;
													end;
												else
													if (f[d[e]] ~= f[d[c]]) then
														t = t + 1;
													else
														t = d[h];
													end;
												end
											end
										end
									else
										if n >= 22 then
											if n > 23 then
												if n < 25 then
													f[d[e]][d[h]] = d[c];
												else
													if n == 25 then
														local n, s;
														for r = 0, 9 do
															if 5 <= r then
																if 7 > r then
																	if 1 < r then
																		for c = 44, 66 do
																			if 5 ~= r then
																				n = d[e]
																				f[n] = f[n](l(f, n + 1, d[h]))
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if 7 >= r then
																		n = d[e];
																		s = f[d[h]];
																		f[n + 1] = s;
																		f[n] = s[d[c]];
																		t = t + 1;
																		d = k[t];
																	else
																		if 5 < r then
																			for c = 42, 60 do
																				if r ~= 8 then
																					n = d[e]
																					f[n] = f[n](l(f, n + 1, d[h]))
																					break;
																				end;
																				f(d[e], d[h]);
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			n = d[e]
																			f[n] = f[n](l(f, n + 1, d[h]))
																		end
																	end
																end
															else
																if r <= 1 then
																	if -1 < r then
																		for c = 38, 89 do
																			if 0 ~= r then
																				n = d[e]
																				f[n] = f[n](l(f, n + 1, d[h]))
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if 3 <= r then
																		if r ~= 0 then
																			for l = 13, 79 do
																				if r > 3 then
																					n = d[e];
																					s = f[d[h]];
																					f[n + 1] = s;
																					f[n] = s[d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]] = f[d[h]][d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
													else
														local n, r;
														for s = 0, 6 do
															if 2 >= s then
																if 0 < s then
																	if 0 ~= s then
																		for c = 26, 67 do
																			if 2 > s then
																				f(d[e], d[h]);
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e]
																			f[n] = f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	end
																else
																	n = d[e];
																	r = f[d[h]];
																	f[n + 1] = r;
																	f[n] = r[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 5 > s then
																	if 0 ~= s then
																		repeat
																			if 3 ~= s then
																				f[d[e]] = o[d[h]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e];
																			r = f[d[h]];
																			f[n + 1] = r;
																			f[n] = r[d[c]];
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if 6 ~= s then
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																		t = t + 1;
																		d = k[t];
																	else
																		f(d[e], d[h]);
																	end
																end
															end
														end
													end
												end
											else
												if n >= 18 then
													for r = 46, 96 do
														if 22 ~= n then
															local n, o;
															for r = 0, 4 do
																if r <= 1 then
																	if r ~= -3 then
																		repeat
																			if r ~= 1 then
																				n = d[e];
																				o = f[d[h]];
																				f[n + 1] = o;
																				f[n] = o[d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if 3 > r then
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	else
																		if 1 <= r then
																			for n = 46, 68 do
																				if r < 4 then
																					f[d[e]] = f[d[h]][d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				if (f[d[e]] == d[c]) then
																					t = t + 1;
																				else
																					t = d[h];
																				end;
																				break;
																			end;
																		else
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
															end
															break;
														end;
														local n, s;
														for r = 0, 6 do
															if r >= 3 then
																if 5 <= r then
																	if 4 <= r then
																		repeat
																			if r > 5 then
																				n = d[e];
																				s = f[d[h]];
																				f[n + 1] = s;
																				f[n] = s[d[c]];
																				break;
																			end;
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		n = d[e];
																		s = f[d[h]];
																		f[n + 1] = s;
																		f[n] = s[d[c]];
																	end
																else
																	if r >= 2 then
																		for c = 49, 55 do
																			if r ~= 4 then
																				f(d[e], d[h]);
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e]
																			f[n] = f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	end
																end
															else
																if 0 >= r then
																	n = d[e]
																	f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																else
																	if r ~= -2 then
																		for l = 12, 60 do
																			if r < 2 then
																				f[d[e]] = o[d[h]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e];
																			s = f[d[h]];
																			f[n + 1] = s;
																			f[n] = s[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
														break;
													end;
												else
													local n, r;
													for s = 0, 6 do
														if s >= 3 then
															if 5 <= s then
																if 4 <= s then
																	repeat
																		if s > 5 then
																			n = d[e];
																			r = f[d[h]];
																			f[n + 1] = r;
																			f[n] = r[d[c]];
																			break;
																		end;
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	n = d[e];
																	r = f[d[h]];
																	f[n + 1] = r;
																	f[n] = r[d[c]];
																end
															else
																if s >= 2 then
																	for c = 49, 55 do
																		if s ~= 4 then
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if 0 >= s then
																n = d[e]
																f[n](l(f, n + 1, d[h]))
																t = t + 1;
																d = k[t];
															else
																if s ~= -2 then
																	for l = 12, 60 do
																		if s < 2 then
																			f[d[e]] = o[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = o[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										else
											if n <= 19 then
												if 18 < n then
													if (f[d[e]] <= d[c]) then
														t = t + 1;
													else
														t = d[h];
													end;
												else
													f[d[e]] = r[d[h]];
												end
											else
												if n > 18 then
													for r = 43, 78 do
														if n ~= 21 then
															local n, o;
															for r = 0, 6 do
																if 2 >= r then
																	if 1 > r then
																		n = d[e]
																		f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	else
																		if r ~= -2 then
																			for l = 10, 87 do
																				if 2 ~= r then
																					n = d[e];
																					o = f[d[h]];
																					f[n + 1] = o;
																					f[n] = o[d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				n = d[e]
																				f[n] = f[n](f[n + 1])
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			n = d[e]
																			f[n] = f[n](f[n + 1])
																			t = t + 1;
																			d = k[t];
																		end
																	end
																else
																	if 4 < r then
																		if r > 3 then
																			for n = 40, 86 do
																				if r ~= 6 then
																					f[d[e]][d[h]] = d[c];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]][d[h]] = d[c];
																				break;
																			end;
																		else
																			f[d[e]][d[h]] = d[c];
																		end
																	else
																		if 4 == r then
																			f[d[e]] = {};
																			t = t + 1;
																			d = k[t];
																		else
																			n = d[e];
																			o = f[d[h]];
																			f[n + 1] = o;
																			f[n] = o[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
															end
															break;
														end;
														if (d[e] < f[d[c]]) then
															t = t + 1;
														else
															t = d[h];
														end;
														break;
													end;
												else
													local n, o;
													for r = 0, 6 do
														if 2 >= r then
															if 1 > r then
																n = d[e]
																f[n](l(f, n + 1, d[h]))
																t = t + 1;
																d = k[t];
															else
																if r ~= -2 then
																	for l = 10, 87 do
																		if 2 ~= r then
																			n = d[e];
																			o = f[d[h]];
																			f[n + 1] = o;
																			f[n] = o[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e]
																		f[n] = f[n](f[n + 1])
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	n = d[e]
																	f[n] = f[n](f[n + 1])
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if 4 < r then
																if r > 3 then
																	for n = 40, 86 do
																		if r ~= 6 then
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]][d[h]] = d[c];
																		break;
																	end;
																else
																	f[d[e]][d[h]] = d[c];
																end
															else
																if 4 == r then
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																else
																	n = d[e];
																	o = f[d[h]];
																	f[n + 1] = o;
																	f[n] = o[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										end
									end
								else
									if n <= 8 then
										if n >= 4 then
											if 5 < n then
												if 7 <= n then
													if n == 8 then
														f[d[e]] = (d[h] ~= 0);
													else
														local n, r;
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														n = d[e];
														r = f[d[h]];
														f[n + 1] = r;
														f[n] = r[d[c]];
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n](l(f, n + 1, d[h]))
														t = t + 1;
														d = k[t];
														n = d[e];
														r = f[d[h]];
														f[n + 1] = r;
														f[n] = r[d[c]];
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n](f[n + 1])
														t = t + 1;
														d = k[t];
														f[d[e]] = (d[h] ~= 0);
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]];
													end
												else
													local n, s;
													for r = 0, 5 do
														if r >= 3 then
															if 4 > r then
																n = d[e]
																f[n] = f[n](l(f, n + 1, d[h]))
																t = t + 1;
																d = k[t];
															else
																if 3 <= r then
																	for n = 46, 71 do
																		if 5 ~= r then
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = o[d[h]];
																		break;
																	end;
																else
																	f[d[e]] = o[d[h]];
																end
															end
														else
															if r >= 1 then
																if 1 ~= r then
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																else
																	n = d[e];
																	s = f[d[h]];
																	f[n + 1] = s;
																	f[n] = s[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																f[d[e]] = o[d[h]];
																t = t + 1;
																d = k[t];
															end
														end
													end
												end
											else
												if n ~= 3 then
													repeat
														if n > 4 then
															local n;
															for r = 0, 6 do
																if 3 <= r then
																	if 4 >= r then
																		if r ~= -1 then
																			repeat
																				if r > 3 then
																					f[d[e]] = o[d[h]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				n = d[e]
																				f[n] = f[n](l(f, n + 1, d[h]))
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			n = d[e]
																			f[n] = f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if r < 6 then
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		else
																			f(d[e], d[h]);
																		end
																	end
																else
																	if r < 1 then
																		f[d[e]] = f[d[h]];
																		t = t + 1;
																		d = k[t];
																	else
																		if r ~= 1 then
																			f[d[e]] = f[d[h]];
																			t = t + 1;
																			d = k[t];
																		else
																			f[d[e]] = f[d[h]];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
															end
															break;
														end;
														if (f[d[e]] ~= d[c]) then
															t = t + 1;
														else
															t = d[h];
														end;
													until true;
												else
													local n;
													for r = 0, 6 do
														if 3 <= r then
															if 4 >= r then
																if r ~= -1 then
																	repeat
																		if r > 3 then
																			f[d[e]] = o[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															else
																if r < 6 then
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	f(d[e], d[h]);
																end
															end
														else
															if r < 1 then
																f[d[e]] = f[d[h]];
																t = t + 1;
																d = k[t];
															else
																if r ~= 1 then
																	f[d[e]] = f[d[h]];
																	t = t + 1;
																	d = k[t];
																else
																	f[d[e]] = f[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										else
											if n < 2 then
												if n >= -4 then
													for a = 18, 91 do
														if n < 1 then
															local n, s;
															for o = 0, 4 do
																if 1 >= o then
																	if o ~= 1 then
																		n = d[e];
																		s = f[d[h]];
																		f[n + 1] = s;
																		f[n] = s[d[c]];
																		t = t + 1;
																		d = k[t];
																	else
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if 3 > o then
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	else
																		if o ~= -1 then
																			for c = 25, 91 do
																				if o ~= 3 then
																					if not f[d[e]] then
																						t = t + 1;
																					else
																						t = d[h];
																					end;
																					break;
																				end;
																				f[d[e]] = r[d[h]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			if not f[d[e]] then
																				t = t + 1;
																			else
																				t = d[h];
																			end;
																		end
																	end
																end
															end
															break;
														end;
														local n, p, g, _, a, u;
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = r[d[h]];
														t = t + 1;
														d = k[t];
														n = d[e];
														p = f[d[h]];
														f[n + 1] = p;
														f[n] = p[d[c]];
														t = t + 1;
														d = k[t];
														n = d[e]
														u, _ = b(f[n](f[n + 1]))
														s = _ + n - 1
														a = 0;
														for d = n, s do
															a = a + 1;
															f[d] = u[a];
														end;
														t = t + 1;
														d = k[t];
														n = d[e]
														u = {
															f[n](l(f, n + 1, s))
														};
														a = 0;
														for d = n, d[c] do
															a = a + 1;
															f[d] = u[a];
														end
														t = t + 1;
														d = k[t];
														t = d[h];
														break;
													end;
												else
													local n, s;
													for o = 0, 4 do
														if 1 >= o then
															if o ~= 1 then
																n = d[e];
																s = f[d[h]];
																f[n + 1] = s;
																f[n] = s[d[c]];
																t = t + 1;
																d = k[t];
															else
																f(d[e], d[h]);
																t = t + 1;
																d = k[t];
															end
														else
															if 3 > o then
																n = d[e]
																f[n] = f[n](l(f, n + 1, d[h]))
																t = t + 1;
																d = k[t];
															else
																if o ~= -1 then
																	for c = 25, 91 do
																		if o ~= 3 then
																			if not f[d[e]] then
																				t = t + 1;
																			else
																				t = d[h];
																			end;
																			break;
																		end;
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	if not f[d[e]] then
																		t = t + 1;
																	else
																		t = d[h];
																	end;
																end
															end
														end
													end
												end
											else
												if n >= 0 then
													for s = 30, 79 do
														if 2 < n then
															local s, p, u, b, a, n, r, _;
															for n = 0, 6 do
																if 2 >= n then
																	if 0 < n then
																		if n > -2 then
																			for c = 32, 56 do
																				if 2 ~= n then
																					n = 0;
																					while n > -1 do
																						if 3 > n then
																							if 1 > n then
																								s = d;
																							else
																								if -2 < n then
																									repeat
																										if 1 ~= n then
																											u = h;
																											break;
																										end;
																										p = e;
																									until true;
																								else
																									u = h;
																								end
																							end
																						else
																							if n <= 4 then
																								if n >= -1 then
																									for d = 23, 87 do
																										if n < 4 then
																											b = s[u];
																											break;
																										end;
																										a = s[p];
																										break;
																									end;
																								else
																									a = s[p];
																								end
																							else
																								if 2 ~= n then
																									for d = 47, 93 do
																										if 5 < n then
																											n = -2;
																											break;
																										end;
																										f(a, b);
																										break;
																									end;
																								else
																									f(a, b);
																								end
																							end
																						end
																						n = n + 1
																					end
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				r = d[e]
																				f[r](f[r + 1])
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			n = 0;
																			while n > -1 do
																				if 3 > n then
																					if 1 > n then
																						s = d;
																					else
																						if -2 < n then
																							repeat
																								if 1 ~= n then
																									u = h;
																									break;
																								end;
																								p = e;
																							until true;
																						else
																							u = h;
																						end
																					end
																				else
																					if n <= 4 then
																						if n >= -1 then
																							for d = 23, 87 do
																								if n < 4 then
																									b = s[u];
																									break;
																								end;
																								a = s[p];
																								break;
																							end;
																						else
																							a = s[p];
																						end
																					else
																						if 2 ~= n then
																							for d = 47, 93 do
																								if 5 < n then
																									n = -2;
																									break;
																								end;
																								f(a, b);
																								break;
																							end;
																						else
																							f(a, b);
																						end
																					end
																				end
																				n = n + 1
																			end
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if n < 5 then
																		if n ~= 1 then
																			for l = 43, 67 do
																				if n ~= 4 then
																					f[d[e]] = o[d[h]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				r = d[e];
																				_ = f[d[h]];
																				f[r + 1] = _;
																				f[r] = _[d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			r = d[e];
																			_ = f[d[h]];
																			f[r + 1] = _;
																			f[r] = _[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if n ~= 4 then
																			for c = 18, 81 do
																				if n < 6 then
																					n = 0;
																					while n > -1 do
																						if 2 >= n then
																							if n > 0 then
																								if n > 1 then
																									u = h;
																								else
																									p = e;
																								end
																							else
																								s = d;
																							end
																						else
																							if n >= 5 then
																								if 2 <= n then
																									for d = 38, 96 do
																										if 6 ~= n then
																											f(a, b);
																											break;
																										end;
																										n = -2;
																										break;
																									end;
																								else
																									n = -2;
																								end
																							else
																								if 4 ~= n then
																									b = s[u];
																								else
																									a = s[p];
																								end
																							end
																						end
																						n = n + 1
																					end
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				r = d[e]
																				f[r] = f[r](l(f, r + 1, d[h]))
																				break;
																			end;
																		else
																			r = d[e]
																			f[r] = f[r](l(f, r + 1, d[h]))
																		end
																	end
																end
															end
															break;
														end;
														local o, s, a, b, _, p, u, n;
														for n = 0, 9 do
															if 5 > n then
																if n > 1 then
																	if 3 <= n then
																		if n >= -1 then
																			for l = 16, 78 do
																				if 3 ~= n then
																					n = 0;
																					while n > -1 do
																						if 3 > n then
																							if n >= 1 then
																								if n ~= 0 then
																									for d = 38, 85 do
																										if 1 ~= n then
																											_ = h;
																											break;
																										end;
																										b = e;
																										break;
																									end;
																								else
																									b = e;
																								end
																							else
																								a = d;
																							end
																						else
																							if 4 < n then
																								if n ~= 4 then
																									repeat
																										if 5 < n then
																											n = -2;
																											break;
																										end;
																										f(u, p);
																									until true;
																								else
																									n = -2;
																								end
																							else
																								if 0 < n then
																									for d = 35, 95 do
																										if 4 > n then
																											p = a[_];
																											break;
																										end;
																										u = a[b];
																										break;
																									end;
																								else
																									u = a[b];
																								end
																							end
																						end
																						n = n + 1
																					end
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				o = d[e];
																				s = f[d[h]];
																				f[o + 1] = s;
																				f[o] = s[d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			o = d[e];
																			s = f[d[h]];
																			f[o + 1] = s;
																			f[o] = s[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		f[d[e]][d[h]] = f[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if 0 < n then
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																	else
																		o = d[e]
																		f[o] = f[o](f[o + 1])
																		t = t + 1;
																		d = k[t];
																	end
																end
															else
																if 7 > n then
																	if n >= 1 then
																		for c = 37, 61 do
																			if n < 6 then
																				f[d[e]] = (d[h] ~= 0);
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			o = d[e]
																			f[o](l(f, o + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f[d[e]] = (d[h] ~= 0);
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if 7 < n then
																		if n == 8 then
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																		else
																			o = d[e]
																			f[o] = f[o](l(f, o + 1, d[h]))
																		end
																	else
																		o = d[e];
																		s = f[d[h]];
																		f[o + 1] = s;
																		f[o] = s[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
														break;
													end;
												else
													local o, s, a, b, _, p, u, n;
													for n = 0, 9 do
														if 5 > n then
															if n > 1 then
																if 3 <= n then
																	if n >= -1 then
																		for l = 16, 78 do
																			if 3 ~= n then
																				n = 0;
																				while n > -1 do
																					if 3 > n then
																						if n >= 1 then
																							if n ~= 0 then
																								for d = 38, 85 do
																									if 1 ~= n then
																										_ = h;
																										break;
																									end;
																									b = e;
																									break;
																								end;
																							else
																								b = e;
																							end
																						else
																							a = d;
																						end
																					else
																						if 4 < n then
																							if n ~= 4 then
																								repeat
																									if 5 < n then
																										n = -2;
																										break;
																									end;
																									f(u, p);
																								until true;
																							else
																								n = -2;
																							end
																						else
																							if 0 < n then
																								for d = 35, 95 do
																									if 4 > n then
																										p = a[_];
																										break;
																									end;
																									u = a[b];
																									break;
																								end;
																							else
																								u = a[b];
																							end
																						end
																					end
																					n = n + 1
																				end
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			o = d[e];
																			s = f[d[h]];
																			f[o + 1] = s;
																			f[o] = s[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		o = d[e];
																		s = f[d[h]];
																		f[o + 1] = s;
																		f[o] = s[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	f[d[e]][d[h]] = f[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 0 < n then
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																else
																	o = d[e]
																	f[o] = f[o](f[o + 1])
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if 7 > n then
																if n >= 1 then
																	for c = 37, 61 do
																		if n < 6 then
																			f[d[e]] = (d[h] ~= 0);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		o = d[e]
																		f[o](l(f, o + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = (d[h] ~= 0);
																	t = t + 1;
																	d = k[t];
																end
															else
																if 7 < n then
																	if n == 8 then
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	else
																		o = d[e]
																		f[o] = f[o](l(f, o + 1, d[h]))
																	end
																else
																	o = d[e];
																	s = f[d[h]];
																	f[o + 1] = s;
																	f[o] = s[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										end
									else
										if n < 13 then
											if 10 >= n then
												if 6 ~= n then
													for r = 29, 86 do
														if n > 9 then
															local n, r;
															f[d[e]][d[h]] = f[d[c]];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															n = d[e]
															f[n](l(f, n + 1, d[h]))
															t = t + 1;
															d = k[t];
															n = d[e];
															r = f[d[h]];
															f[n + 1] = r;
															f[n] = r[d[c]];
															t = t + 1;
															d = k[t];
															f[d[e]] = {};
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = d[c];
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = d[c];
															break;
														end;
														f[d[e]][d[h]] = f[d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = d[c];
														t = t + 1;
														d = k[t];
														f[d[e]] = {};
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = f[d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = d[c];
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														break;
													end;
												else
													f[d[e]][d[h]] = f[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													f[d[e]] = {};
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = f[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
												end
											else
												if n > 8 then
													for l = 46, 85 do
														if 11 < n then
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = d[c];
															t = t + 1;
															d = k[t];
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = d[c];
															t = t + 1;
															d = k[t];
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = d[c];
															t = t + 1;
															d = k[t];
															f[d[e]] = r[d[h]];
															break;
														end;
														f[d[e]] = (d[h] ~= 0);
														break;
													end;
												else
													f[d[e]] = (d[h] ~= 0);
												end
											end
										else
											if 15 > n then
												if n >= 9 then
													repeat
														if n > 13 then
															local k = d[e];
															local e = {};
															for d = 1, #u do
																local d = u[d];
																for t = 0, #d do
																	local d = d[t];
																	local h = d[1];
																	local t = d[2];
																	if h == f and t >= k then
																		e[t] = h[t];
																		d[1] = e;
																	end;
																end;
															end;
															break;
														end;
														local e = d[e];
														local k = f[e]
														local c = f[e + 2];
														if (c > 0) then
															if (k > f[e + 1]) then
																t = d[h];
															else
																f[e + 3] = k;
															end
														elseif (k < f[e + 1]) then
															t = d[h];
														else
															f[e + 3] = k;
														end
													until true;
												else
													local e = d[e];
													local k = f[e]
													local c = f[e + 2];
													if (c > 0) then
														if (k > f[e + 1]) then
															t = d[h];
														else
															f[e + 3] = k;
														end
													elseif (k < f[e + 1]) then
														t = d[h];
													else
														f[e + 3] = k;
													end
												end
											else
												if 16 > n then
													if (f[d[e]] < f[d[c]]) then
														t = d[h];
													else
														t = t + 1;
													end;
												else
													if 16 == n then
														f[d[e]] = f[d[h]] * f[d[c]];
													else
														local n, r;
														f[d[e]] = f[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														n = d[e];
														r = f[d[h]];
														f[n + 1] = r;
														f[n] = r[d[c]];
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n](l(f, n + 1, d[h]))
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
													end
												end
											end
										end
									end
								end
							else
								if n >= 55 then
									if n >= 64 then
										if 69 > n then
											if n >= 66 then
												if 67 <= n then
													if 64 < n then
														for o = 39, 71 do
															if n > 67 then
																local s, u, _, o, a, n, p, b, g;
																for n = 0, 9 do
																	if n > 4 then
																		if 7 > n then
																			if 1 <= n then
																				repeat
																					if 5 < n then
																						f[d[e]][d[h]] = f[d[c]];
																						t = t + 1;
																						d = k[t];
																						break;
																					end;
																					p = d[h];
																					b = f[p]
																					for d = p + 1, d[c] do
																						b = b .. f[d];
																					end;
																					f[d[e]] = b;
																					t = t + 1;
																					d = k[t];
																				until true;
																			else
																				p = d[h];
																				b = f[p]
																				for d = p + 1, d[c] do
																					b = b .. f[d];
																				end;
																				f[d[e]] = b;
																				t = t + 1;
																				d = k[t];
																			end
																		else
																			if 8 > n then
																				f[d[e]][d[h]] = d[c];
																				t = t + 1;
																				d = k[t];
																			else
																				if n >= 5 then
																					repeat
																						if 9 > n then
																							g = d[e]
																							f[g](l(f, g + 1, d[h]))
																							t = t + 1;
																							d = k[t];
																							break;
																						end;
																						t = d[h];
																					until true;
																				else
																					t = d[h];
																				end
																			end
																		end
																	else
																		if n < 2 then
																			if n >= -1 then
																				for l = 17, 54 do
																					if 0 < n then
																						f[d[e]][d[h]] = d[c];
																						t = t + 1;
																						d = k[t];
																						break;
																					end;
																					f[d[e]] = {};
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																			else
																				f[d[e]][d[h]] = d[c];
																				t = t + 1;
																				d = k[t];
																			end
																		else
																			if n <= 2 then
																				n = 0;
																				while n > -1 do
																					if 2 >= n then
																						if 0 >= n then
																							s = d;
																						else
																							if 0 <= n then
																								repeat
																									if 1 ~= n then
																										_ = h;
																										break;
																									end;
																									u = e;
																								until true;
																							else
																								u = e;
																							end
																						end
																					else
																						if n > 4 then
																							if 4 < n then
																								for d = 19, 54 do
																									if n ~= 5 then
																										n = -2;
																										break;
																									end;
																									f(a, o);
																									break;
																								end;
																							else
																								f(a, o);
																							end
																						else
																							if n > 3 then
																								a = s[u];
																							else
																								o = s[_];
																							end
																						end
																					end
																					n = n + 1
																				end
																				t = t + 1;
																				d = k[t];
																			else
																				if 0 ~= n then
																					for c = 28, 63 do
																						if n > 3 then
																							n = 0;
																							while n > -1 do
																								if 3 > n then
																									if 0 < n then
																										if n == 2 then
																											_ = h;
																										else
																											u = e;
																										end
																									else
																										s = d;
																									end
																								else
																									if n > 4 then
																										if n > 4 then
																											for d = 14, 80 do
																												if n < 6 then
																													f(a, o);
																													break;
																												end;
																												n = -2;
																												break;
																											end;
																										else
																											f(a, o);
																										end
																									else
																										if 4 > n then
																											o = s[_];
																										else
																											a = s[u];
																										end
																									end
																								end
																								n = n + 1
																							end
																							t = t + 1;
																							d = k[t];
																							break;
																						end;
																						f[d[e]] = r[d[h]];
																						t = t + 1;
																						d = k[t];
																						break;
																					end;
																				else
																					n = 0;
																					while n > -1 do
																						if 3 > n then
																							if 0 < n then
																								if n == 2 then
																									_ = h;
																								else
																									u = e;
																								end
																							else
																								s = d;
																							end
																						else
																							if n > 4 then
																								if n > 4 then
																									for d = 14, 80 do
																										if n < 6 then
																											f(a, o);
																											break;
																										end;
																										n = -2;
																										break;
																									end;
																								else
																									f(a, o);
																								end
																							else
																								if 4 > n then
																									o = s[_];
																								else
																									a = s[u];
																								end
																							end
																						end
																						n = n + 1
																					end
																					t = t + 1;
																					d = k[t];
																				end
																			end
																		end
																	end
																end
																break;
															end;
															do
																return
															end;
															break;
														end;
													else
														local s, u, _, a, o, n, p, b, g;
														for n = 0, 9 do
															if n > 4 then
																if 7 > n then
																	if 1 <= n then
																		repeat
																			if 5 < n then
																				f[d[e]][d[h]] = f[d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			p = d[h];
																			b = f[p]
																			for d = p + 1, d[c] do
																				b = b .. f[d];
																			end;
																			f[d[e]] = b;
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		p = d[h];
																		b = f[p]
																		for d = p + 1, d[c] do
																			b = b .. f[d];
																		end;
																		f[d[e]] = b;
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if 8 > n then
																		f[d[e]][d[h]] = d[c];
																		t = t + 1;
																		d = k[t];
																	else
																		if n >= 5 then
																			repeat
																				if 9 > n then
																					g = d[e]
																					f[g](l(f, g + 1, d[h]))
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				t = d[h];
																			until true;
																		else
																			t = d[h];
																		end
																	end
																end
															else
																if n < 2 then
																	if n >= -1 then
																		for l = 17, 54 do
																			if 0 < n then
																				f[d[e]][d[h]] = d[c];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]] = {};
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f[d[e]][d[h]] = d[c];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if n <= 2 then
																		n = 0;
																		while n > -1 do
																			if 2 >= n then
																				if 0 >= n then
																					s = d;
																				else
																					if 0 <= n then
																						repeat
																							if 1 ~= n then
																								_ = h;
																								break;
																							end;
																							u = e;
																						until true;
																					else
																						u = e;
																					end
																				end
																			else
																				if n > 4 then
																					if 4 < n then
																						for d = 19, 54 do
																							if n ~= 5 then
																								n = -2;
																								break;
																							end;
																							f(o, a);
																							break;
																						end;
																					else
																						f(o, a);
																					end
																				else
																					if n > 3 then
																						o = s[u];
																					else
																						a = s[_];
																					end
																				end
																			end
																			n = n + 1
																		end
																		t = t + 1;
																		d = k[t];
																	else
																		if 0 ~= n then
																			for c = 28, 63 do
																				if n > 3 then
																					n = 0;
																					while n > -1 do
																						if 3 > n then
																							if 0 < n then
																								if n == 2 then
																									_ = h;
																								else
																									u = e;
																								end
																							else
																								s = d;
																							end
																						else
																							if n > 4 then
																								if n > 4 then
																									for d = 14, 80 do
																										if n < 6 then
																											f(o, a);
																											break;
																										end;
																										n = -2;
																										break;
																									end;
																								else
																									f(o, a);
																								end
																							else
																								if 4 > n then
																									a = s[_];
																								else
																									o = s[u];
																								end
																							end
																						end
																						n = n + 1
																					end
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]] = r[d[h]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			n = 0;
																			while n > -1 do
																				if 3 > n then
																					if 0 < n then
																						if n == 2 then
																							_ = h;
																						else
																							u = e;
																						end
																					else
																						s = d;
																					end
																				else
																					if n > 4 then
																						if n > 4 then
																							for d = 14, 80 do
																								if n < 6 then
																									f(o, a);
																									break;
																								end;
																								n = -2;
																								break;
																							end;
																						else
																							f(o, a);
																						end
																					else
																						if 4 > n then
																							a = s[_];
																						else
																							o = s[u];
																						end
																					end
																				end
																				n = n + 1
																			end
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
															end
														end
													end
												else
													for c = 0, 9 do
														if c < 5 then
															if c < 2 then
																if -1 < c then
																	for n = 30, 63 do
																		if 0 ~= c then
																			f[d[e]]();
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if c > 2 then
																	if c > -1 then
																		for n = 20, 87 do
																			if c < 4 then
																				f[d[e]]();
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]] = r[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f[d[e]]();
																		t = t + 1;
																		d = k[t];
																	end
																else
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if c < 7 then
																if 4 <= c then
																	repeat
																		if c > 5 then
																			f[d[e]] = r[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]]();
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]]();
																	t = t + 1;
																	d = k[t];
																end
															else
																if c <= 7 then
																	f[d[e]]();
																	t = t + 1;
																	d = k[t];
																else
																	if c ~= 8 then
																		f[d[e]]();
																	else
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
													end
												end
											else
												if 61 <= n then
													for o = 26, 59 do
														if 64 < n then
															local t = d[e]
															local e, d = b(f[t](l(f, t + 1, d[h])))
															s = d + t - 1
															local d = 0;
															for t = t, s do
																d = d + 1;
																f[t] = e[d];
															end;
															break;
														end;
														local o;
														for n = 0, 4 do
															if 1 < n then
																if 2 >= n then
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	if 0 <= n then
																		for r = 10, 76 do
																			if n ~= 3 then
																				o = d[e]
																				f[o](l(f, o + 1, d[h]))
																				break;
																			end;
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															else
																if n >= -4 then
																	for l = 45, 91 do
																		if n ~= 1 then
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
														break;
													end;
												else
													local t = d[e]
													local e, d = b(f[t](l(f, t + 1, d[h])))
													s = d + t - 1
													local d = 0;
													for t = t, s do
														d = d + 1;
														f[t] = e[d];
													end;
												end
											end
										else
											if n > 70 then
												if n <= 71 then
													local n, u, _, p, r, a;
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													n = d[e];
													u = f[d[h]];
													f[n + 1] = u;
													f[n] = u[d[c]];
													t = t + 1;
													d = k[t];
													n = d[e]
													a, p = b(f[n](f[n + 1]))
													s = p + n - 1
													r = 0;
													for d = n, s do
														r = r + 1;
														f[d] = a[r];
													end;
													t = t + 1;
													d = k[t];
													n = d[e]
													a = {
														f[n](l(f, n + 1, s))
													};
													r = 0;
													for d = n, d[c] do
														r = r + 1;
														f[d] = a[r];
													end
													t = t + 1;
													d = k[t];
													t = d[h];
												else
													if 68 <= n then
														for s = 39, 98 do
															if 73 ~= n then
																local r;
																for n = 0, 6 do
																	if n <= 2 then
																		if 0 < n then
																			if 1 == n then
																				r = d[e]
																				f[r] = f[r](l(f, r + 1, d[h]))
																				t = t + 1;
																				d = k[t];
																			else
																				f[d[e]] = o[d[h]];
																				t = t + 1;
																				d = k[t];
																			end
																		else
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if n >= 5 then
																			if n >= 3 then
																				for c = 42, 68 do
																					if 5 ~= n then
																						f(d[e], d[h]);
																						break;
																					end;
																					f(d[e], d[h]);
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																			else
																				f(d[e], d[h]);
																				t = t + 1;
																				d = k[t];
																			end
																		else
																			if n > 1 then
																				repeat
																					if n > 3 then
																						f(d[e], d[h]);
																						t = t + 1;
																						d = k[t];
																						break;
																					end;
																					f[d[e]] = f[d[h]][d[c]];
																					t = t + 1;
																					d = k[t];
																				until true;
																			else
																				f(d[e], d[h]);
																				t = t + 1;
																				d = k[t];
																			end
																		end
																	end
																end
																break;
															end;
															local a, o, s;
															for n = 0, 5 do
																if n >= 3 then
																	if 3 < n then
																		if n > 4 then
																			if not f[d[e]] then
																				t = t + 1;
																			else
																				t = d[h];
																			end;
																		else
																			f[d[e]] = r[d[h]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		r[d[h]] = f[d[e]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if 1 <= n then
																		if 0 <= n then
																			for r = 40, 69 do
																				if 2 ~= n then
																					f[d[e]][d[h]] = f[d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				s = d[e]
																				f[s](l(f, s + 1, d[h]))
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			f[d[e]][d[h]] = f[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		a = d[h];
																		o = f[a]
																		for d = a + 1, d[c] do
																			o = o .. f[d];
																		end;
																		f[d[e]] = o;
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
															break;
														end;
													else
														local r;
														for n = 0, 6 do
															if n <= 2 then
																if 0 < n then
																	if 1 == n then
																		r = d[e]
																		f[r] = f[r](l(f, r + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	else
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																end
															else
																if n >= 5 then
																	if n >= 3 then
																		for c = 42, 68 do
																			if 5 ~= n then
																				f(d[e], d[h]);
																				break;
																			end;
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if n > 1 then
																		repeat
																			if n > 3 then
																				f(d[e], d[h]);
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
													end
												end
											else
												if 66 < n then
													for r = 40, 85 do
														if n ~= 69 then
															local n, r;
															for o = 0, 6 do
																if o > 2 then
																	if 5 <= o then
																		if 3 < o then
																			repeat
																				if o ~= 5 then
																					f(d[e], d[h]);
																					break;
																				end;
																				n = d[e];
																				r = f[d[h]];
																				f[n + 1] = r;
																				f[n] = r[d[c]];
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			n = d[e];
																			r = f[d[h]];
																			f[n + 1] = r;
																			f[n] = r[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if o == 4 then
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		else
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																else
																	if 0 < o then
																		if o >= -3 then
																			repeat
																				if 2 > o then
																					f(d[e], d[h]);
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				n = d[e]
																				f[n] = f[n](l(f, n + 1, d[h]))
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			n = d[e]
																			f[n] = f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
															break;
														end;
														o[d[h]] = f[d[e]];
														break;
													end;
												else
													local n, r;
													for o = 0, 6 do
														if o > 2 then
															if 5 <= o then
																if 3 < o then
																	repeat
																		if o ~= 5 then
																			f(d[e], d[h]);
																			break;
																		end;
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	n = d[e];
																	r = f[d[h]];
																	f[n + 1] = r;
																	f[n] = r[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if o == 4 then
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if 0 < o then
																if o >= -3 then
																	repeat
																		if 2 > o then
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															else
																n = d[e];
																r = f[d[h]];
																f[n + 1] = r;
																f[n] = r[d[c]];
																t = t + 1;
																d = k[t];
															end
														end
													end
												end
											end
										end
									else
										if 58 >= n then
											if n <= 56 then
												if n == 55 then
													local n;
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													if (f[d[e]] <= f[d[c]]) then
														t = t + 1;
													else
														t = d[h];
													end;
												else
													if (d[e] < f[d[c]]) then
														t = d[h];
													else
														t = t + 1;
													end;
												end
											else
												if 57 < n then
													local n, r;
													for s = 0, 6 do
														if s <= 2 then
															if 0 < s then
																if -2 ~= s then
																	for c = 12, 87 do
																		if 2 ~= s then
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																end
															else
																n = d[e];
																r = f[d[h]];
																f[n + 1] = r;
																f[n] = r[d[c]];
																t = t + 1;
																d = k[t];
															end
														else
															if 4 >= s then
																if s ~= 0 then
																	for l = 20, 97 do
																		if s < 4 then
																			n = d[e];
																			r = f[d[h]];
																			f[n + 1] = r;
																			f[n] = r[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	n = d[e];
																	r = f[d[h]];
																	f[n + 1] = r;
																	f[n] = r[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if s == 5 then
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																else
																	f[d[e]] = o[d[h]];
																end
															end
														end
													end
												else
													local o;
													for n = 0, 4 do
														if 2 <= n then
															if n > 2 then
																if 4 > n then
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																else
																	o = d[e]
																	f[o](l(f, o + 1, d[h]))
																end
															else
																f[d[e]] = f[d[h]][d[c]];
																t = t + 1;
																d = k[t];
															end
														else
															if n >= -4 then
																for l = 23, 60 do
																	if 0 ~= n then
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																	break;
																end;
															else
																f[d[e]] = r[d[h]];
																t = t + 1;
																d = k[t];
															end
														end
													end
												end
											end
										else
											if n < 61 then
												if 57 <= n then
													for c = 21, 87 do
														if n ~= 60 then
															for c = 0, 3 do
																if 2 > c then
																	if c ~= 0 then
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	else
																		o[d[h]] = f[d[e]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if c > 0 then
																		repeat
																			if 3 > c then
																				f[d[e]]();
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			if f[d[e]] then
																				t = t + 1;
																			else
																				t = d[h];
																			end;
																		until true;
																	else
																		f[d[e]]();
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
															break;
														end;
														local d = d[e]
														f[d] = f[d](l(f, d + 1, s))
														break;
													end;
												else
													for c = 0, 3 do
														if 2 > c then
															if c ~= 0 then
																f[d[e]] = o[d[h]];
																t = t + 1;
																d = k[t];
															else
																o[d[h]] = f[d[e]];
																t = t + 1;
																d = k[t];
															end
														else
															if c > 0 then
																repeat
																	if 3 > c then
																		f[d[e]]();
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																	if f[d[e]] then
																		t = t + 1;
																	else
																		t = d[h];
																	end;
																until true;
															else
																f[d[e]]();
																t = t + 1;
																d = k[t];
															end
														end
													end
												end
											else
												if 62 <= n then
													if n ~= 58 then
														for l = 16, 53 do
															if 63 ~= n then
																local n;
																for l = 0, 3 do
																	if l > 1 then
																		if l ~= 2 then
																			f[d[e]][f[d[h]]] = f[d[c]];
																		else
																			f[d[e]][f[d[h]]] = f[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if 1 ~= l then
																			f[d[e]] = f[d[h]];
																			t = t + 1;
																			d = k[t];
																		else
																			n = d[e]
																			f[n] = f[n](f[n + 1])
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
																break;
															end;
															local d = d[e];
															s = d + m - 1;
															for t = d, s do
																local d = g[t - d];
																f[t] = d;
															end;
															break;
														end;
													else
														local d = d[e];
														s = d + m - 1;
														for t = d, s do
															local d = g[t - d];
															f[t] = d;
														end;
													end
												else
													if (f[d[e]] < d[c]) then
														t = d[h];
													else
														t = t + 1;
													end;
												end
											end
										end
									end
								else
									if n > 45 then
										if n < 50 then
											if 48 <= n then
												if n ~= 48 then
													if (f[d[e]] ~= d[c]) then
														t = t + 1;
													else
														t = d[h];
													end;
												else
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
												end
											else
												if n > 45 then
													for r = 14, 79 do
														if 46 ~= n then
															local n;
															f[d[e]] = f[d[h]][d[c]];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															n = d[e]
															f[n] = f[n](l(f, n + 1, d[h]))
															t = t + 1;
															d = k[t];
															f[d[e]] = o[d[h]];
															break;
														end;
														if (f[d[e]] <= f[d[c]]) then
															t = t + 1;
														else
															t = d[h];
														end;
														break;
													end;
												else
													if (f[d[e]] <= f[d[c]]) then
														t = t + 1;
													else
														t = d[h];
													end;
												end
											end
										else
											if n >= 52 then
												if 52 < n then
													if n ~= 52 then
														for r = 49, 98 do
															if 53 < n then
																if (f[d[e]] < f[d[c]]) then
																	t = d[h];
																else
																	t = t + 1;
																end;
																break;
															end;
															local n, r;
															f[d[e]] = o[d[h]];
															t = t + 1;
															d = k[t];
															n = d[e];
															r = f[d[h]];
															f[n + 1] = r;
															f[n] = r[d[c]];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															n = d[e]
															f[n] = f[n](l(f, n + 1, d[h]))
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]][d[c]];
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]][d[c]];
															t = t + 1;
															d = k[t];
															if not f[d[e]] then
																t = t + 1;
															else
																t = d[h];
															end;
															break;
														end;
													else
														if (f[d[e]] < f[d[c]]) then
															t = d[h];
														else
															t = t + 1;
														end;
													end
												else
													local n, o;
													for r = 0, 6 do
														if r < 3 then
															if 0 < r then
																if -2 ~= r then
																	repeat
																		if r ~= 2 then
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e]
																		f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	n = d[e]
																	f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															else
																f[d[e]][d[h]] = f[d[c]];
																t = t + 1;
																d = k[t];
															end
														else
															if 5 <= r then
																if r >= 3 then
																	repeat
																		if r ~= 5 then
																			f[d[e]][d[h]] = d[c];
																			break;
																		end;
																		f[d[e]][d[h]] = d[c];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]][d[h]] = d[c];
																	t = t + 1;
																	d = k[t];
																end
															else
																if r ~= 3 then
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																else
																	n = d[e];
																	o = f[d[h]];
																	f[n + 1] = o;
																	f[n] = o[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											else
												if 50 < n then
													local k, n, l, o, r, c;
													local t = 0;
													while t > -1 do
														if t <= 3 then
															if 1 < t then
																if 0 < t then
																	for d = 36, 59 do
																		if t ~= 2 then
																			o = f;
																			break;
																		end;
																		l = h;
																		break;
																	end;
																else
																	l = h;
																end
															else
																if -3 ~= t then
																	for f = 17, 98 do
																		if t > 0 then
																			n = e;
																			break;
																		end;
																		k = d;
																		break;
																	end;
																else
																	k = d;
																end
															end
														else
															if 6 > t then
																if t > 2 then
																	repeat
																		if t ~= 5 then
																			r = o[k[l]];
																			break;
																		end;
																		c = k[n];
																	until true;
																else
																	c = k[n];
																end
															else
																if 5 <= t then
																	for d = 22, 79 do
																		if t > 6 then
																			t = -2;
																			break;
																		end;
																		f[c] = r;
																		break;
																	end;
																else
																	f[c] = r;
																end
															end
														end
														t = t + 1
													end
												else
													local r;
													for n = 0, 4 do
														if n < 2 then
															if 1 == n then
																f(d[e], d[h]);
																t = t + 1;
																d = k[t];
															else
																f[d[e]] = f[d[h]];
																t = t + 1;
																d = k[t];
															end
														else
															if n >= 3 then
																if n < 4 then
																	r = d[e]
																	f[r] = f[r](l(f, r + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																else
																	if (f[d[e]] ~= d[c]) then
																		t = t + 1;
																	else
																		t = d[h];
																	end;
																end
															else
																f(d[e], d[h]);
																t = t + 1;
																d = k[t];
															end
														end
													end
												end
											end
										end
									else
										if 41 <= n then
											if 43 > n then
												if 37 ~= n then
													for r = 35, 69 do
														if n ~= 41 then
															local c, r, k, l, n;
															local t = 0;
															while t > -1 do
																if 2 >= t then
																	if t >= 1 then
																		if 0 <= t then
																			for d = 48, 57 do
																				if t < 2 then
																					r = e;
																					break;
																				end;
																				k = h;
																				break;
																			end;
																		else
																			k = h;
																		end
																	else
																		c = d;
																	end
																else
																	if 5 <= t then
																		if t ~= 6 then
																			f(n, l);
																		else
																			t = -2;
																		end
																	else
																		if t == 4 then
																			n = c[r];
																		else
																			l = c[k];
																		end
																	end
																end
																t = t + 1
															end
															break;
														end;
														local n, r;
														for o = 0, 4 do
															if 2 > o then
																if o > -1 then
																	for l = 35, 65 do
																		if o < 1 then
																			n = d[e];
																			r = f[d[h]];
																			f[n + 1] = r;
																			f[n] = r[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																end
															else
																if 3 <= o then
																	if o == 4 then
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																	else
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															end
														end
														break;
													end;
												else
													local k, l, c, n, r;
													local t = 0;
													while t > -1 do
														if 2 >= t then
															if t >= 1 then
																if 0 <= t then
																	for d = 48, 57 do
																		if t < 2 then
																			l = e;
																			break;
																		end;
																		c = h;
																		break;
																	end;
																else
																	c = h;
																end
															else
																k = d;
															end
														else
															if 5 <= t then
																if t ~= 6 then
																	f(r, n);
																else
																	t = -2;
																end
															else
																if t == 4 then
																	r = k[l];
																else
																	n = k[c];
																end
															end
														end
														t = t + 1
													end
												end
											else
												if 44 <= n then
													if 40 ~= n then
														for k = 30, 52 do
															if 45 ~= n then
																f[d[e]] = f[d[h]] + f[d[c]];
																break;
															end;
															if (f[d[e]] < f[d[c]]) then
																t = t + 1;
															else
																t = d[h];
															end;
															break;
														end;
													else
														f[d[e]] = f[d[h]] + f[d[c]];
													end
												else
													local d = d[e]
													local e, t = b(f[d](f[d + 1]))
													s = t + d - 1
													local t = 0;
													for d = d, s do
														t = t + 1;
														f[d] = e[t];
													end;
												end
											end
										else
											if 38 < n then
												if 39 < n then
													local o, s, a, u, b, _, p, g, n;
													o = d[e];
													s = f[d[h]];
													f[o + 1] = s;
													f[o] = s[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]];
													t = t + 1;
													d = k[t];
													n = 0;
													while n > -1 do
														if n <= 3 then
															if n >= 2 then
																if n ~= -1 then
																	repeat
																		if 2 < n then
																			_ = f;
																			break;
																		end;
																		b = h;
																	until true;
																else
																	b = h;
																end
															else
																if n > -2 then
																	repeat
																		if 0 < n then
																			u = e;
																			break;
																		end;
																		a = d;
																	until true;
																else
																	u = e;
																end
															end
														else
															if n >= 6 then
																if 4 < n then
																	repeat
																		if 6 ~= n then
																			n = -2;
																			break;
																		end;
																		f[g] = p;
																	until true;
																else
																	n = -2;
																end
															else
																if n > 3 then
																	repeat
																		if n ~= 4 then
																			g = a[u];
																			break;
																		end;
																		p = _[a[b]];
																	until true;
																else
																	p = _[a[b]];
																end
															end
														end
														n = n + 1
													end
													t = t + 1;
													d = k[t];
													o = d[e]
													f[o] = f[o](l(f, o + 1, d[h]))
													t = t + 1;
													d = k[t];
													o = d[e];
													s = f[d[h]];
													f[o + 1] = s;
													f[o] = s[d[c]];
													t = t + 1;
													d = k[t];
													o = d[e]
													f[o](f[o + 1])
												else
													local n, r;
													for l = 0, 4 do
														if l <= 1 then
															if l > 0 then
																n = d[e];
																r = f[d[h]];
																f[n + 1] = r;
																f[n] = r[d[c]];
																t = t + 1;
																d = k[t];
															else
																n = d[e]
																f[n](f[n + 1])
																t = t + 1;
																d = k[t];
															end
														else
															if 3 <= l then
																if l ~= -1 then
																	repeat
																		if l ~= 4 then
																			f[d[e]] = #f[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		if (d[e] < f[d[c]]) then
																			t = d[h];
																		else
																			t = t + 1;
																		end;
																	until true;
																else
																	f[d[e]] = #f[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															else
																n = d[e]
																f[n] = f[n](f[n + 1])
																t = t + 1;
																d = k[t];
															end
														end
													end
												end
											else
												if 36 < n then
													for o = 42, 69 do
														if n > 37 then
															local l, o;
															for n = 0, 4 do
																if n < 2 then
																	if n < 1 then
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																	else
																		l = d[e];
																		o = f[d[h]];
																		f[l + 1] = o;
																		f[l] = o[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if n < 3 then
																		f[d[e]] = {};
																		t = t + 1;
																		d = k[t];
																	else
																		if 3 ~= n then
																			if f[d[e]] then
																				t = t + 1;
																			else
																				t = d[h];
																			end;
																		else
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
															end
															break;
														end;
														local s, u, a, _, p, n, o, b;
														for n = 0, 6 do
															if 3 > n then
																if n >= 1 then
																	if n ~= 2 then
																		n = 0;
																		while n > -1 do
																			if 2 >= n then
																				if n <= 0 then
																					s = d;
																				else
																					if -2 <= n then
																						repeat
																							if n ~= 1 then
																								a = h;
																								break;
																							end;
																							u = e;
																						until true;
																					else
																						a = h;
																					end
																				end
																			else
																				if n > 4 then
																					if 2 ~= n then
																						for d = 33, 94 do
																							if n < 6 then
																								f(p, _);
																								break;
																							end;
																							n = -2;
																							break;
																						end;
																					else
																						n = -2;
																					end
																				else
																					if 3 ~= n then
																						p = s[u];
																					else
																						_ = s[a];
																					end
																				end
																			end
																			n = n + 1
																		end
																		t = t + 1;
																		d = k[t];
																	else
																		o = d[e]
																		f[o](l(f, o + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	end
																else
																	f[d[e]][d[h]] = f[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 5 > n then
																	if n == 3 then
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																	else
																		o = d[e];
																		b = f[d[h]];
																		f[o + 1] = b;
																		f[o] = b[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if n > 5 then
																		f[d[e]][d[h]] = d[c];
																	else
																		f[d[e]] = {};
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
														break;
													end;
												else
													local b, _, a, u, p, n, o, s;
													for n = 0, 6 do
														if 3 > n then
															if n >= 1 then
																if n ~= 2 then
																	n = 0;
																	while n > -1 do
																		if 2 >= n then
																			if n <= 0 then
																				b = d;
																			else
																				if -2 <= n then
																					repeat
																						if n ~= 1 then
																							a = h;
																							break;
																						end;
																						_ = e;
																					until true;
																				else
																					a = h;
																				end
																			end
																		else
																			if n > 4 then
																				if 2 ~= n then
																					for d = 33, 94 do
																						if n < 6 then
																							f(p, u);
																							break;
																						end;
																						n = -2;
																						break;
																					end;
																				else
																					n = -2;
																				end
																			else
																				if 3 ~= n then
																					p = b[_];
																				else
																					u = b[a];
																				end
																			end
																		end
																		n = n + 1
																	end
																	t = t + 1;
																	d = k[t];
																else
																	o = d[e]
																	f[o](l(f, o + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															else
																f[d[e]][d[h]] = f[d[c]];
																t = t + 1;
																d = k[t];
															end
														else
															if 5 > n then
																if n == 3 then
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																else
																	o = d[e];
																	s = f[d[h]];
																	f[o + 1] = s;
																	f[o] = s[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if n > 5 then
																	f[d[e]][d[h]] = d[c];
																else
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						else
							if 110 < n then
								if 130 <= n then
									if n >= 139 then
										if 143 >= n then
											if 141 > n then
												if 135 <= n then
													for o = 14, 79 do
														if n ~= 139 then
															f[d[e]] = r[d[h]];
															break;
														end;
														local n, o;
														for r = 0, 4 do
															if 2 <= r then
																if r <= 2 then
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																else
																	if 1 ~= r then
																		repeat
																			if r < 4 then
																				n = d[e]
																				f[n] = f[n](l(f, n + 1, d[h]))
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			if not f[d[e]] then
																				t = t + 1;
																			else
																				t = d[h];
																			end;
																		until true;
																	else
																		if not f[d[e]] then
																			t = t + 1;
																		else
																			t = d[h];
																		end;
																	end
																end
															else
																if r < 1 then
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	n = d[e];
																	o = f[d[h]];
																	f[n + 1] = o;
																	f[n] = o[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
														break;
													end;
												else
													local n, o;
													for r = 0, 4 do
														if 2 <= r then
															if r <= 2 then
																f(d[e], d[h]);
																t = t + 1;
																d = k[t];
															else
																if 1 ~= r then
																	repeat
																		if r < 4 then
																			n = d[e]
																			f[n] = f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		if not f[d[e]] then
																			t = t + 1;
																		else
																			t = d[h];
																		end;
																	until true;
																else
																	if not f[d[e]] then
																		t = t + 1;
																	else
																		t = d[h];
																	end;
																end
															end
														else
															if r < 1 then
																f[d[e]] = f[d[h]][d[c]];
																t = t + 1;
																d = k[t];
															else
																n = d[e];
																o = f[d[h]];
																f[n + 1] = o;
																f[n] = o[d[c]];
																t = t + 1;
																d = k[t];
															end
														end
													end
												end
											else
												if 142 > n then
													local s, o, a;
													for n = 0, 5 do
														if 3 <= n then
															if n <= 3 then
																r[d[h]] = f[d[e]];
																t = t + 1;
																d = k[t];
															else
																if 0 < n then
																	repeat
																		if n ~= 5 then
																			f[d[e]] = r[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		if not f[d[e]] then
																			t = t + 1;
																		else
																			t = d[h];
																		end;
																	until true;
																else
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if n <= 0 then
																s = d[h];
																o = f[s]
																for d = s + 1, d[c] do
																	o = o .. f[d];
																end;
																f[d[e]] = o;
																t = t + 1;
																d = k[t];
															else
																if -1 ~= n then
																	repeat
																		if n ~= 2 then
																			f[d[e]][d[h]] = f[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		a = d[e]
																		f[a](l(f, a + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]][d[h]] = f[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												else
													if 139 ~= n then
														repeat
															if 143 ~= n then
																local n, l;
																for o = 0, 4 do
																	if o > 1 then
																		if o >= 3 then
																			if o > 2 then
																				for n = 13, 94 do
																					if 4 ~= o then
																						f[d[e]][d[h]] = d[c];
																						t = t + 1;
																						d = k[t];
																						break;
																					end;
																					if f[d[e]] then
																						t = t + 1;
																					else
																						t = d[h];
																					end;
																					break;
																				end;
																			else
																				if f[d[e]] then
																					t = t + 1;
																				else
																					t = d[h];
																				end;
																			end
																		else
																			f[d[e]] = {};
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if -1 <= o then
																			for s = 24, 56 do
																				if 0 < o then
																					n = d[e];
																					l = f[d[h]];
																					f[n + 1] = l;
																					f[n] = l[d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]] = r[d[h]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			n = d[e];
																			l = f[d[h]];
																			f[n + 1] = l;
																			f[n] = l[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
																break;
															end;
															local e = d[e];
															local k = f[e]
															local c = f[e + 2];
															if (c > 0) then
																if (k > f[e + 1]) then
																	t = d[h];
																else
																	f[e + 3] = k;
																end
															elseif (k < f[e + 1]) then
																t = d[h];
															else
																f[e + 3] = k;
															end
														until true;
													else
														local n, l;
														for o = 0, 4 do
															if o > 1 then
																if o >= 3 then
																	if o > 2 then
																		for n = 13, 94 do
																			if 4 ~= o then
																				f[d[e]][d[h]] = d[c];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			if f[d[e]] then
																				t = t + 1;
																			else
																				t = d[h];
																			end;
																			break;
																		end;
																	else
																		if f[d[e]] then
																			t = t + 1;
																		else
																			t = d[h];
																		end;
																	end
																else
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																end
															else
																if -1 <= o then
																	for s = 24, 56 do
																		if 0 < o then
																			n = d[e];
																			l = f[d[h]];
																			f[n + 1] = l;
																			f[n] = l[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	n = d[e];
																	l = f[d[h]];
																	f[n + 1] = l;
																	f[n] = l[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										else
											if n >= 146 then
												if n >= 147 then
													if n == 147 then
														do
															return
														end;
													else
														local d = d[e]
														f[d] = f[d](f[d + 1])
													end
												else
													local n, a;
													for s = 0, 6 do
														if 3 > s then
															if 1 > s then
																f[d[e]] = r[d[h]];
																t = t + 1;
																d = k[t];
															else
																if s ~= 1 then
																	f[d[e]][d[h]] = f[d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if s > 4 then
																if 4 <= s then
																	for c = 38, 77 do
																		if 5 ~= s then
																			n = d[e]
																			f[n] = f[n](l(f, n + 1, d[h]))
																			break;
																		end;
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																end
															else
																if s > 0 then
																	repeat
																		if 3 ~= s then
																			n = d[e];
																			a = f[d[h]];
																			f[n + 1] = a;
																			f[n] = a[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	n = d[e];
																	a = f[d[h]];
																	f[n + 1] = a;
																	f[n] = a[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											else
												if 140 <= n then
													repeat
														if 145 ~= n then
															local t = d[e]
															f[t] = f[t](l(f, t + 1, d[h]))
															break;
														end;
														local h = d[h];
														local t = f[h]
														for d = h + 1, d[c] do
															t = t .. f[d];
														end;
														f[d[e]] = t;
													until true;
												else
													local t = d[e]
													f[t] = f[t](l(f, t + 1, d[h]))
												end
											end
										end
									else
										if n < 134 then
											if 131 < n then
												if 131 ~= n then
													for s = 19, 72 do
														if 132 < n then
															local n, s;
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															n = d[e];
															s = f[d[h]];
															f[n + 1] = s;
															f[n] = s[d[c]];
															t = t + 1;
															d = k[t];
															f[d[e]] = o[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]][d[c]];
															t = t + 1;
															d = k[t];
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]][d[c]];
															t = t + 1;
															d = k[t];
															n = d[e]
															f[n](l(f, n + 1, d[h]))
															break;
														end;
														t = d[h];
														break;
													end;
												else
													local n, s;
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													n = d[e];
													s = f[d[h]];
													f[n + 1] = s;
													f[n] = s[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n](l(f, n + 1, d[h]))
												end
											else
												if 126 <= n then
													for o = 30, 68 do
														if n < 131 then
															local n, r;
															n = d[e]
															f[n] = f[n](f[n + 1])
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = f[d[c]];
															t = t + 1;
															d = k[t];
															n = d[e];
															r = f[d[h]];
															f[n + 1] = r;
															f[n] = r[d[c]];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															f[d[e]] = (d[h] ~= 0);
															t = t + 1;
															d = k[t];
															n = d[e]
															f[n](l(f, n + 1, d[h]))
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = d[c];
															break;
														end;
														for n = 0, 6 do
															if n <= 2 then
																if 0 >= n then
																	f[d[e]][d[h]] = f[d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	if n >= -3 then
																		repeat
																			if n ~= 2 then
																				f[d[e]] = r[d[h]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]] = r[d[h]];
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															else
																if n <= 4 then
																	if 3 ~= n then
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																	else
																		f[d[e]][d[h]] = f[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if n ~= 3 then
																		for l = 29, 52 do
																			if 5 ~= n then
																				f[d[e]][d[h]] = f[d[c]];
																				break;
																			end;
																			f[d[e]] = r[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
														break;
													end;
												else
													for n = 0, 6 do
														if n <= 2 then
															if 0 >= n then
																f[d[e]][d[h]] = f[d[c]];
																t = t + 1;
																d = k[t];
															else
																if n >= -3 then
																	repeat
																		if n ~= 2 then
																			f[d[e]] = r[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if n <= 4 then
																if 3 ~= n then
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																else
																	f[d[e]][d[h]] = f[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if n ~= 3 then
																	for l = 29, 52 do
																		if 5 ~= n then
																			f[d[e]][d[h]] = f[d[c]];
																			break;
																		end;
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										else
											if 136 > n then
												if n > 131 then
													for o = 20, 78 do
														if n > 134 then
															f[d[e]][f[d[h]]] = f[d[c]];
															break;
														end;
														local o, p, u, g, _, b, a, s, n;
														f[d[e]] = r[d[h]];
														t = t + 1;
														d = k[t];
														o = d[e]
														f[o](f[o + 1])
														t = t + 1;
														d = k[t];
														f[d[e]] = r[d[h]];
														t = t + 1;
														d = k[t];
														o = d[e];
														p = f[d[h]];
														f[o + 1] = p;
														f[o] = p[d[c]];
														t = t + 1;
														d = k[t];
														n = 0;
														while n > -1 do
															if 3 < n then
																if 5 >= n then
																	if n == 5 then
																		s = u[g];
																	else
																		a = b[u[_]];
																	end
																else
																	if n > 2 then
																		repeat
																			if n ~= 7 then
																				f[s] = a;
																				break;
																			end;
																			n = -2;
																		until true;
																	else
																		f[s] = a;
																	end
																end
															else
																if 2 <= n then
																	if 1 ~= n then
																		for d = 45, 73 do
																			if 3 ~= n then
																				_ = h;
																				break;
																			end;
																			b = f;
																			break;
																		end;
																	else
																		b = f;
																	end
																else
																	if 0 < n then
																		g = e;
																	else
																		u = d;
																	end
																end
															end
															n = n + 1
														end
														t = t + 1;
														d = k[t];
														o = d[e]
														f[o](l(f, o + 1, d[h]))
														t = t + 1;
														d = k[t];
														f[d[e]] = r[d[h]];
														break;
													end;
												else
													f[d[e]][f[d[h]]] = f[d[c]];
												end
											else
												if n >= 137 then
													if n ~= 137 then
														local s, p, b, _, a, n, r, u;
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														n = 0;
														while n > -1 do
															if 2 < n then
																if 5 <= n then
																	if n >= 3 then
																		repeat
																			if 6 ~= n then
																				f(a, _);
																				break;
																			end;
																			n = -2;
																		until true;
																	else
																		n = -2;
																	end
																else
																	if n > 1 then
																		repeat
																			if 3 < n then
																				a = s[p];
																				break;
																			end;
																			_ = s[b];
																		until true;
																	else
																		a = s[p];
																	end
																end
															else
																if 1 > n then
																	s = d;
																else
																	if n > -1 then
																		repeat
																			if 1 ~= n then
																				b = h;
																				break;
																			end;
																			p = e;
																		until true;
																	else
																		b = h;
																	end
																end
															end
															n = n + 1
														end
														t = t + 1;
														d = k[t];
														r = d[e]
														f[r](f[r + 1])
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														r = d[e];
														u = f[d[h]];
														f[r + 1] = u;
														f[r] = u[d[c]];
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														r = d[e]
														f[r] = f[r](l(f, r + 1, d[h]))
													else
														local l;
														for n = 0, 4 do
															if n > 1 then
																if 3 <= n then
																	if 0 <= n then
																		for r = 47, 75 do
																			if 4 > n then
																				f[d[e]] = f[d[h]][d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			l = f[d[c]];
																			if l then
																				t = t + 1;
																			else
																				f[d[e]] = l;
																				t = d[h];
																			end;
																			break;
																		end;
																	else
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if -4 ~= n then
																	repeat
																		if 0 < n then
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]] = o[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												else
													f[d[e]] = (d[h] ~= 0);
													t = t + 1;
												end
											end
										end
									end
								else
									if 120 <= n then
										if n <= 124 then
											if 121 >= n then
												if 116 <= n then
													for r = 40, 82 do
														if 121 > n then
															local r, s, u, p, _, b, a, n;
															for n = 0, 7 do
																if n < 4 then
																	if 2 <= n then
																		if n ~= 3 then
																			n = 0;
																			while n > -1 do
																				if 2 >= n then
																					if n < 1 then
																						u = d;
																					else
																						if 1 < n then
																							_ = h;
																						else
																							p = e;
																						end
																					end
																				else
																					if n <= 4 then
																						if n == 4 then
																							a = u[p];
																						else
																							b = u[_];
																						end
																					else
																						if 4 < n then
																							for d = 26, 66 do
																								if n > 5 then
																									n = -2;
																									break;
																								end;
																								f(a, b);
																								break;
																							end;
																						else
																							f(a, b);
																						end
																					end
																				end
																				n = n + 1
																			end
																			t = t + 1;
																			d = k[t];
																		else
																			r = d[e]
																			f[r] = f[r](l(f, r + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if 0 == n then
																			f[d[e]] = o[d[h]];
																			t = t + 1;
																			d = k[t];
																		else
																			r = d[e];
																			s = f[d[h]];
																			f[r + 1] = s;
																			f[r] = s[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																else
																	if n < 6 then
																		if 3 <= n then
																			repeat
																				if 5 ~= n then
																					r = d[e];
																					s = f[d[h]];
																					f[r + 1] = s;
																					f[r] = s[d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f(d[e], d[h]);
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			r = d[e];
																			s = f[d[h]];
																			f[r + 1] = s;
																			f[r] = s[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if n >= 3 then
																			for c = 23, 82 do
																				if n ~= 7 then
																					r = d[e]
																					f[r] = f[r](l(f, r + 1, d[h]))
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				if f[d[e]] then
																					t = t + 1;
																				else
																					t = d[h];
																				end;
																				break;
																			end;
																		else
																			r = d[e]
																			f[r] = f[r](l(f, r + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
															end
															break;
														end;
														local r;
														for n = 0, 6 do
															if 3 > n then
																if 1 <= n then
																	if 0 < n then
																		repeat
																			if n < 2 then
																				f[d[e]] = f[d[h]][d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	end
																else
																	f[d[e]] = o[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 5 > n then
																	if n == 3 then
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	else
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if n > 5 then
																		r = d[e]
																		f[r] = f[r](l(f, r + 1, d[h]))
																	else
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
														break;
													end;
												else
													local r;
													for n = 0, 6 do
														if 3 > n then
															if 1 <= n then
																if 0 < n then
																	repeat
																		if n < 2 then
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																end
															else
																f[d[e]] = o[d[h]];
																t = t + 1;
																d = k[t];
															end
														else
															if 5 > n then
																if n == 3 then
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																else
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																end
															else
																if n > 5 then
																	r = d[e]
																	f[r] = f[r](l(f, r + 1, d[h]))
																else
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											else
												if 122 >= n then
													local n, p, a, _, r, u;
													for a = 0, 5 do
														if 3 <= a then
															if 4 > a then
																n = d[e]
																u, _ = b(f[n](f[n + 1]))
																s = _ + n - 1
																r = 0;
																for d = n, s do
																	r = r + 1;
																	f[d] = u[r];
																end;
																t = t + 1;
																d = k[t];
															else
																if a >= 0 then
																	for o = 35, 62 do
																		if 4 ~= a then
																			t = d[h];
																			break;
																		end;
																		n = d[e]
																		u = {
																			f[n](l(f, n + 1, s))
																		};
																		r = 0;
																		for d = n, d[c] do
																			r = r + 1;
																			f[d] = u[r];
																		end
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	t = d[h];
																end
															end
														else
															if 1 <= a then
																if a ~= 2 then
																	f[d[e]] = o[d[h]];
																	t = t + 1;
																	d = k[t];
																else
																	n = d[e];
																	p = f[d[h]];
																	f[n + 1] = p;
																	f[n] = p[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																f[d[e]] = f[d[h]];
																t = t + 1;
																d = k[t];
															end
														end
													end
												else
													if n >= 119 then
														for k = 30, 58 do
															if n ~= 123 then
																f[d[e]] = o[d[h]];
																break;
															end;
															if (d[e] < f[d[c]]) then
																t = d[h];
															else
																t = t + 1;
															end;
															break;
														end;
													else
														if (d[e] < f[d[c]]) then
															t = d[h];
														else
															t = t + 1;
														end;
													end
												end
											end
										else
											if n >= 127 then
												if n < 128 then
													local t = d[e];
													local e = f[d[h]];
													f[t + 1] = e;
													f[t] = e[d[c]];
												else
													if 125 < n then
														for t = 45, 59 do
															if 128 < n then
																f[d[e]] = #f[d[h]];
																break;
															end;
															f[d[e]][d[h]] = f[d[c]];
															break;
														end;
													else
														f[d[e]] = #f[d[h]];
													end
												end
											else
												if n >= 123 then
													for t = 43, 96 do
														if n ~= 125 then
															f[d[e]][f[d[h]]] = f[d[c]];
															break;
														end;
														local d = d[e]
														f[d](f[d + 1])
														break;
													end;
												else
													f[d[e]][f[d[h]]] = f[d[c]];
												end
											end
										end
									else
										if n >= 115 then
											if 117 <= n then
												if n < 118 then
													local l, s, a, k, r, o, n;
													local t = 0;
													while t > -1 do
														if 3 <= t then
															if t >= 5 then
																if 6 == t then
																	t = -2;
																else
																	f[o] = n;
																end
															else
																if t ~= 1 then
																	for d = 32, 62 do
																		if 3 < t then
																			n = f[r];
																			for d = 1 + r, k[a] do
																				n = n .. f[d];
																			end;
																			break;
																		end;
																		o = k[l];
																		break;
																	end;
																else
																	o = k[l];
																end
															end
														else
															if t <= 0 then
																l = e;
																s = h;
																a = c;
															else
																if t ~= -2 then
																	repeat
																		if t < 2 then
																			k = d;
																			break;
																		end;
																		r = k[s];
																	until true;
																else
																	k = d;
																end
															end
														end
														t = t + 1
													end
												else
													if n ~= 118 then
														local r, o, a, u, b, s, n, p;
														for n = 0, 4 do
															if n <= 1 then
																if n > -3 then
																	for l = 26, 91 do
																		if n < 1 then
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = 0;
																		while n > -1 do
																			if n >= 4 then
																				if 5 < n then
																					if n < 7 then
																						f[s] = b;
																					else
																						n = -2;
																					end
																				else
																					if 4 ~= n then
																						s = r[o];
																					else
																						b = u[r[a]];
																					end
																				end
																			else
																				if n > 1 then
																					if 2 == n then
																						a = h;
																					else
																						u = f;
																					end
																				else
																					if n ~= -3 then
																						for t = 23, 76 do
																							if n < 1 then
																								r = d;
																								break;
																							end;
																							o = e;
																							break;
																						end;
																					else
																						r = d;
																					end
																				end
																			end
																			n = n + 1
																		end
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	n = 0;
																	while n > -1 do
																		if n >= 4 then
																			if 5 < n then
																				if n < 7 then
																					f[s] = b;
																				else
																					n = -2;
																				end
																			else
																				if 4 ~= n then
																					s = r[o];
																				else
																					b = u[r[a]];
																				end
																			end
																		else
																			if n > 1 then
																				if 2 == n then
																					a = h;
																				else
																					u = f;
																				end
																			else
																				if n ~= -3 then
																					for t = 23, 76 do
																						if n < 1 then
																							r = d;
																							break;
																						end;
																						o = e;
																						break;
																					end;
																				else
																					r = d;
																				end
																			end
																		end
																		n = n + 1
																	end
																	t = t + 1;
																	d = k[t];
																end
															else
																if n < 3 then
																	n = 0;
																	while n > -1 do
																		if 4 > n then
																			if 1 < n then
																				if n ~= -1 then
																					for d = 11, 93 do
																						if n > 2 then
																							u = f;
																							break;
																						end;
																						a = h;
																						break;
																					end;
																				else
																					a = h;
																				end
																			else
																				if -4 < n then
																					for t = 42, 98 do
																						if 1 ~= n then
																							r = d;
																							break;
																						end;
																						o = e;
																						break;
																					end;
																				else
																					o = e;
																				end
																			end
																		else
																			if 5 < n then
																				if 7 ~= n then
																					f[s] = b;
																				else
																					n = -2;
																				end
																			else
																				if 2 < n then
																					repeat
																						if 4 < n then
																							s = r[o];
																							break;
																						end;
																						b = u[r[a]];
																					until true;
																				else
																					s = r[o];
																				end
																			end
																		end
																		n = n + 1
																	end
																	t = t + 1;
																	d = k[t];
																else
																	if 2 <= n then
																		for c = 43, 75 do
																			if n ~= 4 then
																				p = d[e]
																				f[p](l(f, p + 1, d[h]))
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			t = d[h];
																			break;
																		end;
																	else
																		t = d[h];
																	end
																end
															end
														end
													else
														local t = d[e]
														local h = {
															f[t](l(f, t + 1, s))
														};
														local e = 0;
														for d = t, d[c] do
															e = e + 1;
															f[d] = h[e];
														end
													end
												end
											else
												if 112 < n then
													repeat
														if 115 < n then
															local n, o;
															for r = 0, 6 do
																if 3 <= r then
																	if r > 4 then
																		if 4 <= r then
																			repeat
																				if 5 < r then
																					f[d[e]] = {};
																					break;
																				end;
																				n = d[e];
																				o = f[d[h]];
																				f[n + 1] = o;
																				f[n] = o[d[c]];
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			f[d[e]] = {};
																		end
																	else
																		if 2 <= r then
																			for l = 23, 81 do
																				if 3 ~= r then
																					n = d[e]
																					f[n] = f[n](f[n + 1])
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				n = d[e];
																				o = f[d[h]];
																				f[n + 1] = o;
																				f[n] = o[d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			n = d[e];
																			o = f[d[h]];
																			f[n + 1] = o;
																			f[n] = o[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																else
																	if 0 < r then
																		if r >= 0 then
																			repeat
																				if r > 1 then
																					n = d[e]
																					f[n](l(f, n + 1, d[h]))
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f(d[e], d[h]);
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		f[d[e]][d[h]] = f[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
															break;
														end;
														local n, r;
														for o = 0, 6 do
															if 2 >= o then
																if 0 >= o then
																	f[d[e]][d[h]] = f[d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	if o >= 0 then
																		repeat
																			if o < 2 then
																				f[d[e]][d[h]] = d[c];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e]
																			f[n] = f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		f[d[e]][d[h]] = d[c];
																		t = t + 1;
																		d = k[t];
																	end
																end
															else
																if 4 < o then
																	if 4 ~= o then
																		for l = 37, 71 do
																			if o ~= 6 then
																				n = d[e];
																				r = f[d[h]];
																				f[n + 1] = r;
																				f[n] = r[d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]] = {};
																			break;
																		end;
																	else
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if o > 1 then
																		repeat
																			if 3 < o then
																				n = d[e]
																				f[n] = f[n](f[n + 1])
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e];
																			r = f[d[h]];
																			f[n + 1] = r;
																			f[n] = r[d[c]];
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
													until true;
												else
													local n, r;
													for o = 0, 6 do
														if 2 >= o then
															if 0 >= o then
																f[d[e]][d[h]] = f[d[c]];
																t = t + 1;
																d = k[t];
															else
																if o >= 0 then
																	repeat
																		if o < 2 then
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]][d[h]] = d[c];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if 4 < o then
																if 4 ~= o then
																	for l = 37, 71 do
																		if o ~= 6 then
																			n = d[e];
																			r = f[d[h]];
																			f[n + 1] = r;
																			f[n] = r[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = {};
																		break;
																	end;
																else
																	n = d[e];
																	r = f[d[h]];
																	f[n + 1] = r;
																	f[n] = r[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if o > 1 then
																	repeat
																		if 3 < o then
																			n = d[e]
																			f[n] = f[n](f[n + 1])
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	n = d[e];
																	r = f[d[h]];
																	f[n + 1] = r;
																	f[n] = r[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										else
											if 112 < n then
												if 110 <= n then
													repeat
														if 114 ~= n then
															local l, r, n;
															for o = 0, 1 do
																if o ~= -4 then
																	repeat
																		if o > 0 then
																			t = d[h];
																			break;
																		end;
																		l = d[e]
																		r = {
																			f[l](f[l + 1])
																		};
																		n = 0;
																		for d = l, d[c] do
																			n = n + 1;
																			f[d] = r[n];
																		end
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	l = d[e]
																	r = {
																		f[l](f[l + 1])
																	};
																	n = 0;
																	for d = l, d[c] do
																		n = n + 1;
																		f[d] = r[n];
																	end
																	t = t + 1;
																	d = k[t];
																end
															end
															break;
														end;
														if f[d[e]] then
															t = t + 1;
														else
															t = d[h];
														end;
													until true;
												else
													local n, r, l;
													for o = 0, 1 do
														if o ~= -4 then
															repeat
																if o > 0 then
																	t = d[h];
																	break;
																end;
																n = d[e]
																r = {
																	f[n](f[n + 1])
																};
																l = 0;
																for d = n, d[c] do
																	l = l + 1;
																	f[d] = r[l];
																end
																t = t + 1;
																d = k[t];
															until true;
														else
															n = d[e]
															r = {
																f[n](f[n + 1])
															};
															l = 0;
															for d = n, d[c] do
																l = l + 1;
																f[d] = r[l];
															end
															t = t + 1;
															d = k[t];
														end
													end
												end
											else
												if 112 ~= n then
													for n = 0, 9 do
														if n < 5 then
															if 1 < n then
																if n >= 3 then
																	if 4 > n then
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	else
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 1 > n then
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if n < 7 then
																if n ~= 6 then
																	f[d[e]] = (d[h] ~= 0);
																	t = t + 1;
																	d = k[t];
																else
																	f[d[e]] = (d[h] ~= 0);
																	t = t + 1;
																	d = k[t];
																end
															else
																if 7 >= n then
																	f[d[e]] = (d[h] ~= 0);
																	t = t + 1;
																	d = k[t];
																else
																	if n < 9 then
																		f[d[e]] = (d[h] ~= 0);
																		t = t + 1;
																		d = k[t];
																	else
																		f[d[e]] = (d[h] ~= 0);
																	end
																end
															end
														end
													end
												else
													local n, s;
													r[d[h]] = f[d[e]];
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													n = d[e];
													s = f[d[h]];
													f[n + 1] = s;
													f[n] = s[d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													n = d[e];
													s = f[d[h]];
													f[n + 1] = s;
													f[n] = s[d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
												end
											end
										end
									end
								end
							else
								if n >= 92 then
									if 100 >= n then
										if 95 < n then
											if 98 > n then
												if n >= 95 then
													repeat
														if n < 97 then
															if (f[d[e]] < d[c]) then
																t = d[h];
															else
																t = t + 1;
															end;
															break;
														end;
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														f[d[e]] = (d[h] ~= 0);
														t = t + 1;
														d = k[t];
														f[d[e]] = (d[h] ~= 0);
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														for d = d[e], d[h] do
															f[d] = nil;
														end;
														t = t + 1;
														d = k[t];
														f[d[e]] = (d[h] ~= 0);
														t = t + 1;
														d = k[t];
														for d = d[e], d[h] do
															f[d] = nil;
														end;
													until true;
												else
													if (f[d[e]] < d[c]) then
														t = d[h];
													else
														t = t + 1;
													end;
												end
											else
												if n < 99 then
													local n, o;
													for r = 0, 5 do
														if 3 <= r then
															if r > 3 then
																if r == 5 then
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																else
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																end
															else
																n = d[e];
																o = f[d[h]];
																f[n + 1] = o;
																f[n] = o[d[c]];
																t = t + 1;
																d = k[t];
															end
														else
															if r >= 1 then
																if -3 ~= r then
																	repeat
																		if 1 < r then
																			f[d[e]] = f[d[h]][f[d[c]]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																f[d[e]] = f[d[h]][d[c]];
																t = t + 1;
																d = k[t];
															end
														end
													end
												else
													if n > 99 then
														local n, u, _, p, r, a;
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														n = d[e];
														u = f[d[h]];
														f[n + 1] = u;
														f[n] = u[d[c]];
														t = t + 1;
														d = k[t];
														n = d[e]
														a, p = b(f[n](f[n + 1]))
														s = p + n - 1
														r = 0;
														for d = n, s do
															r = r + 1;
															f[d] = a[r];
														end;
														t = t + 1;
														d = k[t];
														n = d[e]
														a = {
															f[n](l(f, n + 1, s))
														};
														r = 0;
														for d = n, d[c] do
															r = r + 1;
															f[d] = a[r];
														end
														t = t + 1;
														d = k[t];
														t = d[h];
													else
														local n, a, p, u, r;
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														n = d[e];
														a = f[d[h]];
														f[n + 1] = a;
														f[n] = a[d[c]];
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														n = d[e]
														p, u = b(f[n](l(f, n + 1, d[h])))
														s = u + n - 1
														r = 0;
														for d = n, s do
															r = r + 1;
															f[d] = p[r];
														end;
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n](l(f, n + 1, s))
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n]()
													end
												end
											end
										else
											if n >= 94 then
												if 94 == n then
													for n = 0, 4 do
														if n > 1 then
															if n >= 3 then
																if 1 ~= n then
																	repeat
																		if n ~= 3 then
																			t = d[h];
																			break;
																		end;
																		f[d[e]] = f[d[h]] + f[d[c]];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	t = d[h];
																end
															else
																f[d[e]] = f[d[h]] * f[d[c]];
																t = t + 1;
																d = k[t];
															end
														else
															if n == 0 then
																f[d[e]] = f[d[h]][d[c]];
																t = t + 1;
																d = k[t];
															else
																f[d[e]] = r[d[h]];
																t = t + 1;
																d = k[t];
															end
														end
													end
												else
													f[d[e]] = f[d[h]] * d[c];
												end
											else
												if n ~= 93 then
													local r, o;
													for n = 0, 6 do
														if n <= 2 then
															if n >= 1 then
																if 1 < n then
																	r = d[e]
																	f[r](l(f, r + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																else
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																end
															else
																f[d[e]][d[h]] = f[d[c]];
																t = t + 1;
																d = k[t];
															end
														else
															if 4 >= n then
																if n ~= 3 then
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																else
																	r = d[e];
																	o = f[d[h]];
																	f[r + 1] = o;
																	f[r] = o[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 5 < n then
																	f[d[e]][d[h]] = d[c];
																else
																	f[d[e]][d[h]] = d[c];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												else
													local n, s;
													for o = 0, 4 do
														if 1 >= o then
															if o >= -1 then
																for c = 13, 71 do
																	if o ~= 1 then
																		f[d[e]] = f[d[h]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																	break;
																end;
															else
																f[d[e]] = r[d[h]];
																t = t + 1;
																d = k[t];
															end
														else
															if 3 > o then
																n = d[e];
																s = f[d[h]];
																f[n + 1] = s;
																f[n] = s[d[c]];
																t = t + 1;
																d = k[t];
															else
																if 3 ~= o then
																	n = d[e]
																	f[n](l(f, n + 1, d[h]))
																else
																	f[d[e]] = (d[h] ~= 0);
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										end
									else
										if n > 105 then
											if 108 > n then
												if 103 ~= n then
													repeat
														if 106 ~= n then
															local n, r;
															f[d[e]] = o[d[h]];
															t = t + 1;
															d = k[t];
															n = d[e];
															r = f[d[h]];
															f[n + 1] = r;
															f[n] = r[d[c]];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															n = d[e]
															f[n] = f[n](l(f, n + 1, d[h]))
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]][d[c]];
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]][d[c]];
															t = t + 1;
															d = k[t];
															n = d[e]
															f[n](f[n + 1])
															break;
														end;
														local n, p, a, u, r;
														for l = 0, 6 do
															if l < 3 then
																if 0 < l then
																	if 0 < l then
																		for n = 29, 97 do
																			if 2 > l then
																				f[d[e]] = f[d[h]][d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]] = f[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	f[d[e]] = o[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if l >= 5 then
																	if l ~= 2 then
																		repeat
																			if 6 ~= l then
																				n = d[e];
																				p = f[d[h]];
																				f[n + 1] = p;
																				f[n] = p[d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e]
																			a, u = b(f[n](f[n + 1]))
																			s = u + n - 1
																			r = 0;
																			for d = n, s do
																				r = r + 1;
																				f[d] = a[r];
																			end;
																		until true;
																	else
																		n = d[e]
																		a, u = b(f[n](f[n + 1]))
																		s = u + n - 1
																		r = 0;
																		for d = n, s do
																			r = r + 1;
																			f[d] = a[r];
																		end;
																	end
																else
																	if 1 < l then
																		for c = 24, 80 do
																			if l > 3 then
																				f[d[e]] = o[d[h]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e]
																			f[n](f[n + 1])
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		n = d[e]
																		f[n](f[n + 1])
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
													until true;
												else
													local n, r;
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													n = d[e];
													r = f[d[h]];
													f[n + 1] = r;
													f[n] = r[d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n](f[n + 1])
												end
											else
												if 109 <= n then
													if 107 < n then
														repeat
															if 109 < n then
																r[d[h]] = f[d[e]];
																break;
															end;
															local n, o;
															for r = 0, 6 do
																if 3 > r then
																	if r > 0 then
																		if -3 <= r then
																			repeat
																				if 2 ~= r then
																					f(d[e], d[h]);
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				n = d[e]
																				f[n] = f[n](l(f, n + 1, d[h]))
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		n = d[e];
																		o = f[d[h]];
																		f[n + 1] = o;
																		f[n] = o[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if r < 5 then
																		if r > 2 then
																			repeat
																				if 3 < r then
																					f[d[e]] = f[d[h]][d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]] = f[d[h]][d[c]];
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if 4 <= r then
																			for l = 47, 70 do
																				if r < 6 then
																					n = d[e];
																					o = f[d[h]];
																					f[n + 1] = o;
																					f[n] = o[d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f(d[e], d[h]);
																				break;
																			end;
																		else
																			f(d[e], d[h]);
																		end
																	end
																end
															end
														until true;
													else
														r[d[h]] = f[d[e]];
													end
												else
													local n, r;
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = f[d[c]];
													t = t + 1;
													d = k[t];
													n = d[e];
													r = f[d[h]];
													f[n + 1] = r;
													f[n] = r[d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = f[d[c]];
												end
											end
										else
											if n < 103 then
												if 97 < n then
													repeat
														if n < 102 then
															if (d[e] < f[d[c]]) then
																t = t + 1;
															else
																t = d[h];
															end;
															break;
														end;
														local l;
														for n = 0, 6 do
															if 3 > n then
																if 1 > n then
																	l = d[e]
																	f[l](f[l + 1])
																	t = t + 1;
																	d = k[t];
																else
																	if n > 1 then
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	else
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															else
																if 5 > n then
																	if n ~= 3 then
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	else
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if 3 < n then
																		for l = 15, 79 do
																			if n < 6 then
																				f[d[e]] = f[d[h]][d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]] = o[d[h]];
																			break;
																		end;
																	else
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
													until true;
												else
													if (d[e] < f[d[c]]) then
														t = t + 1;
													else
														t = d[h];
													end;
												end
											else
												if n < 104 then
													f[d[e]] = f[d[h]] % d[c];
												else
													if 105 > n then
														local n, a;
														for s = 0, 9 do
															if 5 > s then
																if 1 >= s then
																	if -2 < s then
																		repeat
																			if s > 0 then
																				f[d[e]] = {};
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e];
																			a = f[d[h]];
																			f[n + 1] = a;
																			f[n] = a[d[c]];
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		f[d[e]] = {};
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if s >= 3 then
																		if 1 ~= s then
																			for n = 32, 59 do
																				if s > 3 then
																					f[d[e]][d[h]] = d[c];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]][d[h]] = d[c];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		f[d[e]][d[h]] = d[c];
																		t = t + 1;
																		d = k[t];
																	end
																end
															else
																if 6 >= s then
																	if s ~= 2 then
																		for c = 42, 80 do
																			if s > 5 then
																				f[d[e]] = o[d[h]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e]
																			f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		n = d[e]
																		f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if s > 7 then
																		if s >= 5 then
																			repeat
																				if 8 < s then
																					f[d[e]] = r[d[h]];
																					break;
																				end;
																				n = d[e]
																				f[n](f[n + 1])
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			n = d[e]
																			f[n](f[n + 1])
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
													else
														local n, r;
														f[d[e]] = f[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]];
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n](l(f, n + 1, d[h]))
														t = t + 1;
														d = k[t];
														n = d[e];
														r = f[d[h]];
														f[n + 1] = r;
														f[n] = r[d[c]];
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n](f[n + 1])
														t = t + 1;
														d = k[t];
														do
															return
														end;
													end
												end
											end
										end
									end
								else
									if 83 <= n then
										if n > 86 then
											if n < 89 then
												if n >= 85 then
													for s = 26, 93 do
														if n ~= 87 then
															local n, r;
															n = d[e]
															f[n] = f[n](f[n + 1])
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = f[d[c]];
															t = t + 1;
															d = k[t];
															n = d[e];
															r = f[d[h]];
															f[n + 1] = r;
															f[n] = r[d[c]];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															f[d[e]] = (d[h] ~= 0);
															t = t + 1;
															d = k[t];
															n = d[e]
															f[n](l(f, n + 1, d[h]))
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = d[c];
															break;
														end;
														local n, l;
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]] = r[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														n = d[e];
														l = f[d[h]];
														f[n + 1] = l;
														f[n] = l[d[c]];
														break;
													end;
												else
													local n, r;
													n = d[e]
													f[n] = f[n](f[n + 1])
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = f[d[c]];
													t = t + 1;
													d = k[t];
													n = d[e];
													r = f[d[h]];
													f[n + 1] = r;
													f[n] = r[d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													f[d[e]] = (d[h] ~= 0);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
												end
											else
												if n < 90 then
													local n;
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													if (f[d[e]] == f[d[c]]) then
														t = t + 1;
													else
														t = d[h];
													end;
												else
													if 91 == n then
														local n, o;
														for r = 0, 6 do
															if 3 <= r then
																if 5 <= r then
																	if 1 <= r then
																		repeat
																			if r < 6 then
																				f[d[e]][d[h]] = d[c];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]][d[h]] = d[c];
																		until true;
																	else
																		f[d[e]][d[h]] = d[c];
																	end
																else
																	if r >= 1 then
																		for l = 39, 68 do
																			if 3 ~= r then
																				f[d[e]] = {};
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e];
																			o = f[d[h]];
																			f[n + 1] = o;
																			f[n] = o[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		n = d[e];
																		o = f[d[h]];
																		f[n + 1] = o;
																		f[n] = o[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															else
																if r < 1 then
																	f[d[e]][d[h]] = f[d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	if 2 == r then
																		n = d[e]
																		f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	else
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
													else
														f[d[e]] = f[d[h]][f[d[c]]];
													end
												end
											end
										else
											if n > 84 then
												if 84 ~= n then
													for l = 16, 64 do
														if 86 > n then
															local r, l, a, b, s, n;
															for n = 0, 6 do
																if n >= 3 then
																	if n < 5 then
																		if 2 < n then
																			repeat
																				if n > 3 then
																					f[d[e]] = f[d[h]][d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]] = o[d[h]];
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if n >= 2 then
																			for c = 10, 75 do
																				if 6 > n then
																					n = 0;
																					while n > -1 do
																						if n <= 2 then
																							if 1 > n then
																								r = d;
																							else
																								if -1 ~= n then
																									repeat
																										if 2 ~= n then
																											l = e;
																											break;
																										end;
																										a = h;
																									until true;
																								else
																									l = e;
																								end
																							end
																						else
																							if 4 >= n then
																								if -1 < n then
																									repeat
																										if 3 ~= n then
																											s = r[l];
																											break;
																										end;
																										b = r[a];
																									until true;
																								else
																									s = r[l];
																								end
																							else
																								if 5 == n then
																									f(s, b);
																								else
																									n = -2;
																								end
																							end
																						end
																						n = n + 1
																					end
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f(d[e], d[h]);
																				break;
																			end;
																		else
																			f(d[e], d[h]);
																		end
																	end
																else
																	if 1 <= n then
																		if n ~= -3 then
																			for l = 10, 84 do
																				if n < 2 then
																					f[d[e]][d[h]] = d[c];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]][d[h]] = d[c];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		f[d[e]] = {};
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
															break;
														end;
														local s = z[d[h]];
														local l;
														local n = {};
														l = a.xxoAzVrP({}, {
															__index = function(t, d)
																local d = n[d];
																return d[1][d[2]];
															end,
															__newindex = function(f, d, t)
																local d = n[d]
																d[1][d[2]] = t;
															end;
														});
														for e = 1, d[c] do
															t = t + 1;
															local d = k[t];
															if d[j] == 51 then
																n[e - 1] = {
																	f,
																	d[h]
																};
															else
																n[e - 1] = {
																	r,
																	d[h]
																};
															end;
															u[#u + 1] = n;
														end;
														f[d[e]] = _(s, l, o);
														break;
													end;
												else
													local l, r, a, b, s, n;
													for n = 0, 6 do
														if n >= 3 then
															if n < 5 then
																if 2 < n then
																	repeat
																		if n > 3 then
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if n >= 2 then
																	for c = 10, 75 do
																		if 6 > n then
																			n = 0;
																			while n > -1 do
																				if n <= 2 then
																					if 1 > n then
																						l = d;
																					else
																						if -1 ~= n then
																							repeat
																								if 2 ~= n then
																									r = e;
																									break;
																								end;
																								a = h;
																							until true;
																						else
																							r = e;
																						end
																					end
																				else
																					if 4 >= n then
																						if -1 < n then
																							repeat
																								if 3 ~= n then
																									s = l[r];
																									break;
																								end;
																								b = l[a];
																							until true;
																						else
																							s = l[r];
																						end
																					else
																						if 5 == n then
																							f(s, b);
																						else
																							n = -2;
																						end
																					end
																				end
																				n = n + 1
																			end
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f(d[e], d[h]);
																		break;
																	end;
																else
																	f(d[e], d[h]);
																end
															end
														else
															if 1 <= n then
																if n ~= -3 then
																	for l = 10, 84 do
																		if n < 2 then
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]][d[h]] = d[c];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]][d[h]] = d[c];
																	t = t + 1;
																	d = k[t];
																end
															else
																f[d[e]] = {};
																t = t + 1;
																d = k[t];
															end
														end
													end
												end
											else
												if n >= 82 then
													repeat
														if n > 83 then
															local d = d[e]
															f[d] = f[d](l(f, d + 1, s))
															break;
														end;
														local e = d[e];
														local c = d[c];
														local k = e + 2
														local e = {
															f[e](f[e + 1], f[k])
														};
														for d = 1, c do
															f[k + d] = e[d];
														end;
														local e = e[1]
														if e then
															f[k] = e
															t = d[h];
														else
															t = t + 1;
														end;
													until true;
												else
													local e = d[e];
													local c = d[c];
													local k = e + 2
													local e = {
														f[e](f[e + 1], f[k])
													};
													for d = 1, c do
														f[k + d] = e[d];
													end;
													local e = e[1]
													if e then
														f[k] = e
														t = d[h];
													else
														t = t + 1;
													end;
												end
											end
										end
									else
										if n <= 77 then
											if 75 >= n then
												if 73 ~= n then
													repeat
														if 74 < n then
															local r;
															for n = 0, 4 do
																if 1 < n then
																	if 2 >= n then
																		f[d[e]][d[h]] = d[c];
																		t = t + 1;
																		d = k[t];
																	else
																		if 3 ~= n then
																			r = d[e]
																			f[r](l(f, r + 1, d[h]))
																		else
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																else
																	if n > -2 then
																		for l = 29, 67 do
																			if 1 ~= n then
																				f[d[e]] = {};
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f[d[e]] = {};
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
															break;
														end;
														f[d[e]] = _(z[d[h]], nil, o);
													until true;
												else
													local r;
													for n = 0, 4 do
														if 1 < n then
															if 2 >= n then
																f[d[e]][d[h]] = d[c];
																t = t + 1;
																d = k[t];
															else
																if 3 ~= n then
																	r = d[e]
																	f[r](l(f, r + 1, d[h]))
																else
																	f[d[e]][d[h]] = d[c];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if n > -2 then
																for l = 29, 67 do
																	if 1 ~= n then
																		f[d[e]] = {};
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																	f[d[e]][d[h]] = d[c];
																	t = t + 1;
																	d = k[t];
																	break;
																end;
															else
																f[d[e]] = {};
																t = t + 1;
																d = k[t];
															end
														end
													end
												end
											else
												if 77 == n then
													local o, b, s, p, a, u, _, n;
													for n = 0, 4 do
														if n < 2 then
															if n > 0 then
																n = 0;
																while n > -1 do
																	if n > 2 then
																		if n > 4 then
																			if n > 1 then
																				for d = 46, 95 do
																					if 6 > n then
																						f(_, u);
																						break;
																					end;
																					n = -2;
																					break;
																				end;
																			else
																				n = -2;
																			end
																		else
																			if n ~= 2 then
																				for d = 20, 60 do
																					if 4 ~= n then
																						u = s[a];
																						break;
																					end;
																					_ = s[p];
																					break;
																				end;
																			else
																				u = s[a];
																			end
																		end
																	else
																		if 0 >= n then
																			s = d;
																		else
																			if n ~= 0 then
																				for d = 49, 67 do
																					if 1 < n then
																						a = h;
																						break;
																					end;
																					p = e;
																					break;
																				end;
																			else
																				a = h;
																			end
																		end
																	end
																	n = n + 1
																end
																t = t + 1;
																d = k[t];
															else
																o = d[e];
																b = f[d[h]];
																f[o + 1] = b;
																f[o] = b[d[c]];
																t = t + 1;
																d = k[t];
															end
														else
															if n < 3 then
																o = d[e]
																f[o] = f[o](l(f, o + 1, d[h]))
																t = t + 1;
																d = k[t];
															else
																if 0 <= n then
																	for c = 14, 66 do
																		if n ~= 4 then
																			f[d[e]] = r[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		if f[d[e]] then
																			t = t + 1;
																		else
																			t = d[h];
																		end;
																		break;
																	end;
																else
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												else
													local c, l, r;
													for n = 0, 4 do
														if 2 > n then
															if n < 1 then
																c = d[e]
																f[c] = f[c](f[c + 1])
																t = t + 1;
																d = k[t];
															else
																f(d[e], d[h]);
																t = t + 1;
																d = k[t];
															end
														else
															if 2 >= n then
																f[d[e]] = #f[d[h]];
																t = t + 1;
																d = k[t];
															else
																if n >= 2 then
																	for o = 44, 63 do
																		if n < 4 then
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		c = d[e];
																		l = f[c]
																		r = f[c + 2];
																		if (r > 0) then
																			if (l > f[c + 1]) then
																				t = d[h];
																			else
																				f[c + 3] = l;
																			end
																		elseif (l < f[c + 1]) then
																			t = d[h];
																		else
																			f[c + 3] = l;
																		end
																		break;
																	end;
																else
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										else
											if 79 >= n then
												if 77 ~= n then
													for r = 24, 85 do
														if 78 ~= n then
															local t = d[e];
															local e = f[d[h]];
															f[t + 1] = e;
															f[t] = e[d[c]];
															break;
														end;
														local n, u, _, p, r, a;
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														n = d[e];
														u = f[d[h]];
														f[n + 1] = u;
														f[n] = u[d[c]];
														t = t + 1;
														d = k[t];
														n = d[e]
														a, p = b(f[n](f[n + 1]))
														s = p + n - 1
														r = 0;
														for d = n, s do
															r = r + 1;
															f[d] = a[r];
														end;
														t = t + 1;
														d = k[t];
														n = d[e]
														a = {
															f[n](l(f, n + 1, s))
														};
														r = 0;
														for d = n, d[c] do
															r = r + 1;
															f[d] = a[r];
														end
														t = t + 1;
														d = k[t];
														t = d[h];
														break;
													end;
												else
													local n, u, _, p, r, a;
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													n = d[e];
													u = f[d[h]];
													f[n + 1] = u;
													f[n] = u[d[c]];
													t = t + 1;
													d = k[t];
													n = d[e]
													a, p = b(f[n](f[n + 1]))
													s = p + n - 1
													r = 0;
													for d = n, s do
														r = r + 1;
														f[d] = a[r];
													end;
													t = t + 1;
													d = k[t];
													n = d[e]
													a = {
														f[n](l(f, n + 1, s))
													};
													r = 0;
													for d = n, d[c] do
														r = r + 1;
														f[d] = a[r];
													end
													t = t + 1;
													d = k[t];
													t = d[h];
												end
											else
												if n < 81 then
													local n, o;
													for r = 0, 4 do
														if r > 1 then
															if r >= 3 then
																if 2 <= r then
																	repeat
																		if 4 ~= r then
																			f[d[e]] = {};
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]][d[h]] = d[c];
																	until true;
																else
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																end
															else
																n = d[e];
																o = f[d[h]];
																f[n + 1] = o;
																f[n] = o[d[c]];
																t = t + 1;
																d = k[t];
															end
														else
															if r >= -1 then
																repeat
																	if r > 0 then
																		n = d[e]
																		f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																	f[d[e]][d[h]] = f[d[c]];
																	t = t + 1;
																	d = k[t];
																until true;
															else
																n = d[e]
																f[n](l(f, n + 1, d[h]))
																t = t + 1;
																d = k[t];
															end
														end
													end
												else
													if 78 ~= n then
														for r = 37, 78 do
															if 82 ~= n then
																local t = d[e]
																f[t] = f[t](l(f, t + 1, d[h]))
																break;
															end;
															local n, u, r, _, a, p;
															for r = 0, 9 do
																if r > 4 then
																	if 6 >= r then
																		if r > 4 then
																			for o = 38, 89 do
																				if r ~= 6 then
																					n = d[e]
																					f[n] = f[n](l(f, n + 1, d[h]))
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				n = d[e];
																				u = f[d[h]];
																				f[n + 1] = u;
																				f[n] = u[d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			n = d[e]
																			f[n] = f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if r > 7 then
																			if r >= 6 then
																				for o = 19, 80 do
																					if 8 < r then
																						t = d[h];
																						break;
																					end;
																					n = d[e]
																					p = {
																						f[n](l(f, n + 1, s))
																					};
																					a = 0;
																					for d = n, d[c] do
																						a = a + 1;
																						f[d] = p[a];
																					end
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																			else
																				n = d[e]
																				p = {
																					f[n](l(f, n + 1, s))
																				};
																				a = 0;
																				for d = n, d[c] do
																					a = a + 1;
																					f[d] = p[a];
																				end
																				t = t + 1;
																				d = k[t];
																			end
																		else
																			n = d[e]
																			p, _ = b(f[n](f[n + 1]))
																			s = _ + n - 1
																			a = 0;
																			for d = n, s do
																				a = a + 1;
																				f[d] = p[a];
																			end;
																			t = t + 1;
																			d = k[t];
																		end
																	end
																else
																	if 2 > r then
																		if -3 <= r then
																			for c = 16, 67 do
																				if 1 ~= r then
																					n = d[e]
																					f[n](l(f, n + 1, d[h]))
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]] = o[d[h]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			n = d[e]
																			f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if r <= 2 then
																			f[d[e]] = o[d[h]];
																			t = t + 1;
																			d = k[t];
																		else
																			if -1 < r then
																				for l = 16, 92 do
																					if r > 3 then
																						f(d[e], d[h]);
																						t = t + 1;
																						d = k[t];
																						break;
																					end;
																					n = d[e];
																					u = f[d[h]];
																					f[n + 1] = u;
																					f[n] = u[d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																			else
																				n = d[e];
																				u = f[d[h]];
																				f[n + 1] = u;
																				f[n] = u[d[c]];
																				t = t + 1;
																				d = k[t];
																			end
																		end
																	end
																end
															end
															break;
														end;
													else
														local n, u, r, _, a, p;
														for r = 0, 9 do
															if r > 4 then
																if 6 >= r then
																	if r > 4 then
																		for o = 38, 89 do
																			if r ~= 6 then
																				n = d[e]
																				f[n] = f[n](l(f, n + 1, d[h]))
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e];
																			u = f[d[h]];
																			f[n + 1] = u;
																			f[n] = u[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if r > 7 then
																		if r >= 6 then
																			for o = 19, 80 do
																				if 8 < r then
																					t = d[h];
																					break;
																				end;
																				n = d[e]
																				p = {
																					f[n](l(f, n + 1, s))
																				};
																				a = 0;
																				for d = n, d[c] do
																					a = a + 1;
																					f[d] = p[a];
																				end
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			n = d[e]
																			p = {
																				f[n](l(f, n + 1, s))
																			};
																			a = 0;
																			for d = n, d[c] do
																				a = a + 1;
																				f[d] = p[a];
																			end
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		n = d[e]
																		p, _ = b(f[n](f[n + 1]))
																		s = _ + n - 1
																		a = 0;
																		for d = n, s do
																			a = a + 1;
																			f[d] = p[a];
																		end;
																		t = t + 1;
																		d = k[t];
																	end
																end
															else
																if 2 > r then
																	if -3 <= r then
																		for c = 16, 67 do
																			if 1 ~= r then
																				n = d[e]
																				f[n](l(f, n + 1, d[h]))
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]] = o[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		n = d[e]
																		f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if r <= 2 then
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	else
																		if -1 < r then
																			for l = 16, 92 do
																				if r > 3 then
																					f(d[e], d[h]);
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				n = d[e];
																				u = f[d[h]];
																				f[n + 1] = u;
																				f[n] = u[d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			n = d[e];
																			u = f[d[h]];
																			f[n + 1] = u;
																			f[n] = u[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					else
						if 222 >= n then
							if 186 > n then
								if 167 <= n then
									if n > 175 then
										if n >= 181 then
											if n < 183 then
												if 180 < n then
													for t = 32, 68 do
														if 182 > n then
															local d = d[e]
															f[d] = f[d]()
															break;
														end;
														f[d[e]] = f[d[h]] % d[c];
														break;
													end;
												else
													f[d[e]] = f[d[h]] % d[c];
												end
											else
												if n < 184 then
													local n, r;
													for o = 0, 6 do
														if 3 <= o then
															if o > 4 then
																if o < 6 then
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																else
																	r = f[d[c]];
																	if r then
																		t = t + 1;
																	else
																		f[d[e]] = r;
																		t = d[h];
																	end;
																end
															else
																if o ~= 3 then
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																else
																	n = d[e];
																	r = f[d[h]];
																	f[n + 1] = r;
																	f[n] = r[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if o < 1 then
																n = d[e];
																r = f[d[h]];
																f[n + 1] = r;
																f[n] = r[d[c]];
																t = t + 1;
																d = k[t];
															else
																if o > -1 then
																	for c = 36, 93 do
																		if o > 1 then
																			n = d[e]
																			f[n] = f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												else
													if n >= 182 then
														repeat
															if n > 184 then
																local n, o;
																for r = 0, 4 do
																	if 1 < r then
																		if 3 > r then
																			n = d[e];
																			o = f[d[h]];
																			f[n + 1] = o;
																			f[n] = o[d[c]];
																			t = t + 1;
																			d = k[t];
																		else
																			if 4 > r then
																				f(d[e], d[h]);
																				t = t + 1;
																				d = k[t];
																			else
																				n = d[e]
																				f[n] = f[n](l(f, n + 1, d[h]))
																			end
																		end
																	else
																		if r > -1 then
																			repeat
																				if r ~= 0 then
																					f[d[e]] = f[d[h]][d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]] = f[d[h]][d[c]];
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
																break;
															end;
															local r, n, o;
															f[d[e]] = {};
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = d[c];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															r = d[h];
															n = f[r]
															for d = r + 1, d[c] do
																n = n .. f[d];
															end;
															f[d[e]] = n;
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = f[d[c]];
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = d[c];
															t = t + 1;
															d = k[t];
															o = d[e]
															f[o](l(f, o + 1, d[h]))
														until true;
													else
														local n, o;
														for r = 0, 4 do
															if 1 < r then
																if 3 > r then
																	n = d[e];
																	o = f[d[h]];
																	f[n + 1] = o;
																	f[n] = o[d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	if 4 > r then
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	else
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																	end
																end
															else
																if r > -1 then
																	repeat
																		if r ~= 0 then
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										else
											if n >= 178 then
												if 178 >= n then
													local n, r;
													f[d[e]][d[h]] = f[d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													n = d[e];
													r = f[d[h]];
													f[n + 1] = r;
													f[n] = r[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = {};
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
												else
													if n ~= 180 then
														t = d[h];
													else
														local n;
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n](l(f, n + 1, d[h]))
														t = t + 1;
														d = k[t];
														f[d[e]] = r[d[h]];
														t = t + 1;
														d = k[t];
														if (f[d[e]] <= f[d[c]]) then
															t = d[h];
														else
															t = t + 1;
														end;
													end
												end
											else
												if 173 < n then
													repeat
														if n > 176 then
															local a, s, o;
															for n = 0, 5 do
																if 3 <= n then
																	if 4 <= n then
																		if n < 5 then
																			f[d[e]] = r[d[h]];
																			t = t + 1;
																			d = k[t];
																		else
																			if f[d[e]] then
																				t = t + 1;
																			else
																				t = d[h];
																			end;
																		end
																	else
																		r[d[h]] = f[d[e]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if 0 >= n then
																		a = d[h];
																		s = f[a]
																		for d = a + 1, d[c] do
																			s = s .. f[d];
																		end;
																		f[d[e]] = s;
																		t = t + 1;
																		d = k[t];
																	else
																		if n ~= -2 then
																			repeat
																				if n ~= 2 then
																					f[d[e]][d[h]] = f[d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				o = d[e]
																				f[o](l(f, o + 1, d[h]))
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			o = d[e]
																			f[o](l(f, o + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
															end
															break;
														end;
														local n, p, a, _, r, u;
														for a = 0, 4 do
															if a <= 1 then
																if a >= -4 then
																	repeat
																		if 0 < a then
																			n = d[e];
																			p = f[d[h]];
																			f[n + 1] = p;
																			f[n] = p[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]] = o[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 2 >= a then
																	n = d[e]
																	u, _ = b(f[n](f[n + 1]))
																	s = _ + n - 1
																	r = 0;
																	for d = n, s do
																		r = r + 1;
																		f[d] = u[r];
																	end;
																	t = t + 1;
																	d = k[t];
																else
																	if a ~= -1 then
																		for o = 11, 67 do
																			if 3 < a then
																				t = d[h];
																				break;
																			end;
																			n = d[e]
																			u = {
																				f[n](l(f, n + 1, s))
																			};
																			r = 0;
																			for d = n, d[c] do
																				r = r + 1;
																				f[d] = u[r];
																			end
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		n = d[e]
																		u = {
																			f[n](l(f, n + 1, s))
																		};
																		r = 0;
																		for d = n, d[c] do
																			r = r + 1;
																			f[d] = u[r];
																		end
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
													until true;
												else
													local a, s, n;
													for o = 0, 5 do
														if 3 <= o then
															if 4 <= o then
																if o < 5 then
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																else
																	if f[d[e]] then
																		t = t + 1;
																	else
																		t = d[h];
																	end;
																end
															else
																r[d[h]] = f[d[e]];
																t = t + 1;
																d = k[t];
															end
														else
															if 0 >= o then
																a = d[h];
																s = f[a]
																for d = a + 1, d[c] do
																	s = s .. f[d];
																end;
																f[d[e]] = s;
																t = t + 1;
																d = k[t];
															else
																if o ~= -2 then
																	repeat
																		if o ~= 2 then
																			f[d[e]][d[h]] = f[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e]
																		f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	n = d[e]
																	f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										end
									else
										if 171 > n then
											if n >= 169 then
												if 167 ~= n then
													repeat
														if 170 > n then
															local r, o;
															for n = 0, 6 do
																if 3 <= n then
																	if n < 5 then
																		if 3 < n then
																			f[d[e]] = {};
																			t = t + 1;
																			d = k[t];
																		else
																			r = d[e];
																			o = f[d[h]];
																			f[r + 1] = o;
																			f[r] = o[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if 3 < n then
																			repeat
																				if 5 ~= n then
																					f[d[e]][d[h]] = d[c];
																					break;
																				end;
																				f[d[e]][d[h]] = d[c];
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			f[d[e]][d[h]] = d[c];
																		end
																	end
																else
																	if 1 > n then
																		f[d[e]][d[h]] = f[d[c]];
																		t = t + 1;
																		d = k[t];
																	else
																		if 1 == n then
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																		else
																			r = d[e]
																			f[r](l(f, r + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
															end
															break;
														end;
														local n, u, a, _, r, p;
														for a = 0, 6 do
															if a >= 3 then
																if a >= 5 then
																	if a == 6 then
																		t = d[h];
																	else
																		n = d[e]
																		p = {
																			f[n](l(f, n + 1, s))
																		};
																		r = 0;
																		for d = n, d[c] do
																			r = r + 1;
																			f[d] = p[r];
																		end
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if a > 2 then
																		repeat
																			if 3 ~= a then
																				n = d[e]
																				p, _ = b(f[n](f[n + 1]))
																				s = _ + n - 1
																				r = 0;
																				for d = n, s do
																					r = r + 1;
																					f[d] = p[r];
																				end;
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e];
																			u = f[d[h]];
																			f[n + 1] = u;
																			f[n] = u[d[c]];
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		n = d[e];
																		u = f[d[h]];
																		f[n + 1] = u;
																		f[n] = u[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															else
																if 1 > a then
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																else
																	if -1 ~= a then
																		repeat
																			if a < 2 then
																				n = d[e]
																				f[n] = f[n](l(f, n + 1, d[h]))
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]] = o[d[h]];
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
													until true;
												else
													local r, o;
													for n = 0, 6 do
														if 3 <= n then
															if n < 5 then
																if 3 < n then
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																else
																	r = d[e];
																	o = f[d[h]];
																	f[r + 1] = o;
																	f[r] = o[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 3 < n then
																	repeat
																		if 5 ~= n then
																			f[d[e]][d[h]] = d[c];
																			break;
																		end;
																		f[d[e]][d[h]] = d[c];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]][d[h]] = d[c];
																end
															end
														else
															if 1 > n then
																f[d[e]][d[h]] = f[d[c]];
																t = t + 1;
																d = k[t];
															else
																if 1 == n then
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																else
																	r = d[e]
																	f[r](l(f, r + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											else
												if 168 > n then
													f[d[e]] = o[d[h]];
												else
													local l, o;
													for n = 0, 6 do
														if n >= 3 then
															if 4 < n then
																if 4 < n then
																	repeat
																		if n < 6 then
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		l = d[e];
																		o = f[l];
																		for d = l + 1, d[h] do
																			a.zVSAliLu(o, f[d])
																		end;
																	until true;
																else
																	l = d[e];
																	o = f[l];
																	for d = l + 1, d[h] do
																		a.zVSAliLu(o, f[d])
																	end;
																end
															else
																if -1 ~= n then
																	for l = 15, 75 do
																		if 3 < n then
																			f[d[e]] = {};
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]][d[h]] = f[d[c]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if n <= 0 then
																f[d[e]][d[h]] = d[c];
																t = t + 1;
																d = k[t];
															else
																if 2 ~= n then
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										else
											if 172 >= n then
												if n > 171 then
													local k = f[d[c]];
													if k then
														t = t + 1;
													else
														f[d[e]] = k;
														t = d[h];
													end;
												else
													local d = d[e]
													f[d](f[d + 1])
												end
											else
												if 174 > n then
													local l, n, p, o, r, u, a, b, s;
													local k = 0;
													while k > -1 do
														if k <= 2 then
															if k > 0 then
																if -2 < k then
																	for f = 45, 89 do
																		if k > 1 then
																			o = n[e];
																			r = n[c];
																			u = h;
																			break;
																		end;
																		n = d;
																		p = t;
																		break;
																	end;
																else
																	o = n[e];
																	r = n[c];
																	u = h;
																end
															else
																l = f;
															end
														else
															if k < 5 then
																if k > 1 then
																	repeat
																		if k ~= 4 then
																			a = l[o];
																			b = l[r];
																			break;
																		end;
																		s = a == b and n[u] or 1 + p;
																	until true;
																else
																	a = l[o];
																	b = l[r];
																end
															else
																if 3 ~= k then
																	repeat
																		if 6 > k then
																			t = s;
																			break;
																		end;
																		k = -2;
																	until true;
																else
																	t = s;
																end
															end
														end
														k = k + 1
													end
												else
													if n < 175 then
														f[d[e]][d[h]] = f[d[c]];
													else
														local k = d[e];
														local h = {};
														for d = 1, #u do
															local d = u[d];
															for t = 0, #d do
																local t = d[t];
																local e = t[1];
																local d = t[2];
																if e == f and d >= k then
																	h[d] = e[d];
																	t[1] = h;
																end;
															end;
														end;
													end
												end
											end
										end
									end
								else
									if 158 > n then
										if n > 152 then
											if n >= 155 then
												if n < 156 then
													for d = d[e], d[h] do
														f[d] = nil;
													end;
												else
													if n >= 152 then
														for l = 17, 97 do
															if n < 157 then
																if not f[d[e]] then
																	t = t + 1;
																else
																	t = d[h];
																end;
																break;
															end;
															local n, l, r;
															f[d[e]] = o[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]][d[c]];
															t = t + 1;
															d = k[t];
															f[d[e]] = {};
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															n = d[e];
															l = f[n]
															r = f[n + 2];
															if (r > 0) then
																if (l > f[n + 1]) then
																	t = d[h];
																else
																	f[n + 3] = l;
																end
															elseif (l < f[n + 1]) then
																t = d[h];
															else
																f[n + 3] = l;
															end
															break;
														end;
													else
														if not f[d[e]] then
															t = t + 1;
														else
															t = d[h];
														end;
													end
												end
											else
												if 149 <= n then
													for s = 22, 56 do
														if 154 > n then
															f[d[e]] = f[d[h]] - f[d[c]];
															break;
														end;
														local n;
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]] = r[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = r[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = r[d[h]];
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n](l(f, n + 1, d[h]))
														break;
													end;
												else
													local n;
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
												end
											end
										else
											if n > 150 then
												if n >= 149 then
													repeat
														if 152 ~= n then
															for n = 0, 6 do
																if n <= 2 then
																	if 1 <= n then
																		if n < 2 then
																			f[d[e]] = {};
																			t = t + 1;
																			d = k[t];
																		else
																			f[d[e]][d[h]] = f[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		f[d[e]] = {};
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if 4 < n then
																		if 2 <= n then
																			repeat
																				if n ~= 6 then
																					f[d[e]] = (d[h] ~= 0);
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]] = {};
																			until true;
																		else
																			f[d[e]] = {};
																		end
																	else
																		if 1 <= n then
																			repeat
																				if n ~= 3 then
																					f[d[e]] = (d[h] ~= 0);
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				for d = d[e], d[h] do
																					f[d] = nil;
																				end;
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			for d = d[e], d[h] do
																				f[d] = nil;
																			end;
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
															end
															break;
														end;
														local e = d[e];
														local c = f[e + 2];
														local k = f[e] + c;
														f[e] = k;
														if (c > 0) then
															if (k <= f[e + 1]) then
																t = d[h];
																f[e + 3] = k;
															end
														elseif (k >= f[e + 1]) then
															t = d[h];
															f[e + 3] = k;
														end
													until true;
												else
													for n = 0, 6 do
														if n <= 2 then
															if 1 <= n then
																if n < 2 then
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																else
																	f[d[e]][d[h]] = f[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																f[d[e]] = {};
																t = t + 1;
																d = k[t];
															end
														else
															if 4 < n then
																if 2 <= n then
																	repeat
																		if n ~= 6 then
																			f[d[e]] = (d[h] ~= 0);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = {};
																	until true;
																else
																	f[d[e]] = {};
																end
															else
																if 1 <= n then
																	repeat
																		if n ~= 3 then
																			f[d[e]] = (d[h] ~= 0);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		for d = d[e], d[h] do
																			f[d] = nil;
																		end;
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	for d = d[e], d[h] do
																		f[d] = nil;
																	end;
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											else
												if n > 149 then
													local o, s;
													for n = 0, 6 do
														if 2 >= n then
															if 0 < n then
																if n == 1 then
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																else
																	f[d[e]][d[h]] = d[c];
																	t = t + 1;
																	d = k[t];
																end
															else
																o = d[e];
																s = f[d[h]];
																f[o + 1] = s;
																f[o] = s[d[c]];
																t = t + 1;
																d = k[t];
															end
														else
															if n > 4 then
																if 2 ~= n then
																	for c = 47, 97 do
																		if n < 6 then
																			o = d[e]
																			f[o](l(f, o + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = r[d[h]];
																		break;
																	end;
																else
																	f[d[e]] = r[d[h]];
																end
															else
																if 0 < n then
																	for l = 48, 68 do
																		if n < 4 then
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]][d[h]] = d[c];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]][d[h]] = d[c];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												else
													local n, u, _, p, r, a;
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													n = d[e];
													u = f[d[h]];
													f[n + 1] = u;
													f[n] = u[d[c]];
													t = t + 1;
													d = k[t];
													n = d[e]
													a, p = b(f[n](f[n + 1]))
													s = p + n - 1
													r = 0;
													for d = n, s do
														r = r + 1;
														f[d] = a[r];
													end;
													t = t + 1;
													d = k[t];
													n = d[e]
													a = {
														f[n](l(f, n + 1, s))
													};
													r = 0;
													for d = n, d[c] do
														r = r + 1;
														f[d] = a[r];
													end
													t = t + 1;
													d = k[t];
													t = d[h];
												end
											end
										end
									else
										if n < 162 then
											if 160 <= n then
												if n >= 157 then
													repeat
														if n > 160 then
															local n, r;
															n = d[e];
															r = f[d[h]];
															f[n + 1] = r;
															f[n] = r[d[c]];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															n = d[e]
															f[n] = f[n](l(f, n + 1, d[h]))
															t = t + 1;
															d = k[t];
															n = d[e];
															r = f[d[h]];
															f[n + 1] = r;
															f[n] = r[d[c]];
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]][d[c]];
															t = t + 1;
															d = k[t];
															n = d[e]
															f[n] = f[n](l(f, n + 1, d[h]))
															t = t + 1;
															d = k[t];
															if not f[d[e]] then
																t = t + 1;
															else
																t = d[h];
															end;
															break;
														end;
														local n, r;
														f[d[e]] = f[d[h]];
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n](f[n + 1])
														t = t + 1;
														d = k[t];
														n = d[e];
														r = f[d[h]];
														f[n + 1] = r;
														f[n] = r[d[c]];
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n](l(f, n + 1, d[h]))
														t = t + 1;
														d = k[t];
														if f[d[e]] then
															t = t + 1;
														else
															t = d[h];
														end;
													until true;
												else
													local n, r;
													f[d[e]] = f[d[h]];
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n](f[n + 1])
													t = t + 1;
													d = k[t];
													n = d[e];
													r = f[d[h]];
													f[n + 1] = r;
													f[n] = r[d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													if f[d[e]] then
														t = t + 1;
													else
														t = d[h];
													end;
												end
											else
												if 156 < n then
													for r = 48, 54 do
														if 158 < n then
															f[d[e]] = (d[h] ~= 0);
															t = t + 1;
															break;
														end;
														local n;
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n](l(f, n + 1, d[h]))
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = f[d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = d[c];
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = d[c];
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = d[c];
														t = t + 1;
														d = k[t];
														t = d[h];
														break;
													end;
												else
													f[d[e]] = (d[h] ~= 0);
													t = t + 1;
												end
											end
										else
											if n < 164 then
												if 159 ~= n then
													repeat
														if n ~= 163 then
															local t = d[e]
															local h = {
																f[t](f[t + 1])
															};
															local e = 0;
															for d = t, d[c] do
																e = e + 1;
																f[d] = h[e];
															end
															break;
														end;
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = d[c];
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = d[c];
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
													until true;
												else
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
												end
											else
												if n < 165 then
													local n, r;
													for o = 0, 6 do
														if 2 >= o then
															if o > 0 then
																if o ~= 0 then
																	repeat
																		if o < 2 then
																			f[d[e]][d[h]] = f[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	n = d[e];
																	r = f[d[h]];
																	f[n + 1] = r;
																	f[n] = r[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																n = d[e]
																f[n] = f[n](f[n + 1])
																t = t + 1;
																d = k[t];
															end
														else
															if o <= 4 then
																if o >= 1 then
																	for c = 38, 74 do
																		if o ~= 4 then
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = (d[h] ~= 0);
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = (d[h] ~= 0);
																	t = t + 1;
																	d = k[t];
																end
															else
																if 4 ~= o then
																	repeat
																		if 6 > o then
																			n = d[e]
																			f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																	until true;
																else
																	n = d[e];
																	r = f[d[h]];
																	f[n + 1] = r;
																	f[n] = r[d[c]];
																end
															end
														end
													end
												else
													if n == 166 then
														if (f[d[e]] <= f[d[c]]) then
															t = t + 1;
														else
															t = d[h];
														end;
													else
														local n, a, _, p, r, u;
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														n = d[e];
														a = f[d[h]];
														f[n + 1] = a;
														f[n] = a[d[c]];
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n](l(f, n + 1, d[h]))
														t = t + 1;
														d = k[t];
														n = d[e];
														a = f[d[h]];
														f[n + 1] = a;
														f[n] = a[d[c]];
														t = t + 1;
														d = k[t];
														n = d[e]
														u, p = b(f[n](f[n + 1]))
														s = p + n - 1
														r = 0;
														for d = n, s do
															r = r + 1;
															f[d] = u[r];
														end;
														t = t + 1;
														d = k[t];
														n = d[e]
														u = {
															f[n](l(f, n + 1, s))
														};
														r = 0;
														for d = n, d[c] do
															r = r + 1;
															f[d] = u[r];
														end
														t = t + 1;
														d = k[t];
														t = d[h];
													end
												end
											end
										end
									end
								end
							else
								if 203 >= n then
									if 195 <= n then
										if 198 >= n then
											if n >= 197 then
												if n == 197 then
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													o[d[h]] = f[d[e]];
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													o[d[h]] = f[d[e]];
													t = t + 1;
													d = k[t];
													f[d[e]] = (d[h] ~= 0);
													t = t + 1;
													d = k[t];
													o[d[h]] = f[d[e]];
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													if (f[d[e]] == d[c]) then
														t = t + 1;
													else
														t = d[h];
													end;
												else
													local n, s;
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n](f[n + 1])
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													n = d[e];
													s = f[d[h]];
													f[n + 1] = s;
													f[n] = s[d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
												end
											else
												if 193 < n then
													repeat
														if n ~= 196 then
															f[d[e]] = f[d[h]][d[c]];
															break;
														end;
														local l;
														for n = 0, 9 do
															if n >= 5 then
																if 7 <= n then
																	if n > 7 then
																		if 5 < n then
																			repeat
																				if n ~= 8 then
																					f[d[e]][d[h]] = f[d[c]];
																					break;
																				end;
																				f[d[e]] = f[d[h]][d[c]];
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if n >= 4 then
																		for l = 33, 72 do
																			if 6 ~= n then
																				f[d[e]][d[h]] = d[c];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]] = r[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															else
																if n > 1 then
																	if 2 >= n then
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	else
																		if 2 < n then
																			for l = 39, 97 do
																				if 3 < n then
																					f[d[e]] = r[d[h]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]][d[h]] = d[c];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			f[d[e]] = r[d[h]];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																else
																	if -4 < n then
																		for c = 27, 86 do
																			if n ~= 0 then
																				l = d[e]
																				f[l] = f[l]()
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]] = o[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
													until true;
												else
													local l;
													for n = 0, 9 do
														if n >= 5 then
															if 7 <= n then
																if n > 7 then
																	if 5 < n then
																		repeat
																			if n ~= 8 then
																				f[d[e]][d[h]] = f[d[c]];
																				break;
																			end;
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	f[d[e]] = o[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if n >= 4 then
																	for l = 33, 72 do
																		if 6 ~= n then
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if n > 1 then
																if 2 >= n then
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	if 2 < n then
																		for l = 39, 97 do
																			if 3 < n then
																				f[d[e]] = r[d[h]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															else
																if -4 < n then
																	for c = 27, 86 do
																		if n ~= 0 then
																			l = d[e]
																			f[l] = f[l]()
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = o[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										else
											if 201 <= n then
												if 202 > n then
													local n, r;
													f[d[e]][d[h]] = f[d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													n = d[e];
													r = f[d[h]];
													f[n + 1] = r;
													f[n] = r[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = {};
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
												else
													if n > 199 then
														repeat
															if 203 > n then
																r[d[h]] = f[d[e]];
																break;
															end;
															o[d[h]] = f[d[e]];
														until true;
													else
														o[d[h]] = f[d[e]];
													end
												end
											else
												if n ~= 195 then
													for r = 27, 79 do
														if n < 200 then
															for n = 0, 6 do
																if n > 2 then
																	if n < 5 then
																		if -1 <= n then
																			for l = 14, 68 do
																				if n < 4 then
																					f[d[e]] = f[d[h]][d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]] = f[d[h]][d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if 3 <= n then
																			repeat
																				if 5 < n then
																					f[d[e]] = f[d[h]][d[c]];
																					break;
																				end;
																				f[d[e]] = f[d[h]][d[c]];
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																else
																	if 1 > n then
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	else
																		if n > 0 then
																			repeat
																				if 1 < n then
																					f[d[e]] = f[d[h]][d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]] = f[d[h]][d[c]];
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
															end
															break;
														end;
														local n, o;
														for r = 0, 4 do
															if r >= 2 then
																if 2 < r then
																	if r >= 1 then
																		for n = 17, 94 do
																			if 4 ~= r then
																				f[d[e]] = f[d[h]][d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			if (f[d[e]] == f[d[c]]) then
																				t = t + 1;
																			else
																				t = d[h];
																			end;
																			break;
																		end;
																	else
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															else
																if 0 == r then
																	n = d[e];
																	o = f[d[h]];
																	f[n + 1] = o;
																	f[n] = o[d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																end
															end
														end
														break;
													end;
												else
													local n, o;
													for r = 0, 4 do
														if r >= 2 then
															if 2 < r then
																if r >= 1 then
																	for n = 17, 94 do
																		if 4 ~= r then
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		if (f[d[e]] == f[d[c]]) then
																			t = t + 1;
																		else
																			t = d[h];
																		end;
																		break;
																	end;
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																n = d[e]
																f[n] = f[n](l(f, n + 1, d[h]))
																t = t + 1;
																d = k[t];
															end
														else
															if 0 == r then
																n = d[e];
																o = f[d[h]];
																f[n + 1] = o;
																f[n] = o[d[c]];
																t = t + 1;
																d = k[t];
															else
																f(d[e], d[h]);
																t = t + 1;
																d = k[t];
															end
														end
													end
												end
											end
										end
									else
										if n > 189 then
											if 191 >= n then
												if 188 <= n then
													for r = 22, 75 do
														if n > 190 then
															local n, o;
															for r = 0, 7 do
																if r <= 3 then
																	if r <= 1 then
																		if -3 <= r then
																			for l = 47, 59 do
																				if r > 0 then
																					f[d[e]][d[h]] = f[d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				n = d[e]
																				f[n] = f[n](f[n + 1])
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			n = d[e]
																			f[n] = f[n](f[n + 1])
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if r ~= -2 then
																			for n = 15, 56 do
																				if 2 ~= r then
																					f[d[e]][d[h]] = f[d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]][d[h]] = f[d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			f[d[e]][d[h]] = f[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																else
																	if 6 > r then
																		if r > 0 then
																			repeat
																				if r ~= 5 then
																					n = d[e];
																					o = f[d[h]];
																					f[n + 1] = o;
																					f[n] = o[d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f(d[e], d[h]);
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			n = d[e];
																			o = f[d[h]];
																			f[n + 1] = o;
																			f[n] = o[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if 4 ~= r then
																			repeat
																				if r > 6 then
																					n = d[e]
																					f[n](l(f, n + 1, d[h]))
																					break;
																				end;
																				f[d[e]] = (d[h] ~= 0);
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			f[d[e]] = (d[h] ~= 0);
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
															end
															break;
														end;
														local r, u, o, b, a, p, s, n;
														r = d[e]
														f[r] = f[r](f[r + 1])
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = f[d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = f[d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = f[d[c]];
														t = t + 1;
														d = k[t];
														r = d[e];
														u = f[d[h]];
														f[r + 1] = u;
														f[r] = u[d[c]];
														t = t + 1;
														d = k[t];
														n = 0;
														while n > -1 do
															if n >= 3 then
																if 4 >= n then
																	if 1 <= n then
																		repeat
																			if 4 > n then
																				p = o[a];
																				break;
																			end;
																			s = o[b];
																		until true;
																	else
																		s = o[b];
																	end
																else
																	if n >= 4 then
																		for d = 19, 90 do
																			if 5 ~= n then
																				n = -2;
																				break;
																			end;
																			f(s, p);
																			break;
																		end;
																	else
																		n = -2;
																	end
																end
															else
																if 1 <= n then
																	if n ~= 0 then
																		for d = 28, 96 do
																			if n ~= 2 then
																				b = e;
																				break;
																			end;
																			a = h;
																			break;
																		end;
																	else
																		a = h;
																	end
																else
																	o = d;
																end
															end
															n = n + 1
														end
														t = t + 1;
														d = k[t];
														f[d[e]] = (d[h] ~= 0);
														t = t + 1;
														d = k[t];
														r = d[e]
														f[r](l(f, r + 1, d[h]))
														t = t + 1;
														d = k[t];
														t = d[h];
														break;
													end;
												else
													local n, o;
													for r = 0, 7 do
														if r <= 3 then
															if r <= 1 then
																if -3 <= r then
																	for l = 47, 59 do
																		if r > 0 then
																			f[d[e]][d[h]] = f[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e]
																		f[n] = f[n](f[n + 1])
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	n = d[e]
																	f[n] = f[n](f[n + 1])
																	t = t + 1;
																	d = k[t];
																end
															else
																if r ~= -2 then
																	for n = 15, 56 do
																		if 2 ~= r then
																			f[d[e]][d[h]] = f[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]][d[h]] = f[d[c]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]][d[h]] = f[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if 6 > r then
																if r > 0 then
																	repeat
																		if r ~= 5 then
																			n = d[e];
																			o = f[d[h]];
																			f[n + 1] = o;
																			f[n] = o[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	n = d[e];
																	o = f[d[h]];
																	f[n + 1] = o;
																	f[n] = o[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 4 ~= r then
																	repeat
																		if r > 6 then
																			n = d[e]
																			f[n](l(f, n + 1, d[h]))
																			break;
																		end;
																		f[d[e]] = (d[h] ~= 0);
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]] = (d[h] ~= 0);
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											else
												if 192 < n then
													if n >= 190 then
														for k = 16, 73 do
															if n < 194 then
																local e = d[e];
																local c = d[c];
																local k = e + 2
																local e = {
																	f[e](f[e + 1], f[k])
																};
																for d = 1, c do
																	f[k + d] = e[d];
																end;
																local e = e[1]
																if e then
																	f[k] = e
																	t = d[h];
																else
																	t = t + 1;
																end;
																break;
															end;
															local d = d[e]
															f[d] = f[d](f[d + 1])
															break;
														end;
													else
														local k = d[e];
														local c = d[c];
														local e = k + 2
														local k = {
															f[k](f[k + 1], f[e])
														};
														for d = 1, c do
															f[e + d] = k[d];
														end;
														local k = k[1]
														if k then
															f[e] = k
															t = d[h];
														else
															t = t + 1;
														end;
													end
												else
													local n, o;
													for r = 0, 6 do
														if 3 <= r then
															if 5 <= r then
																if r > 2 then
																	repeat
																		if 5 < r then
																			f[d[e]][d[h]] = d[c];
																			break;
																		end;
																		f[d[e]] = {};
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]][d[h]] = d[c];
																end
															else
																if 2 <= r then
																	repeat
																		if r > 3 then
																			n = d[e];
																			o = f[d[h]];
																			f[n + 1] = o;
																			f[n] = o[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if 0 >= r then
																n = d[e];
																o = f[d[h]];
																f[n + 1] = o;
																f[n] = o[d[c]];
																t = t + 1;
																d = k[t];
															else
																if -2 <= r then
																	for n = 28, 70 do
																		if 1 ~= r then
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = {};
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										else
											if 188 > n then
												if n ~= 185 then
													for k = 25, 91 do
														if 186 ~= n then
															local k = f[d[c]];
															if k then
																t = t + 1;
															else
																f[d[e]] = k;
																t = d[h];
															end;
															break;
														end;
														if (f[d[e]] == f[d[c]]) then
															t = t + 1;
														else
															t = d[h];
														end;
														break;
													end;
												else
													local k = f[d[c]];
													if k then
														t = t + 1;
													else
														f[d[e]] = k;
														t = d[h];
													end;
												end
											else
												if n == 188 then
													local n, o;
													for r = 0, 6 do
														if r <= 2 then
															if 1 > r then
																f[d[e]][d[h]] = f[d[c]];
																t = t + 1;
																d = k[t];
															else
																if r ~= 0 then
																	repeat
																		if 1 ~= r then
																			n = d[e]
																			f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	n = d[e]
																	f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if 5 > r then
																if -1 <= r then
																	for l = 22, 63 do
																		if 3 < r then
																			f[d[e]] = {};
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e];
																		o = f[d[h]];
																		f[n + 1] = o;
																		f[n] = o[d[c]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																end
															else
																if 5 ~= r then
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																else
																	f[d[e]][d[h]] = d[c];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												else
													local n, a, p, u, r;
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													n = d[e];
													a = f[d[h]];
													f[n + 1] = a;
													f[n] = a[d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													p, u = b(f[n](l(f, n + 1, d[h])))
													s = u + n - 1
													r = 0;
													for d = n, s do
														r = r + 1;
														f[d] = p[r];
													end;
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, s))
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n]()
												end
											end
										end
									end
								else
									if n <= 212 then
										if 208 <= n then
											if 210 > n then
												if n ~= 209 then
													f[d[e]] = f[d[h]][d[c]];
												else
													do
														return f[d[e]]
													end
												end
											else
												if n >= 211 then
													if n ~= 211 then
														do
															return f[d[e]]
														end
													else
														f[d[e]] = f[d[h]] - f[d[c]];
													end
												else
													local s, o, b, a, u, n, r;
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = 0;
													while n > -1 do
														if n >= 3 then
															if n <= 4 then
																if n ~= 3 then
																	u = s[o];
																else
																	a = s[b];
																end
															else
																if n < 6 then
																	f(u, a);
																else
																	n = -2;
																end
															end
														else
															if n >= 1 then
																if n >= 0 then
																	repeat
																		if n > 1 then
																			b = h;
																			break;
																		end;
																		o = e;
																	until true;
																else
																	o = e;
																end
															else
																s = d;
															end
														end
														n = n + 1
													end
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													r = d[e]
													f[r] = f[r](l(f, r + 1, d[h]))
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = f[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													t = d[h];
												end
											end
										else
											if 205 >= n then
												if 205 == n then
													local n, r;
													for o = 0, 4 do
														if o < 2 then
															if -2 <= o then
																for s = 10, 76 do
																	if o ~= 0 then
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																	break;
																end;
															else
																n = d[e];
																r = f[d[h]];
																f[n + 1] = r;
																f[n] = r[d[c]];
																t = t + 1;
																d = k[t];
															end
														else
															if o > 2 then
																if 4 ~= o then
																	f[d[e]][d[h]] = d[c];
																	t = t + 1;
																	d = k[t];
																else
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																end
															else
																f[d[e]] = {};
																t = t + 1;
																d = k[t];
															end
														end
													end
												else
													local o, n, s;
													o = d[h];
													n = f[o]
													for d = o + 1, d[c] do
														n = n .. f[d];
													end;
													f[d[e]] = n;
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = f[d[c]];
													t = t + 1;
													d = k[t];
													s = d[e]
													f[s](l(f, s + 1, d[h]))
													t = t + 1;
													d = k[t];
													r[d[h]] = f[d[e]];
													t = t + 1;
													d = k[t];
													do
														return
													end;
												end
											else
												if n ~= 206 then
													local l;
													for n = 0, 5 do
														if n <= 2 then
															if 0 >= n then
																f[d[e]] = f[d[h]];
																t = t + 1;
																d = k[t];
															else
																if n > -3 then
																	repeat
																		if n ~= 1 then
																			f[d[e]] = r[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		l = d[e]
																		f[l](f[l + 1])
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	l = d[e]
																	f[l](f[l + 1])
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if n > 3 then
																if n >= 2 then
																	for l = 20, 68 do
																		if 4 < n then
																			if not f[d[e]] then
																				t = t + 1;
																			else
																				t = d[h];
																			end;
																			break;
																		end;
																		f[d[e]] = f[d[h]][f[d[c]]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = f[d[h]][f[d[c]]];
																	t = t + 1;
																	d = k[t];
																end
															else
																f[d[e]] = r[d[h]];
																t = t + 1;
																d = k[t];
															end
														end
													end
												else
													if (f[d[e]] < f[d[c]]) then
														t = t + 1;
													else
														t = d[h];
													end;
												end
											end
										end
									else
										if n >= 218 then
											if n <= 219 then
												if 215 ~= n then
													for o = 27, 53 do
														if n > 218 then
															local s, n, o;
															s = d[h];
															n = f[s]
															for d = s + 1, d[c] do
																n = n .. f[d];
															end;
															f[d[e]] = n;
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = f[d[c]];
															t = t + 1;
															d = k[t];
															o = d[e]
															f[o](l(f, o + 1, d[h]))
															t = t + 1;
															d = k[t];
															r[d[h]] = f[d[e]];
															t = t + 1;
															d = k[t];
															do
																return
															end;
															break;
														end;
														local r, n;
														for l = 0, 5 do
															if l >= 3 then
																if 4 > l then
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																else
																	if l == 5 then
																		f[d[e]][d[h]] = d[c];
																	else
																		f[d[e]][d[h]] = d[c];
																		t = t + 1;
																		d = k[t];
																	end
																end
															else
																if l < 1 then
																	f[d[e]] = f[d[h]];
																	t = t + 1;
																	d = k[t];
																else
																	if 0 ~= l then
																		repeat
																			if l ~= 2 then
																				f[d[e]]();
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			r = d[e];
																			n = f[d[h]];
																			f[r + 1] = n;
																			f[r] = n[d[c]];
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		r = d[e];
																		n = f[d[h]];
																		f[r + 1] = n;
																		f[r] = n[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
														break;
													end;
												else
													local s, n, o;
													s = d[h];
													n = f[s]
													for d = s + 1, d[c] do
														n = n .. f[d];
													end;
													f[d[e]] = n;
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = f[d[c]];
													t = t + 1;
													d = k[t];
													o = d[e]
													f[o](l(f, o + 1, d[h]))
													t = t + 1;
													d = k[t];
													r[d[h]] = f[d[e]];
													t = t + 1;
													d = k[t];
													do
														return
													end;
												end
											else
												if n < 221 then
													local n, r;
													for o = 0, 4 do
														if o > 1 then
															if o < 3 then
																n = d[e]
																f[n] = f[n](l(f, n + 1, d[h]))
																t = t + 1;
																d = k[t];
															else
																if -1 < o then
																	for n = 20, 85 do
																		if o ~= 3 then
																			if (f[d[e]] ~= f[d[c]]) then
																				t = t + 1;
																			else
																				t = d[h];
																			end;
																			break;
																		end;
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if o > -1 then
																repeat
																	if 0 ~= o then
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																	n = d[e];
																	r = f[d[h]];
																	f[n + 1] = r;
																	f[n] = r[d[c]];
																	t = t + 1;
																	d = k[t];
																until true;
															else
																n = d[e];
																r = f[d[h]];
																f[n + 1] = r;
																f[n] = r[d[c]];
																t = t + 1;
																d = k[t];
															end
														end
													end
												else
													if 218 < n then
														for t = 19, 91 do
															if 221 < n then
																local t = d[e];
																local e = f[t];
																for d = t + 1, d[h] do
																	a.zVSAliLu(e, f[d])
																end;
																break;
															end;
															local t = d[e]
															local e, d = b(f[t](l(f, t + 1, d[h])))
															s = d + t - 1
															local d = 0;
															for t = t, s do
																d = d + 1;
																f[t] = e[d];
															end;
															break;
														end;
													else
														local t = d[e]
														local e, d = b(f[t](l(f, t + 1, d[h])))
														s = d + t - 1
														local d = 0;
														for t = t, s do
															d = d + 1;
															f[t] = e[d];
														end;
													end
												end
											end
										else
											if n <= 214 then
												if 211 < n then
													repeat
														if n ~= 213 then
															local n;
															for r = 0, 4 do
																if 2 <= r then
																	if 2 < r then
																		if r ~= 2 then
																			repeat
																				if 4 ~= r then
																					n = d[e]
																					f[n] = f[n](l(f, n + 1, d[h]))
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				if not f[d[e]] then
																					t = t + 1;
																				else
																					t = d[h];
																				end;
																			until true;
																		else
																			if not f[d[e]] then
																				t = t + 1;
																			else
																				t = d[h];
																			end;
																		end
																	else
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if -2 < r then
																		for o = 38, 60 do
																			if 1 ~= r then
																				n = d[e]
																				f[n] = f[n](l(f, n + 1, d[h]))
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
															break;
														end;
														local o, n, s;
														o = d[h];
														n = f[o]
														for d = o + 1, d[c] do
															n = n .. f[d];
														end;
														f[d[e]] = n;
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = f[d[c]];
														t = t + 1;
														d = k[t];
														s = d[e]
														f[s](l(f, s + 1, d[h]))
														t = t + 1;
														d = k[t];
														r[d[h]] = f[d[e]];
														t = t + 1;
														d = k[t];
														do
															return
														end;
													until true;
												else
													local n;
													for r = 0, 4 do
														if 2 <= r then
															if 2 < r then
																if r ~= 2 then
																	repeat
																		if 4 ~= r then
																			n = d[e]
																			f[n] = f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		if not f[d[e]] then
																			t = t + 1;
																		else
																			t = d[h];
																		end;
																	until true;
																else
																	if not f[d[e]] then
																		t = t + 1;
																	else
																		t = d[h];
																	end;
																end
															else
																f[d[e]] = f[d[h]][d[c]];
																t = t + 1;
																d = k[t];
															end
														else
															if -2 < r then
																for o = 38, 60 do
																	if 1 ~= r then
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																	break;
																end;
															else
																f[d[e]] = f[d[h]][d[c]];
																t = t + 1;
																d = k[t];
															end
														end
													end
												end
											else
												if n <= 215 then
													f[d[e]] = f[d[h]] * d[c];
												else
													if 216 < n then
														local o, l;
														for n = 0, 4 do
															if n <= 1 then
																if n == 1 then
																	o = d[e];
																	l = f[d[h]];
																	f[o + 1] = l;
																	f[o] = l[d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 2 >= n then
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																else
																	if n ~= 4 then
																		f[d[e]][d[h]] = d[c];
																		t = t + 1;
																		d = k[t];
																	else
																		if f[d[e]] then
																			t = t + 1;
																		else
																			t = d[h];
																		end;
																	end
																end
															end
														end
													else
														if (f[d[e]] == d[c]) then
															t = t + 1;
														else
															t = d[h];
														end;
													end
												end
											end
										end
									end
								end
							end
						else
							if n < 260 then
								if 241 <= n then
									if n > 249 then
										if 255 <= n then
											if 257 <= n then
												if n >= 258 then
													if n >= 254 then
														for a = 49, 73 do
															if 259 ~= n then
																local n, g, u, _, a, p;
																for u = 0, 6 do
																	if 3 > u then
																		if 1 <= u then
																			if -1 < u then
																				repeat
																					if u ~= 2 then
																						f[d[e]] = f[d[h]][d[c]];
																						t = t + 1;
																						d = k[t];
																						break;
																					end;
																					f[d[e]] = (d[h] ~= 0);
																					t = t + 1;
																					d = k[t];
																				until true;
																			else
																				f[d[e]] = f[d[h]][d[c]];
																				t = t + 1;
																				d = k[t];
																			end
																		else
																			f[d[e]] = r[d[h]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if 4 < u then
																			if u > 1 then
																				repeat
																					if 5 < u then
																						n = d[e]
																						p = {
																							f[n](l(f, n + 1, s))
																						};
																						a = 0;
																						for d = n, d[c] do
																							a = a + 1;
																							f[d] = p[a];
																						end
																						break;
																					end;
																					n = d[e]
																					p, _ = b(f[n](f[n + 1]))
																					s = _ + n - 1
																					a = 0;
																					for d = n, s do
																						a = a + 1;
																						f[d] = p[a];
																					end;
																					t = t + 1;
																					d = k[t];
																				until true;
																			else
																				n = d[e]
																				p, _ = b(f[n](f[n + 1]))
																				s = _ + n - 1
																				a = 0;
																				for d = n, s do
																					a = a + 1;
																					f[d] = p[a];
																				end;
																				t = t + 1;
																				d = k[t];
																			end
																		else
																			if u == 4 then
																				n = d[e];
																				g = f[d[h]];
																				f[n + 1] = g;
																				f[n] = g[d[c]];
																				t = t + 1;
																				d = k[t];
																			else
																				f[d[e]] = o[d[h]];
																				t = t + 1;
																				d = k[t];
																			end
																		end
																	end
																end
																break;
															end;
															local s, p, b, a, u, n, r;
															for n = 0, 6 do
																if 2 >= n then
																	if n < 1 then
																		n = 0;
																		while n > -1 do
																			if n >= 3 then
																				if n > 4 then
																					if n == 6 then
																						n = -2;
																					else
																						f(u, a);
																					end
																				else
																					if -1 < n then
																						for d = 49, 65 do
																							if 3 ~= n then
																								u = s[p];
																								break;
																							end;
																							a = s[b];
																							break;
																						end;
																					else
																						a = s[b];
																					end
																				end
																			else
																				if 0 < n then
																					if n == 1 then
																						p = e;
																					else
																						b = h;
																					end
																				else
																					s = d;
																				end
																			end
																			n = n + 1
																		end
																		t = t + 1;
																		d = k[t];
																	else
																		if n == 1 then
																			f[d[e]] = o[d[h]];
																			t = t + 1;
																			d = k[t];
																		else
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	end
																else
																	if n <= 4 then
																		if n > 0 then
																			repeat
																				if n ~= 4 then
																					f[d[e]] = f[d[h]][d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				r = d[e]
																				f[r] = f[r](l(f, r + 1, d[h]))
																				t = t + 1;
																				d = k[t];
																			until true;
																		else
																			r = d[e]
																			f[r] = f[r](l(f, r + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if n ~= 1 then
																			for l = 29, 64 do
																				if n ~= 6 then
																					f[d[e]] = {};
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f[d[e]][d[h]] = f[d[c]];
																				break;
																			end;
																		else
																			f[d[e]][d[h]] = f[d[c]];
																		end
																	end
																end
															end
															break;
														end;
													else
														local s, p, a, b, u, n, r;
														for n = 0, 6 do
															if 2 >= n then
																if n < 1 then
																	n = 0;
																	while n > -1 do
																		if n >= 3 then
																			if n > 4 then
																				if n == 6 then
																					n = -2;
																				else
																					f(u, b);
																				end
																			else
																				if -1 < n then
																					for d = 49, 65 do
																						if 3 ~= n then
																							u = s[p];
																							break;
																						end;
																						b = s[a];
																						break;
																					end;
																				else
																					b = s[a];
																				end
																			end
																		else
																			if 0 < n then
																				if n == 1 then
																					p = e;
																				else
																					a = h;
																				end
																			else
																				s = d;
																			end
																		end
																		n = n + 1
																	end
																	t = t + 1;
																	d = k[t];
																else
																	if n == 1 then
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	else
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															else
																if n <= 4 then
																	if n > 0 then
																		repeat
																			if n ~= 4 then
																				f[d[e]] = f[d[h]][d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			r = d[e]
																			f[r] = f[r](l(f, r + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		r = d[e]
																		f[r] = f[r](l(f, r + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if n ~= 1 then
																		for l = 29, 64 do
																			if n ~= 6 then
																				f[d[e]] = {};
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]][d[h]] = f[d[c]];
																			break;
																		end;
																	else
																		f[d[e]][d[h]] = f[d[c]];
																	end
																end
															end
														end
													end
												else
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]] - f[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
												end
											else
												if n >= 254 then
													for o = 40, 72 do
														if n ~= 256 then
															local n;
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]];
															t = t + 1;
															d = k[t];
															n = d[e]
															f[n] = f[n](f[n + 1])
															t = t + 1;
															d = k[t];
															f[d[e]][f[d[h]]] = f[d[c]];
															t = t + 1;
															d = k[t];
															do
																return
															end;
															break;
														end;
														local n, r;
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]] - f[d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														n = d[e];
														r = f[d[h]];
														f[n + 1] = r;
														f[n] = r[d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]];
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n](l(f, n + 1, d[h]))
														t = t + 1;
														d = k[t];
														if (d[e] < f[d[c]]) then
															t = d[h];
														else
															t = t + 1;
														end;
														break;
													end;
												else
													local n, r;
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]] - f[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													n = d[e];
													r = f[d[h]];
													f[n + 1] = r;
													f[n] = r[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]];
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													if (d[e] < f[d[c]]) then
														t = d[h];
													else
														t = t + 1;
													end;
												end
											end
										else
											if 252 <= n then
												if 253 > n then
													local o;
													for n = 0, 6 do
														if 3 > n then
															if n < 1 then
																f[d[e]] = f[d[h]][d[c]];
																t = t + 1;
																d = k[t];
															else
																if n ~= 1 then
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																else
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if n <= 4 then
																if n > 2 then
																	for c = 34, 67 do
																		if 3 ~= n then
																			o = d[e]
																			f[o] = f[o](l(f, o + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 6 == n then
																	f[d[e]][d[h]] = d[c];
																else
																	f[d[e]][d[h]] = f[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												else
													if n >= 250 then
														for r = 42, 53 do
															if 254 ~= n then
																local n;
																for r = 0, 4 do
																	if 2 > r then
																		if r ~= 0 then
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																		else
																			f[d[e]] = {};
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if 3 > r then
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																		else
																			if 0 ~= r then
																				for o = 22, 89 do
																					if 3 ~= r then
																						n = d[e]
																						f[n](l(f, n + 1, d[h]))
																						break;
																					end;
																					f[d[e]][d[h]] = d[c];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																			else
																				n = d[e]
																				f[n](l(f, n + 1, d[h]))
																			end
																		end
																	end
																end
																break;
															end;
															f[d[e]] = f[d[h]] * f[d[c]];
															break;
														end;
													else
														local n;
														for r = 0, 4 do
															if 2 > r then
																if r ~= 0 then
																	f[d[e]][d[h]] = d[c];
																	t = t + 1;
																	d = k[t];
																else
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																end
															else
																if 3 > r then
																	f[d[e]][d[h]] = d[c];
																	t = t + 1;
																	d = k[t];
																else
																	if 0 ~= r then
																		for o = 22, 89 do
																			if 3 ~= r then
																				n = d[e]
																				f[n](l(f, n + 1, d[h]))
																				break;
																			end;
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		n = d[e]
																		f[n](l(f, n + 1, d[h]))
																	end
																end
															end
														end
													end
												end
											else
												if 251 == n then
													local t = d[e]
													local h = {
														f[t](l(f, t + 1, s))
													};
													local e = 0;
													for d = t, d[c] do
														e = e + 1;
														f[d] = h[e];
													end
												else
													local n, r;
													n = d[e];
													r = f[d[h]];
													f[n + 1] = r;
													f[n] = r[d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													n = d[e];
													r = f[d[h]];
													f[n + 1] = r;
													f[n] = r[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													if f[d[e]] then
														t = t + 1;
													else
														t = d[h];
													end;
												end
											end
										end
									else
										if 244 >= n then
											if 243 <= n then
												if n > 243 then
													local r, l, s, b, u, a, n;
													r = d[e]
													f[r] = f[r](f[r + 1])
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = f[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = f[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													n = 0;
													while n > -1 do
														if n <= 2 then
															if 0 >= n then
																l = d;
															else
																if n ~= 0 then
																	for d = 27, 92 do
																		if 2 ~= n then
																			s = e;
																			break;
																		end;
																		b = h;
																		break;
																	end;
																else
																	s = e;
																end
															end
														else
															if 4 >= n then
																if 2 ~= n then
																	repeat
																		if 4 > n then
																			u = l[b];
																			break;
																		end;
																		a = l[s];
																	until true;
																else
																	a = l[s];
																end
															else
																if 4 ~= n then
																	repeat
																		if n ~= 5 then
																			n = -2;
																			break;
																		end;
																		f(a, u);
																	until true;
																else
																	n = -2;
																end
															end
														end
														n = n + 1
													end
												else
													f[d[e]] = {};
												end
											else
												if n > 240 then
													repeat
														if n > 241 then
															local o, s, u, b, p, a, n, _;
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															n = 0;
															while n > -1 do
																if n < 4 then
																	if n < 2 then
																		if n == 0 then
																			o = d;
																		else
																			s = e;
																		end
																	else
																		if 1 ~= n then
																			repeat
																				if 2 ~= n then
																					b = f;
																					break;
																				end;
																				u = h;
																			until true;
																		else
																			b = f;
																		end
																	end
																else
																	if n < 6 then
																		if 0 ~= n then
																			repeat
																				if n ~= 4 then
																					a = o[s];
																					break;
																				end;
																				p = b[o[u]];
																			until true;
																		else
																			a = o[s];
																		end
																	else
																		if 2 < n then
																			repeat
																				if 6 < n then
																					n = -2;
																					break;
																				end;
																				f[a] = p;
																			until true;
																		else
																			n = -2;
																		end
																	end
																end
																n = n + 1
															end
															t = t + 1;
															d = k[t];
															n = 0;
															while n > -1 do
																if n > 3 then
																	if n < 6 then
																		if n >= 1 then
																			for d = 36, 81 do
																				if 5 ~= n then
																					p = b[o[u]];
																					break;
																				end;
																				a = o[s];
																				break;
																			end;
																		else
																			a = o[s];
																		end
																	else
																		if n == 6 then
																			f[a] = p;
																		else
																			n = -2;
																		end
																	end
																else
																	if 2 <= n then
																		if -1 ~= n then
																			repeat
																				if n ~= 2 then
																					b = f;
																					break;
																				end;
																				u = h;
																			until true;
																		else
																			u = h;
																		end
																	else
																		if n > 0 then
																			s = e;
																		else
																			o = d;
																		end
																	end
																end
																n = n + 1
															end
															t = t + 1;
															d = k[t];
															n = 0;
															while n > -1 do
																if 4 > n then
																	if 2 <= n then
																		if 1 < n then
																			repeat
																				if 3 ~= n then
																					u = h;
																					break;
																				end;
																				b = f;
																			until true;
																		else
																			b = f;
																		end
																	else
																		if -2 <= n then
																			for t = 34, 73 do
																				if n > 0 then
																					s = e;
																					break;
																				end;
																				o = d;
																				break;
																			end;
																		else
																			s = e;
																		end
																	end
																else
																	if n < 6 then
																		if 4 == n then
																			p = b[o[u]];
																		else
																			a = o[s];
																		end
																	else
																		if n >= 3 then
																			repeat
																				if n > 6 then
																					n = -2;
																					break;
																				end;
																				f[a] = p;
																			until true;
																		else
																			n = -2;
																		end
																	end
																end
																n = n + 1
															end
															t = t + 1;
															d = k[t];
															_ = d[e]
															f[_] = f[_](l(f, _ + 1, d[h]))
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]][f[d[c]]];
															t = t + 1;
															d = k[t];
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]] + f[d[c]];
															break;
														end;
														f[d[e]][d[h]] = d[c];
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = d[c];
														t = t + 1;
														d = k[t];
														do
															return
														end;
													until true;
												else
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													do
														return
													end;
												end
											end
										else
											if 246 >= n then
												if n == 245 then
													local n, o;
													for r = 0, 6 do
														if r >= 3 then
															if r < 5 then
																if 4 ~= r then
																	n = d[e];
																	o = f[d[h]];
																	f[n + 1] = o;
																	f[n] = o[d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																end
															else
																if r ~= 3 then
																	for o = 25, 83 do
																		if r ~= 5 then
																			f[d[e]][d[h]] = f[d[c]];
																			break;
																		end;
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if 0 >= r then
																f(d[e], d[h]);
																t = t + 1;
																d = k[t];
															else
																if r == 2 then
																	f[d[e]][d[h]] = f[d[c]];
																	t = t + 1;
																	d = k[t];
																else
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												else
													local r, o;
													for n = 0, 6 do
														if 3 <= n then
															if n <= 4 then
																if 4 == n then
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																else
																	r = d[e];
																	o = f[d[h]];
																	f[r + 1] = o;
																	f[r] = o[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 1 <= n then
																	for l = 14, 75 do
																		if 5 ~= n then
																			f[d[e]][d[h]] = d[c];
																			break;
																		end;
																		f[d[e]][d[h]] = d[c];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]][d[h]] = d[c];
																end
															end
														else
															if n <= 0 then
																f[d[e]][d[h]] = f[d[c]];
																t = t + 1;
																d = k[t];
															else
																if n >= -3 then
																	for c = 17, 92 do
																		if n ~= 1 then
																			r = d[e]
																			f[r](l(f, r + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											else
												if n <= 247 then
													for n = 0, 9 do
														if n < 5 then
															if n <= 1 then
																if -3 < n then
																	for c = 48, 62 do
																		if 1 ~= n then
																			f[d[e]] = (d[h] ~= 0);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = (d[h] ~= 0);
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = (d[h] ~= 0);
																	t = t + 1;
																	d = k[t];
																end
															else
																if 3 <= n then
																	if -1 <= n then
																		repeat
																			if n ~= 4 then
																				f(d[e], d[h]);
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f(d[e], d[h]);
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	end
																else
																	f[d[e]] = (d[h] ~= 0);
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if n < 7 then
																if n >= 1 then
																	repeat
																		if n ~= 6 then
																			f[d[e]] = f[d[h]] * f[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = (d[h] ~= 0);
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]] = f[d[h]] * f[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 7 >= n then
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																else
																	if 8 == n then
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	else
																		f[d[e]] = f[d[h]][d[c]];
																	end
																end
															end
														end
													end
												else
													if 249 ~= n then
														if not f[d[e]] then
															t = t + 1;
														else
															t = d[h];
														end;
													else
														local n, r;
														n = d[e];
														r = f[d[h]];
														f[n + 1] = r;
														f[n] = r[d[c]];
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n](l(f, n + 1, d[h]))
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														n = d[e];
														r = f[d[h]];
														f[n + 1] = r;
														f[n] = r[d[c]];
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n](l(f, n + 1, d[h]))
													end
												end
											end
										end
									end
								else
									if 232 <= n then
										if n < 236 then
											if 234 > n then
												if n > 231 then
													repeat
														if n < 233 then
															local n, r;
															for o = 0, 6 do
																if 3 > o then
																	if 0 < o then
																		if o > 0 then
																			for l = 14, 70 do
																				if o ~= 2 then
																					f[d[e]][d[h]] = f[d[c]];
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				n = d[e];
																				r = f[d[h]];
																				f[n + 1] = r;
																				f[n] = r[d[c]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			n = d[e];
																			r = f[d[h]];
																			f[n + 1] = r;
																			f[n] = r[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		n = d[e]
																		f[n] = f[n](f[n + 1])
																		t = t + 1;
																		d = k[t];
																	end
																else
																	if 4 < o then
																		if 5 < o then
																			n = d[e];
																			r = f[d[h]];
																			f[n + 1] = r;
																			f[n] = r[d[c]];
																		else
																			n = d[e]
																			f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if o >= 2 then
																			for c = 20, 82 do
																				if 3 < o then
																					f[d[e]] = (d[h] ~= 0);
																					t = t + 1;
																					d = k[t];
																					break;
																				end;
																				f(d[e], d[h]);
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																		else
																			f[d[e]] = (d[h] ~= 0);
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
															end
															break;
														end;
														local l, o;
														for n = 0, 4 do
															if 1 < n then
																if n <= 2 then
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																else
																	if 0 <= n then
																		for l = 23, 96 do
																			if n > 3 then
																				if f[d[e]] then
																					t = t + 1;
																				else
																					t = d[h];
																				end;
																				break;
																			end;
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																	else
																		if f[d[e]] then
																			t = t + 1;
																		else
																			t = d[h];
																		end;
																	end
																end
															else
																if n ~= -4 then
																	repeat
																		if 0 ~= n then
																			l = d[e];
																			o = f[d[h]];
																			f[l + 1] = o;
																			f[l] = o[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													until true;
												else
													local n, r;
													for o = 0, 6 do
														if 3 > o then
															if 0 < o then
																if o > 0 then
																	for l = 14, 70 do
																		if o ~= 2 then
																			f[d[e]][d[h]] = f[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	n = d[e];
																	r = f[d[h]];
																	f[n + 1] = r;
																	f[n] = r[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																n = d[e]
																f[n] = f[n](f[n + 1])
																t = t + 1;
																d = k[t];
															end
														else
															if 4 < o then
																if 5 < o then
																	n = d[e];
																	r = f[d[h]];
																	f[n + 1] = r;
																	f[n] = r[d[c]];
																else
																	n = d[e]
																	f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															else
																if o >= 2 then
																	for c = 20, 82 do
																		if 3 < o then
																			f[d[e]] = (d[h] ~= 0);
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = (d[h] ~= 0);
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											else
												if n ~= 231 then
													repeat
														if 234 ~= n then
															local n;
															f[d[e]] = o[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]][d[c]];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															n = d[e]
															f[n] = f[n](l(f, n + 1, d[h]))
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															break;
														end;
														local t = d[e]
														f[t](l(f, t + 1, d[h]))
													until true;
												else
													local t = d[e]
													f[t](l(f, t + 1, d[h]))
												end
											end
										else
											if n > 237 then
												if n < 239 then
													local r, o;
													for n = 0, 6 do
														if 2 < n then
															if 4 < n then
																if n >= 1 then
																	for l = 33, 71 do
																		if n < 6 then
																			f[d[e]][d[h]] = d[c];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]][d[h]] = d[c];
																		break;
																	end;
																else
																	f[d[e]][d[h]] = d[c];
																end
															else
																if n >= 1 then
																	repeat
																		if 4 ~= n then
																			r = d[e];
																			o = f[d[h]];
																			f[r + 1] = o;
																			f[r] = o[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = {};
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if n <= 0 then
																f[d[e]][d[h]] = f[d[c]];
																t = t + 1;
																d = k[t];
															else
																if n ~= 2 then
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																else
																	r = d[e]
																	f[r](l(f, r + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												else
													if 240 == n then
														if f[d[e]] then
															t = t + 1;
														else
															t = d[h];
														end;
													else
														f[d[e]] = {};
													end
												end
											else
												if n ~= 237 then
													local n, r;
													for o = 0, 4 do
														if 1 >= o then
															if o ~= -3 then
																repeat
																	if o ~= 0 then
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																until true;
															else
																n = d[e];
																r = f[d[h]];
																f[n + 1] = r;
																f[n] = r[d[c]];
																t = t + 1;
																d = k[t];
															end
														else
															if 3 > o then
																f(d[e], d[h]);
																t = t + 1;
																d = k[t];
															else
																if 1 <= o then
																	for c = 12, 78 do
																		if o ~= 4 then
																			n = d[e]
																			f[n] = f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		if f[d[e]] then
																			t = t + 1;
																		else
																			t = d[h];
																		end;
																		break;
																	end;
																else
																	if f[d[e]] then
																		t = t + 1;
																	else
																		t = d[h];
																	end;
																end
															end
														end
													end
												else
													local l;
													for n = 0, 7 do
														if n >= 4 then
															if n >= 6 then
																if 4 ~= n then
																	repeat
																		if 7 > n then
																			f[d[e]] = #f[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		if (f[d[e]] ~= d[c]) then
																			t = t + 1;
																		else
																			t = d[h];
																		end;
																	until true;
																else
																	f[d[e]] = #f[d[h]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 0 < n then
																	for l = 42, 78 do
																		if n < 5 then
																			f[d[e]] = r[d[h]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if n <= 1 then
																if -1 < n then
																	for l = 20, 88 do
																		if n < 1 then
																			f[d[e]] = f[d[h]][d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = r[d[h]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 0 ~= n then
																	repeat
																		if n ~= 2 then
																			l = d[e]
																			f[l](f[l + 1])
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]] = f[d[h]][d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												end
											end
										end
									else
										if 227 > n then
											if n < 225 then
												if 224 > n then
													f[d[e]]();
												else
													local n;
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](f[n + 1])
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = f[d[h]][d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](f[n + 1])
												end
											else
												if n >= 221 then
													for r = 13, 73 do
														if 225 ~= n then
															local n, p, a, _, r, u;
															for a = 0, 4 do
																if 2 <= a then
																	if 3 > a then
																		n = d[e]
																		u, _ = b(f[n](f[n + 1]))
																		s = _ + n - 1
																		r = 0;
																		for d = n, s do
																			r = r + 1;
																			f[d] = u[r];
																		end;
																		t = t + 1;
																		d = k[t];
																	else
																		if 3 < a then
																			t = d[h];
																		else
																			n = d[e]
																			u = {
																				f[n](l(f, n + 1, s))
																			};
																			r = 0;
																			for d = n, d[c] do
																				r = r + 1;
																				f[d] = u[r];
																			end
																			t = t + 1;
																			d = k[t];
																		end
																	end
																else
																	if -4 ~= a then
																		repeat
																			if a < 1 then
																				f[d[e]] = o[d[h]];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e];
																			p = f[d[h]];
																			f[n + 1] = p;
																			f[n] = p[d[c]];
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
															break;
														end;
														f[d[e]]();
														break;
													end;
												else
													local n, p, a, _, r, u;
													for a = 0, 4 do
														if 2 <= a then
															if 3 > a then
																n = d[e]
																u, _ = b(f[n](f[n + 1]))
																s = _ + n - 1
																r = 0;
																for d = n, s do
																	r = r + 1;
																	f[d] = u[r];
																end;
																t = t + 1;
																d = k[t];
															else
																if 3 < a then
																	t = d[h];
																else
																	n = d[e]
																	u = {
																		f[n](l(f, n + 1, s))
																	};
																	r = 0;
																	for d = n, d[c] do
																		r = r + 1;
																		f[d] = u[r];
																	end
																	t = t + 1;
																	d = k[t];
																end
															end
														else
															if -4 ~= a then
																repeat
																	if a < 1 then
																		f[d[e]] = o[d[h]];
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																	n = d[e];
																	p = f[d[h]];
																	f[n + 1] = p;
																	f[n] = p[d[c]];
																	t = t + 1;
																	d = k[t];
																until true;
															else
																f[d[e]] = o[d[h]];
																t = t + 1;
																d = k[t];
															end
														end
													end
												end
											end
										else
											if 228 < n then
												if n > 229 then
													if 229 ~= n then
														repeat
															if n ~= 231 then
																local n, r;
																n = d[e];
																r = f[d[h]];
																f[n + 1] = r;
																f[n] = r[d[c]];
																t = t + 1;
																d = k[t];
																f(d[e], d[h]);
																t = t + 1;
																d = k[t];
																n = d[e]
																f[n] = f[n](l(f, n + 1, d[h]))
																t = t + 1;
																d = k[t];
																f[d[e]] = f[d[h]][d[c]];
																t = t + 1;
																d = k[t];
																n = d[e];
																r = f[d[h]];
																f[n + 1] = r;
																f[n] = r[d[c]];
																t = t + 1;
																d = k[t];
																f(d[e], d[h]);
																t = t + 1;
																d = k[t];
																n = d[e]
																f[n] = f[n](l(f, n + 1, d[h]))
																break;
															end;
															f[d[e]] = (d[h] ~= 0);
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															f[d[e]] = (d[h] ~= 0);
															t = t + 1;
															d = k[t];
															f[d[e]] = (d[h] ~= 0);
															t = t + 1;
															d = k[t];
															f[d[e]] = (d[h] ~= 0);
															t = t + 1;
															d = k[t];
															f[d[e]] = (d[h] ~= 0);
															t = t + 1;
															d = k[t];
															f[d[e]] = (d[h] ~= 0);
														until true;
													else
														local n, r;
														n = d[e];
														r = f[d[h]];
														f[n + 1] = r;
														f[n] = r[d[c]];
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n](l(f, n + 1, d[h]))
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														n = d[e];
														r = f[d[h]];
														f[n + 1] = r;
														f[n] = r[d[c]];
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n](l(f, n + 1, d[h]))
													end
												else
													if (f[d[e]] <= f[d[c]]) then
														t = d[h];
													else
														t = t + 1;
													end;
												end
											else
												if n == 227 then
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													do
														return
													end;
												else
													f[d[e]] = #f[d[h]];
												end
											end
										end
									end
								end
							else
								if n > 278 then
									if 287 >= n then
										if n <= 282 then
											if 281 <= n then
												if n ~= 281 then
													f[d[e]] = _(z[d[h]], nil, o);
												else
													local t = d[e]
													local h = {
														f[t](f[t + 1])
													};
													local e = 0;
													for d = t, d[c] do
														e = e + 1;
														f[d] = h[e];
													end
												end
											else
												if n > 276 then
													repeat
														if n < 280 then
															f[d[e]][d[h]] = d[c];
															t = t + 1;
															d = k[t];
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = d[c];
															t = t + 1;
															d = k[t];
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = d[c];
															t = t + 1;
															d = k[t];
															do
																return
															end;
															break;
														end;
														f[d[e]] = f[d[h]];
													until true;
												else
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													do
														return
													end;
												end
											end
										else
											if n > 284 then
												if 286 <= n then
													if 286 < n then
														local n, o;
														for r = 0, 6 do
															if r >= 3 then
																if r > 4 then
																	if 2 < r then
																		for n = 23, 69 do
																			if r < 6 then
																				f[d[e]][d[h]] = d[c];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			f[d[e]][d[h]] = d[c];
																			break;
																		end;
																	else
																		f[d[e]][d[h]] = d[c];
																	end
																else
																	if r ~= 1 then
																		repeat
																			if 3 < r then
																				f[d[e]] = {};
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e];
																			o = f[d[h]];
																			f[n + 1] = o;
																			f[n] = o[d[c]];
																			t = t + 1;
																			d = k[t];
																		until true;
																	else
																		n = d[e];
																		o = f[d[h]];
																		f[n + 1] = o;
																		f[n] = o[d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															else
																if 0 < r then
																	if 1 < r then
																		n = d[e]
																		f[n](l(f, n + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																	else
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	end
																else
																	f[d[e]][d[h]] = f[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													else
														local c, s, o, n, r, l;
														f[d[e]] = f[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]];
														t = t + 1;
														d = k[t];
														c = d[e]
														f[c] = f[c](f[c + 1])
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]];
														t = t + 1;
														d = k[t];
														do
															return f[d[e]]
														end
														t = t + 1;
														d = k[t];
														c = d[e];
														s = {};
														for d = 1, #u do
															o = u[d];
															for d = 0, #o do
																n = o[d];
																r = n[1];
																l = n[2];
																if r == f and l >= c then
																	s[l] = r[l];
																	n[1] = s;
																end;
															end;
														end;
														t = t + 1;
														d = k[t];
														t = d[h];
													end
												else
													local n, p, g, _, a, u;
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													n = d[e];
													p = f[d[h]];
													f[n + 1] = p;
													f[n] = p[d[c]];
													t = t + 1;
													d = k[t];
													n = d[e]
													u, _ = b(f[n](f[n + 1]))
													s = _ + n - 1
													a = 0;
													for d = n, s do
														a = a + 1;
														f[d] = u[a];
													end;
													t = t + 1;
													d = k[t];
													n = d[e]
													u = {
														f[n](l(f, n + 1, s))
													};
													a = 0;
													for d = n, d[c] do
														a = a + 1;
														f[d] = u[a];
													end
													t = t + 1;
													d = k[t];
													t = d[h];
												end
											else
												if 280 ~= n then
													repeat
														if n < 284 then
															if (f[d[e]] <= d[c]) then
																t = t + 1;
															else
																t = d[h];
															end;
															break;
														end;
														local k, l, r, n, c;
														local t = 0;
														while t > -1 do
															if 2 >= t then
																if t < 1 then
																	k = d;
																else
																	if 2 == t then
																		r = h;
																	else
																		l = e;
																	end
																end
															else
																if t > 4 then
																	if 6 > t then
																		f(c, n);
																	else
																		t = -2;
																	end
																else
																	if t ~= 3 then
																		c = k[l];
																	else
																		n = k[r];
																	end
																end
															end
															t = t + 1
														end
													until true;
												else
													local k, c, n, l, r;
													local t = 0;
													while t > -1 do
														if 2 >= t then
															if t < 1 then
																k = d;
															else
																if 2 == t then
																	n = h;
																else
																	c = e;
																end
															end
														else
															if t > 4 then
																if 6 > t then
																	f(r, l);
																else
																	t = -2;
																end
															else
																if t ~= 3 then
																	r = k[c];
																else
																	l = k[n];
																end
															end
														end
														t = t + 1
													end
												end
											end
										end
									else
										if 293 <= n then
											if 295 > n then
												if n ~= 293 then
													local r, o, s, b, p, a, u, n;
													for n = 0, 4 do
														if 2 <= n then
															if n > 2 then
																if -1 < n then
																	repeat
																		if n ~= 3 then
																			r = d[e]
																			f[r] = f[r](l(f, r + 1, d[h]))
																			break;
																		end;
																		n = 0;
																		while n > -1 do
																			if n <= 2 then
																				if n < 1 then
																					s = d;
																				else
																					if 1 == n then
																						b = e;
																					else
																						p = h;
																					end
																				end
																			else
																				if 4 < n then
																					if n == 5 then
																						f(u, a);
																					else
																						n = -2;
																					end
																				else
																					if 4 == n then
																						u = s[b];
																					else
																						a = s[p];
																					end
																				end
																			end
																			n = n + 1
																		end
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	r = d[e]
																	f[r] = f[r](l(f, r + 1, d[h]))
																end
															else
																r = d[e];
																o = f[d[h]];
																f[r + 1] = o;
																f[r] = o[d[c]];
																t = t + 1;
																d = k[t];
															end
														else
															if -4 ~= n then
																for c = 16, 93 do
																	if n > 0 then
																		r = d[e]
																		f[r] = f[r](l(f, r + 1, d[h]))
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																	f(d[e], d[h]);
																	t = t + 1;
																	d = k[t];
																	break;
																end;
															else
																f(d[e], d[h]);
																t = t + 1;
																d = k[t];
															end
														end
													end
												else
													local h, n, c;
													for l = 0, 1 do
														if -3 <= l then
															repeat
																if l > 0 then
																	h = d[e];
																	c = f[h];
																	for d = h + 1, s do
																		a.zVSAliLu(c, f[d])
																	end;
																	break;
																end;
																h = d[e];
																s = h + m - 1;
																for d = h, s do
																	n = g[d - h];
																	f[d] = n;
																end;
																t = t + 1;
																d = k[t];
															until true;
														else
															h = d[e];
															c = f[h];
															for d = h + 1, s do
																a.zVSAliLu(c, f[d])
															end;
														end
													end
												end
											else
												if n > 295 then
													if n >= 294 then
														repeat
															if 296 < n then
																local n, l;
																f[d[e]] = r[d[h]];
																t = t + 1;
																d = k[t];
																f[d[e]]();
																t = t + 1;
																d = k[t];
																f[d[e]] = r[d[h]];
																t = t + 1;
																d = k[t];
																n = d[e];
																l = f[d[h]];
																f[n + 1] = l;
																f[n] = l[d[c]];
																t = t + 1;
																d = k[t];
																f[d[e]] = {};
																t = t + 1;
																d = k[t];
																f[d[e]][d[h]] = d[c];
																t = t + 1;
																d = k[t];
																f[d[e]][d[h]] = d[c];
																break;
															end;
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]][d[c]];
															t = t + 1;
															d = k[t];
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]] * f[d[c]];
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]] * d[c];
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]] + f[d[c]];
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = f[d[c]];
														until true;
													else
														f[d[e]] = r[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = r[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]] = r[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]] * f[d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]] * d[c];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]] + f[d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = f[d[c]];
													end
												else
													local n, r;
													n = d[e];
													r = f[d[h]];
													f[n + 1] = r;
													f[n] = r[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = {};
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													n = d[e];
													r = f[d[h]];
													f[n + 1] = r;
													f[n] = r[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = {};
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
												end
											end
										else
											if n < 290 then
												if 288 == n then
													local t = d[e];
													local e = f[t];
													for d = t + 1, d[h] do
														a.zVSAliLu(e, f[d])
													end;
												else
													local o, l;
													for n = 0, 4 do
														if 1 < n then
															if n >= 3 then
																if n ~= 0 then
																	repeat
																		if 3 < n then
																			if not f[d[e]] then
																				t = t + 1;
																			else
																				t = d[h];
																			end;
																			break;
																		end;
																		f[d[e]][d[h]] = d[c];
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	f[d[e]][d[h]] = d[c];
																	t = t + 1;
																	d = k[t];
																end
															else
																f[d[e]] = {};
																t = t + 1;
																d = k[t];
															end
														else
															if n < 1 then
																f[d[e]] = r[d[h]];
																t = t + 1;
																d = k[t];
															else
																o = d[e];
																l = f[d[h]];
																f[o + 1] = l;
																f[o] = l[d[c]];
																t = t + 1;
																d = k[t];
															end
														end
													end
												end
											else
												if n >= 291 then
													if n >= 288 then
														for r = 24, 93 do
															if 292 > n then
																local n, u, _, p, r, a;
																f[d[e]] = f[d[h]][d[c]];
																t = t + 1;
																d = k[t];
																f[d[e]] = {};
																t = t + 1;
																d = k[t];
																f[d[e]] = o[d[h]];
																t = t + 1;
																d = k[t];
																f[d[e]] = o[d[h]];
																t = t + 1;
																d = k[t];
																f[d[e]] = f[d[h]][d[c]];
																t = t + 1;
																d = k[t];
																f[d[e]] = f[d[h]][d[c]];
																t = t + 1;
																d = k[t];
																n = d[e];
																u = f[d[h]];
																f[n + 1] = u;
																f[n] = u[d[c]];
																t = t + 1;
																d = k[t];
																n = d[e]
																a, p = b(f[n](f[n + 1]))
																s = p + n - 1
																r = 0;
																for d = n, s do
																	r = r + 1;
																	f[d] = a[r];
																end;
																t = t + 1;
																d = k[t];
																n = d[e]
																a = {
																	f[n](l(f, n + 1, s))
																};
																r = 0;
																for d = n, d[c] do
																	r = r + 1;
																	f[d] = a[r];
																end
																t = t + 1;
																d = k[t];
																t = d[h];
																break;
															end;
															if (f[d[e]] == d[c]) then
																t = t + 1;
															else
																t = d[h];
															end;
															break;
														end;
													else
														local n, u, _, p, r, a;
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]] = {};
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														n = d[e];
														u = f[d[h]];
														f[n + 1] = u;
														f[n] = u[d[c]];
														t = t + 1;
														d = k[t];
														n = d[e]
														a, p = b(f[n](f[n + 1]))
														s = p + n - 1
														r = 0;
														for d = n, s do
															r = r + 1;
															f[d] = a[r];
														end;
														t = t + 1;
														d = k[t];
														n = d[e]
														a = {
															f[n](l(f, n + 1, s))
														};
														r = 0;
														for d = n, d[c] do
															r = r + 1;
															f[d] = a[r];
														end
														t = t + 1;
														d = k[t];
														t = d[h];
													end
												else
													local n, r;
													f[d[e]][d[h]] = f[d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													n = d[e];
													r = f[d[h]];
													f[n + 1] = r;
													f[n] = r[d[c]];
													t = t + 1;
													d = k[t];
													f[d[e]] = {};
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
												end
											end
										end
									end
								else
									if 268 >= n then
										if n >= 264 then
											if n >= 266 then
												if n < 267 then
													if (f[d[e]] <= f[d[c]]) then
														t = d[h];
													else
														t = t + 1;
													end;
												else
													if 265 ~= n then
														for r = 34, 61 do
															if 268 ~= n then
																if (f[d[e]] == f[d[c]]) then
																	t = t + 1;
																else
																	t = d[h];
																end;
																break;
															end;
															local r, u, o, a, b, s, p, n;
															r = d[e];
															u = f[d[h]];
															f[r + 1] = u;
															f[r] = u[d[c]];
															t = t + 1;
															d = k[t];
															n = 0;
															while n > -1 do
																if 3 > n then
																	if 1 <= n then
																		if 0 ~= n then
																			for d = 39, 83 do
																				if 2 ~= n then
																					a = e;
																					break;
																				end;
																				b = h;
																				break;
																			end;
																		else
																			a = e;
																		end
																	else
																		o = d;
																	end
																else
																	if 5 > n then
																		if 2 <= n then
																			repeat
																				if 4 > n then
																					s = o[b];
																					break;
																				end;
																				p = o[a];
																			until true;
																		else
																			s = o[b];
																		end
																	else
																		if 3 ~= n then
																			for d = 42, 78 do
																				if 5 < n then
																					n = -2;
																					break;
																				end;
																				f(p, s);
																				break;
																			end;
																		else
																			n = -2;
																		end
																	end
																end
																n = n + 1
															end
															t = t + 1;
															d = k[t];
															r = d[e]
															f[r] = f[r](l(f, r + 1, d[h]))
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]][d[c]];
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]][d[c]];
															t = t + 1;
															d = k[t];
															if not f[d[e]] then
																t = t + 1;
															else
																t = d[h];
															end;
															break;
														end;
													else
														local r, u, o, a, s, b, p, n;
														r = d[e];
														u = f[d[h]];
														f[r + 1] = u;
														f[r] = u[d[c]];
														t = t + 1;
														d = k[t];
														n = 0;
														while n > -1 do
															if 3 > n then
																if 1 <= n then
																	if 0 ~= n then
																		for d = 39, 83 do
																			if 2 ~= n then
																				a = e;
																				break;
																			end;
																			s = h;
																			break;
																		end;
																	else
																		a = e;
																	end
																else
																	o = d;
																end
															else
																if 5 > n then
																	if 2 <= n then
																		repeat
																			if 4 > n then
																				b = o[s];
																				break;
																			end;
																			p = o[a];
																		until true;
																	else
																		b = o[s];
																	end
																else
																	if 3 ~= n then
																		for d = 42, 78 do
																			if 5 < n then
																				n = -2;
																				break;
																			end;
																			f(p, b);
																			break;
																		end;
																	else
																		n = -2;
																	end
																end
															end
															n = n + 1
														end
														t = t + 1;
														d = k[t];
														r = d[e]
														f[r] = f[r](l(f, r + 1, d[h]))
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]] = f[d[h]][d[c]];
														t = t + 1;
														d = k[t];
														if not f[d[e]] then
															t = t + 1;
														else
															t = d[h];
														end;
													end
												end
											else
												if n ~= 260 then
													for l = 46, 85 do
														if 265 ~= n then
															r[d[h]] = f[d[e]];
															t = t + 1;
															d = k[t];
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]] * f[d[c]];
															t = t + 1;
															d = k[t];
															r[d[h]] = f[d[e]];
															t = t + 1;
															d = k[t];
															do
																return
															end;
															break;
														end;
														local c;
														c = d[e]
														f[c](f[c + 1])
														t = t + 1;
														d = k[t];
														f[d[e]] = o[d[h]];
														t = t + 1;
														d = k[t];
														f(d[e], d[h]);
														t = t + 1;
														d = k[t];
														c = d[e]
														f[c](f[c + 1])
														t = t + 1;
														d = k[t];
														f[d[e]] = r[d[h]];
														t = t + 1;
														d = k[t];
														f[d[e]]();
														break;
													end;
												else
													local c;
													c = d[e]
													f[c](f[c + 1])
													t = t + 1;
													d = k[t];
													f[d[e]] = o[d[h]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													c = d[e]
													f[c](f[c + 1])
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													f[d[e]]();
												end
											end
										else
											if 261 >= n then
												if n ~= 257 then
													repeat
														if n ~= 261 then
															local s = z[d[h]];
															local l;
															local n = {};
															l = a.xxoAzVrP({}, {
																__index = function(t, d)
																	local d = n[d];
																	return d[1][d[2]];
																end,
																__newindex = function(f, d, t)
																	local d = n[d]
																	d[1][d[2]] = t;
																end;
															});
															for e = 1, d[c] do
																t = t + 1;
																local d = k[t];
																if d[j] == 51 then
																	n[e - 1] = {
																		f,
																		d[h]
																	};
																else
																	n[e - 1] = {
																		r,
																		d[h]
																	};
																end;
																u[#u + 1] = n;
															end;
															f[d[e]] = _(s, l, o);
															break;
														end;
														local n, r;
														f[d[e]][d[h]] = f[d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = d[c];
														t = t + 1;
														d = k[t];
														n = d[e]
														f[n] = f[n](l(f, n + 1, d[h]))
														t = t + 1;
														d = k[t];
														n = d[e];
														r = f[d[h]];
														f[n + 1] = r;
														f[n] = r[d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]] = {};
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = d[c];
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = d[c];
													until true;
												else
													local s = z[d[h]];
													local l;
													local n = {};
													l = a.xxoAzVrP({}, {
														__index = function(t, d)
															local d = n[d];
															return d[1][d[2]];
														end,
														__newindex = function(f, d, t)
															local d = n[d]
															d[1][d[2]] = t;
														end;
													});
													for e = 1, d[c] do
														t = t + 1;
														local d = k[t];
														if d[j] == 51 then
															n[e - 1] = {
																f,
																d[h]
															};
														else
															n[e - 1] = {
																r,
																d[h]
															};
														end;
														u[#u + 1] = n;
													end;
													f[d[e]] = _(s, l, o);
												end
											else
												if 263 > n then
													local e = d[e];
													local c = f[e + 2];
													local k = f[e] + c;
													f[e] = k;
													if (c > 0) then
														if (k <= f[e + 1]) then
															t = d[h];
															f[e + 3] = k;
														end
													elseif (k >= f[e + 1]) then
														t = d[h];
														f[e + 3] = k;
													end
												else
													local d = d[e]
													f[d] = f[d]()
												end
											end
										end
									else
										if 274 <= n then
											if n <= 275 then
												if 270 <= n then
													for r = 43, 87 do
														if 274 < n then
															local n, r, l, o;
															n = d[e];
															r = f[d[h]];
															f[n + 1] = r;
															f[n] = r[d[c]];
															t = t + 1;
															d = k[t];
															n = d[e]
															f[n] = f[n](f[n + 1])
															t = t + 1;
															d = k[t];
															f[d[e]] = {};
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															f[d[e]] = #f[d[h]];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															n = d[e];
															l = f[n]
															o = f[n + 2];
															if (o > 0) then
																if (l > f[n + 1]) then
																	t = d[h];
																else
																	f[n + 3] = l;
																end
															elseif (l < f[n + 1]) then
																t = d[h];
															else
																f[n + 3] = l;
															end
															break;
														end;
														local n, r;
														for o = 0, 4 do
															if o < 2 then
																if -1 ~= o then
																	for l = 13, 79 do
																		if 1 ~= o then
																			n = d[e];
																			r = f[d[h]];
																			f[n + 1] = r;
																			f[n] = r[d[c]];
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																		break;
																	end;
																else
																	n = d[e];
																	r = f[d[h]];
																	f[n + 1] = r;
																	f[n] = r[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if 2 >= o then
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																else
																	if o == 4 then
																		n = d[e];
																		r = f[d[h]];
																		f[n + 1] = r;
																		f[n] = r[d[c]];
																	else
																		f[d[e]] = f[d[h]][d[c]];
																		t = t + 1;
																		d = k[t];
																	end
																end
															end
														end
														break;
													end;
												else
													local n, r, l, o;
													n = d[e];
													r = f[d[h]];
													f[n + 1] = r;
													f[n] = r[d[c]];
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](f[n + 1])
													t = t + 1;
													d = k[t];
													f[d[e]] = {};
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													f[d[e]] = #f[d[h]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e];
													l = f[n]
													o = f[n + 2];
													if (o > 0) then
														if (l > f[n + 1]) then
															t = d[h];
														else
															f[n + 3] = l;
														end
													elseif (l < f[n + 1]) then
														t = d[h];
													else
														f[n + 3] = l;
													end
												end
											else
												if n >= 277 then
													if n >= 275 then
														for l = 49, 88 do
															if 278 > n then
																local o, l;
																for n = 0, 4 do
																	if 1 >= n then
																		if n ~= 1 then
																			f[d[e]] = r[d[h]];
																			t = t + 1;
																			d = k[t];
																		else
																			o = d[e];
																			l = f[d[h]];
																			f[o + 1] = l;
																			f[o] = l[d[c]];
																			t = t + 1;
																			d = k[t];
																		end
																	else
																		if n >= 3 then
																			if n > 0 then
																				for l = 39, 78 do
																					if 4 > n then
																						f[d[e]][d[h]] = d[c];
																						t = t + 1;
																						d = k[t];
																						break;
																					end;
																					if not f[d[e]] then
																						t = t + 1;
																					else
																						t = d[h];
																					end;
																					break;
																				end;
																			else
																				f[d[e]][d[h]] = d[c];
																				t = t + 1;
																				d = k[t];
																			end
																		else
																			f[d[e]] = {};
																			t = t + 1;
																			d = k[t];
																		end
																	end
																end
																break;
															end;
															local n;
															f[d[e]] = f[d[h]][d[c]];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															n = d[e]
															f[n] = f[n](f[n + 1])
															t = t + 1;
															d = k[t];
															f[d[e]] = f[d[h]];
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = d[c];
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = f[d[c]];
															break;
														end;
													else
														local l, o;
														for n = 0, 4 do
															if 1 >= n then
																if n ~= 1 then
																	f[d[e]] = r[d[h]];
																	t = t + 1;
																	d = k[t];
																else
																	l = d[e];
																	o = f[d[h]];
																	f[l + 1] = o;
																	f[l] = o[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															else
																if n >= 3 then
																	if n > 0 then
																		for l = 39, 78 do
																			if 4 > n then
																				f[d[e]][d[h]] = d[c];
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			if not f[d[e]] then
																				t = t + 1;
																			else
																				t = d[h];
																			end;
																			break;
																		end;
																	else
																		f[d[e]][d[h]] = d[c];
																		t = t + 1;
																		d = k[t];
																	end
																else
																	f[d[e]] = {};
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													end
												else
													local d = d[e];
													s = d + m - 1;
													for t = d, s do
														local d = g[t - d];
														f[t] = d;
													end;
												end
											end
										else
											if n < 271 then
												if 265 < n then
													repeat
														if 270 ~= n then
															local n, o;
															n = d[e];
															o = f[d[h]];
															f[n + 1] = o;
															f[n] = o[d[c]];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															n = d[e]
															f[n] = f[n](l(f, n + 1, d[h]))
															t = t + 1;
															d = k[t];
															n = d[e];
															o = f[d[h]];
															f[n + 1] = o;
															f[n] = o[d[c]];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															f[d[e]] = {};
															t = t + 1;
															d = k[t];
															f[d[e]][d[h]] = d[c];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															t = t + 1;
															d = k[t];
															f[d[e]] = r[d[h]];
															t = t + 1;
															d = k[t];
															f(d[e], d[h]);
															break;
														end;
														local n, o;
														for r = 0, 4 do
															if 1 >= r then
																if -3 < r then
																	repeat
																		if r ~= 0 then
																			n = d[e]
																			f[n] = f[n](l(f, n + 1, d[h]))
																			t = t + 1;
																			d = k[t];
																			break;
																		end;
																		f(d[e], d[h]);
																		t = t + 1;
																		d = k[t];
																	until true;
																else
																	n = d[e]
																	f[n] = f[n](l(f, n + 1, d[h]))
																	t = t + 1;
																	d = k[t];
																end
															else
																if r > 2 then
																	if -1 ~= r then
																		repeat
																			if r ~= 4 then
																				f(d[e], d[h]);
																				t = t + 1;
																				d = k[t];
																				break;
																			end;
																			n = d[e]
																			f[n] = f[n](l(f, n + 1, d[h]))
																		until true;
																	else
																		n = d[e]
																		f[n] = f[n](l(f, n + 1, d[h]))
																	end
																else
																	n = d[e];
																	o = f[d[h]];
																	f[n + 1] = o;
																	f[n] = o[d[c]];
																	t = t + 1;
																	d = k[t];
																end
															end
														end
													until true;
												else
													local n, o;
													n = d[e];
													o = f[d[h]];
													f[n + 1] = o;
													f[n] = o[d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													n = d[e]
													f[n] = f[n](l(f, n + 1, d[h]))
													t = t + 1;
													d = k[t];
													n = d[e];
													o = f[d[h]];
													f[n + 1] = o;
													f[n] = o[d[c]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													f[d[e]] = {};
													t = t + 1;
													d = k[t];
													f[d[e]][d[h]] = d[c];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
													t = t + 1;
													d = k[t];
													f[d[e]] = r[d[h]];
													t = t + 1;
													d = k[t];
													f(d[e], d[h]);
												end
											else
												if 271 < n then
													if 270 < n then
														for r = 39, 96 do
															if 272 ~= n then
																local a, p, o, b, u, n, r, s;
																f[d[e]][d[h]] = f[d[c]];
																t = t + 1;
																d = k[t];
																n = 0;
																while n > -1 do
																	if 3 <= n then
																		if n > 4 then
																			if 5 < n then
																				n = -2;
																			else
																				f(u, b);
																			end
																		else
																			if 4 == n then
																				u = a[p];
																			else
																				b = a[o];
																			end
																		end
																	else
																		if 1 > n then
																			a = d;
																		else
																			if n >= -1 then
																				for d = 45, 92 do
																					if n ~= 1 then
																						o = h;
																						break;
																					end;
																					p = e;
																					break;
																				end;
																			else
																				o = h;
																			end
																		end
																	end
																	n = n + 1
																end
																t = t + 1;
																d = k[t];
																r = d[e]
																f[r](l(f, r + 1, d[h]))
																t = t + 1;
																d = k[t];
																r = d[e];
																s = f[d[h]];
																f[r + 1] = s;
																f[r] = s[d[c]];
																t = t + 1;
																d = k[t];
																f[d[e]] = {};
																t = t + 1;
																d = k[t];
																f[d[e]][d[h]] = d[c];
																t = t + 1;
																d = k[t];
																f[d[e]][d[h]] = d[c];
																break;
															end;
															f[d[e]] = f[d[h]] + f[d[c]];
															break;
														end;
													else
														local s, u, o, p, b, n, r, a;
														f[d[e]][d[h]] = f[d[c]];
														t = t + 1;
														d = k[t];
														n = 0;
														while n > -1 do
															if 3 <= n then
																if n > 4 then
																	if 5 < n then
																		n = -2;
																	else
																		f(b, p);
																	end
																else
																	if 4 == n then
																		b = s[u];
																	else
																		p = s[o];
																	end
																end
															else
																if 1 > n then
																	s = d;
																else
																	if n >= -1 then
																		for d = 45, 92 do
																			if n ~= 1 then
																				o = h;
																				break;
																			end;
																			u = e;
																			break;
																		end;
																	else
																		o = h;
																	end
																end
															end
															n = n + 1
														end
														t = t + 1;
														d = k[t];
														r = d[e]
														f[r](l(f, r + 1, d[h]))
														t = t + 1;
														d = k[t];
														r = d[e];
														a = f[d[h]];
														f[r + 1] = a;
														f[r] = a[d[c]];
														t = t + 1;
														d = k[t];
														f[d[e]] = {};
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = d[c];
														t = t + 1;
														d = k[t];
														f[d[e]][d[h]] = d[c];
													end
												else
													local d = d[e];
													local t = f[d];
													for d = d + 1, s do
														a.zVSAliLu(t, f[d])
													end;
												end
											end
										end
									end
								end
							end
						end
					end
					t = 1 + t;
				end;
			end;
			return fd
		end;
		local h = 255;
		local c = {};
		local n = (1);
		local e = '';
		(function(t)
			local f = t
			local k = 0
			local d = 0
			f = {
				(function(e)
					if k > 32 then
						return e
					end
					k = k + 1
					d = (d + 4504 - e) % 62
					return (d % 3 == 2 and (function(f)
						if not t[f] then
							d = d + 1
							t[f] = (244);
						end
						return true
					end)'mFkDQ' and f[3](683 + e)) or (d % 3 == 1 and (function(f)
						if not t[f] then
							d = d + 1
							t[f] = (49);
							c[n] = hd();
							n = n + h;
						end
						return true
					end)'kyJio' and f[1](e + 382)) or (d % 3 == 0 and (function(f)
						if not t[f] then
							d = d + 1
							t[f] = (13);
						end
						return true
					end)'DkvAU' and f[2](e + 354)) or e
				end),
				(function(r)
					if k > 46 then
						return r
					end
					k = k + 1
					d = (d + 4112 - r) % 33
					return (d % 3 == 2 and (function(f)
						if not t[f] then
							d = d + 1
							t[f] = (111);
							e = {
								e .. '\58 a',
								e
							};
							c[n] = td();
							n = n + ((not a.Y_qIdagm) and 1 or 0);
							e[1] = '\58' .. e[1];
							h[2] = 255;
						end
						return true
					end)'OSDml' and f[2](157 + r)) or (d % 3 == 0 and (function(f)
						if not t[f] then
							d = d + 1
							t[f] = (208);
						end
						return true
					end)'rKLrj' and f[3](r + 695)) or (d % 3 == 1 and (function(f)
						if not t[f] then
							d = d + 1
							t[f] = (3);
							h[2] = (h[2] * (fd(function()
								c()
							end, l(e)) - fd(h[1], l(e)))) + 1;
							c[n] = {};
							h = h[2];
							n = n + h;
						end
						return true
					end)'xVJvR' and f[1](r + 290)) or r
				end),
				(function(c)
					if k > 36 then
						return c
					end
					k = k + 1
					d = (d + 1219 - c) % 15
					return (d % 3 == 0 and (function(f)
						if not t[f] then
							d = d + 1
							t[f] = (178);
						end
						return true
					end)'kldPS' and f[3](638 + c)) or (d % 3 == 2 and (function(f)
						if not t[f] then
							d = d + 1
							t[f] = (51);
							e = '\37';
							h = {
								function()
									h()
								end
							};
							e = e .. '\100\43';
						end
						return true
					end)'JdPYa' and f[2](c + 652)) or (d % 3 == 1 and (function(f)
						if not t[f] then
							d = d + 1
							t[f] = (104);
						end
						return true
					end)'llelT' and f[1](c + 148)) or c
				end)
			}
			f[3](2198)
		end){};
		local d = _(l(c));
		c[2] = {};
		c[1] = d(c[1])
		bFCnUiTAkIvCWQP = nil;
		d = _(l(c))
		return d(...);
	end
	return td((function()
		local t = {}
		local d = 1;
		local f;
		if a.Y_qIdagm then
			f = a.Y_qIdagm(td)
		else
			f = ''
		end
		if a.ItuXzebJ(f, a.zLIYhRiZ) then
			d = d + 0;
		else
			d = d + 1;
		end
		t[d] = 2;
		t[t[d] + 1] = 3;
		return t;
	end)(), ...)
end)((function(t, d, f, e, h, k)
	local k;
	if 4 > t then
		if 2 <= t then
			if t ~= 1 then
				repeat
					if t < 3 then
						do
							return 16777216, 65536, 256
						end;
						break;
					end;
					do
						return d(1), d(4, h, e, f, d), d(5, h, e, f)
					end;
				until true;
			else
				do
					return d(1), d(4, h, e, f, d), d(5, h, e, f)
				end;
			end
		else
			if 0 == t then
				do
					return d(1), d(4, h, e, f, d), d(5, h, e, f)
				end;
			else
				do
					return function(f, d, t)
						if t then
							local d = (f / 2 ^ (d - 1)) % 2 ^ ((t - 1) - (d - 1) + 1);
							return d - d % 1;
						else
							local d = 2 ^ (d - 1);
							return (f % (d + d) >= d) and 1 or 0;
						end;
					end;
				end;
			end
		end
	else
		if t <= 5 then
			if t >= 0 then
				for k = 23, 59 do
					if t > 4 then
						local t = e;
						do
							return function()
								local d = d(f, t(t, t), t(t, t));
								t(1);
								return d;
							end;
						end;
						break;
					end;
					local t = e;
					local k, c, h = h(2);
					do
						return function()
							local d, f, e, n = d(f, t(t, t), t(t, t) + 3);
							t(4);
							return (n * k) + (e * c) + (f * h) + d;
						end;
					end;
					break;
				end;
			else
				local t = e;
				do
					return function()
						local d = d(f, t(t, t), t(t, t));
						t(1);
						return d;
					end;
				end;
			end
		else
			if 6 < t then
				if 5 ~= t then
					repeat
						if t ~= 8 then
							do
								return setmetatable({}, {
									['__\99\97\108\108'] = function(d, h, e, f, t)
										if t then
											return d[t]
										elseif f then
											return d
										else
											d[h] = e
										end
									end
								})
							end
							break;
						end;
						do
							return f(t, nil, f);
						end
					until true;
				else
					do
						return setmetatable({}, {
							['__\99\97\108\108'] = function(d, e, h, f, t)
								if t then
									return d[t]
								elseif f then
									return d
								else
									d[e] = h
								end
							end
						})
					end
				end
			else
				do
					return h[f]
				end;
			end
		end
	end
end), ...)