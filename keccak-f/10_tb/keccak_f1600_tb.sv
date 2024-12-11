module keccak_f1600_tb;

  logic [0:1599]  round_in, round_out;
  logic [0:5]     round_ir;
  logic [0:1599]  after_rnd [0:23];
 
  round round (
    .ir_i     (round_ir),
    .state_i  (round_in),
    .state_o  (round_out)
  );

  initial begin
    after_rnd[ 0] = 1600'h0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    after_rnd[ 1] = 1600'h0000000000008083000010000000000000000000000080000000000000000001000010000000800000000000000000000000200000200000000000000000000000002000000000000000000000200000000000000000000200000000000002000000000000000000000000000000020200000000000000000000000010000400000000000000000000000000000004000000000010000000000000000000000000000100000000000000000000000000000001000000000400000000000000000000000000000004;
    after_rnd[ 2] = 1600'h8030500001E0840C38CA98308230010608B0340041C141012002783081A0048310488C0040D1410000049840D304222011932210B070020240038E20070020F031953040D060001060030C30241400C20000A50434031950003E0038090A8080C400828E0C1000430022263021081812C41C018A1810808101840C580E3825903E08505001060000040C0061063A658439801C48090300100A0840210007418480859C8008192199C700080080E020E2008584804017321C4100180008E801A106000C00C0063266;
    after_rnd[ 3] = 1600'h0838573A4DEB6243CF57A0C778692494558A7A103DE1A9F77EBF8BCAA7384087C20E7C2F247F1FC38B4B752FE1FF3DD4CAF94E2EA308A3DE84157265ED62C98095EB44CDB62A1F9310401CDB131F356A43149AE4F34CAE4EC7FF1E37F2A46DF19082BCD5A1256E1457C528940923D229D68102405F743186DD83725682CE30ADA99560E9A64817A1BAB5EBD7D1623C179C1ED728FDC103ADE8A581BE707CB95281BC65422742B3559C66D82B94503AA24F75A9DE463907D4E90EB8A4080A858F6542BC007F6BD7A3;
    after_rnd[ 4] = 1600'h6A00840802752A6FF9A9C3AB00C9C9316DB98725571F160496BA275BA7474A939B5E7A3FEEB7E41E73FE33C9B1038C3670E8B5D7632747280FE03A842F22AFCBD95C0A4EC94AD619E57A1A2BB2AE09C22728E4F2B7AEEBE8A81EDBEB54D20FE17AC22599684B0182C17E6A6AB6526EB1A1C3CEE067AB9F52B8E36F84D019B15F1CF47F1F04738AD9F377844620F2D499105A64A116516B0E965393CA1B42F1DB1C2C849D3FD29C1FAB89B3623F5F6964916D0713D86ACC2AE5DC85FFAD78D9B0650759748DF5EFE9;
    after_rnd[ 5] = 1600'h43E30B96FF110A58D642C7DF22B4173CBFD660DFE2E0051DA303B734F55677E637C05E405B01AF0C0B5033314F45C5CB44F0FBF5606F647A34FE5A6214181ED1B42ABC5DE738DDD57A8E099FE258E5D82D6CBEB27C4BC219A58159B967A3AD93A4036D7EAF4571575F252E8E367F3DC85E8F6AD5D330526E4FCB128386812F6E02C154103BD90DD0375463E874AF271C1CEE752EDB4B48F636E67B423707DCB0F36BA8B04378F57ACFCD9CECD3ADE3D57FC73C7B61494B4CB913D9D348A8E89A1EDCA3008E4023A2;
    after_rnd[ 6] = 1600'h0C77F40134A70CBC6F650CBFFC57AB016964C6213CD3202DF5841DB03D841837A7158BB1A792237642B502EFF3FCE7DFA42F64E793328D4F5640794D9B8E02012ACF091A0C121018E7C314743C763A96179B677365470E3128BB4A3EA45041A48BACDAC06316344C6989C2111A45122814BC213555DCB238AF39326EB3D059F6213D3C0C7D694B603874EBC3CF5C4AEFD809CA879D35DA1C41AD501B5EAA2C212727F7E1D04B56094F40BFBF5114B70E87ED62A9C0E907DBEFD2F940CF583917675AC1B705F06E75;
    after_rnd[ 7] = 1600'hE71990F66E5C31999815A7FEFC9708127ADEB6308D077A891BCF81EC65528647FB3F99D0C00B9D779DEBE90720187A5E90D8CCBB6E0C250571FA1D117D2F0D2B7E2D04CC17121756C31E4540D69F88C9D0316755555CEEC95DCD9AA3FCDAD53499B4D176E93E4C6C2A1C42A54F48B263439EB6C088B33BB83DE51A31004410020092FD96A29FB9CA641E17838270A7AFC09F6D8491B94FE3DB137CC98C3C8239AD3BEEC10F39B07F6B62B259D8FF954C965F3F9B90B4BA795E28C4CE78BD219022D0D89CAD79A8AE;
    after_rnd[ 8] = 1600'h309632A97CED9CE896CCE37672278288B8B4102D555463A0781CB76C1B390AF65EFE9079FBD063748C004295C6F66CEA7063B2FD56E7E2E55C202896127A3201DE117F77F405D44B93350E8D9591BC9E4735C6634EA08AA2479DABB00FD1751DD06CFD3AB48C6998E4C33C7972E95E5C525049F077812BC031A6E97CCAE2238D43976056B7E1952D4A71A7F66478DD992ADEF1F0F476BC2FE9231008AF083F0CF19D1873BE49DCA9F7CC92E1C5618E183ABA6FB87AAD63AA73F3B6A47154402F4577F0CB2CCB722A;
    after_rnd[ 9] = 1600'h31CBB7F055D0EFC0E4B25C70DDC208D19DA2F29054CE16EE7E8DB0B9132D1F74B563450ECB53CAE80C639E6D4DBB1C5233386E70B4EDFAE2D14705C13C413B268FB3A1C9623230F1928AC03BB01EB0A41A235D324D3E8A1023B9113DC331409E79C57354BD39DEBCF068BDE5CF48F1B55B22DD2D64FEC38F759959B043B15E3E9D7E94CA55DB4480968DA580DB523741A68326239C1E7D24B534D89DF4EE243465869F220F62E42E28FEDC4EAD93FED0BB6D3C3549DA2B9761089150769DA6CF18B378B6EEEC04B1;
    after_rnd[10] = 1600'h736D2C1D55C4EF732E734B02CE704378BFAF17A701E92E365C9B10C4952FD875CDC8E10F6BA13C50F5F58FA9FC4545D6F17D3C1327115FEFE4AF9F9F755C10795A19D348EBBBB880A4E4FC5A17F63732E14DA812846248AFD3376CB3ECEC921B660E9235B4DC7602C4E603913394EB11D31CFCDCD9C4CDB2A164D352B18499C482F35EE1F69F9F8E3660C07BAD4B60AF69DE925622C194C6AAD25DD9C221C27104CAE3E00B8C4D68A717F1200B3B94B231A0E879E25350995DEFAFFE64A1E6A450B9404AEDB0BA8E;
    after_rnd[11] = 1600'h4089B1D2EF5D3A268409F6C9BE239ECB12657D5A4568EAD54D9F3E32387E66D33BE7F6680BB1C84761ED7FB0CE6CA6AF3671348A3FBD648781E9F633F01DCF03AB5EEFA38E5546D98298D4E4300624943229E84A8E1704C256F221867A1B3140DB7043CF08757BB252DE6DE69935B88898A1C2D38194EDA19AF85D4549FB53C7667E09DE6B59E740C08877B3D1A7A9F35DA108D19209739FE0E096FFE4FF71EA77BADAFBFD43D60250A13329B93C785FF8AE145ADFFBE076366D5164BB8F0BB5438298AA08F16A54;
    after_rnd[12] = 1600'h648DE89C6833C102656C92D6905C342329F78BA152939175915F4042BE6580831EF11C5578706C331322254ABE46649E7AA01437721057C0A1FFA1E15FF0BD68FAF58B3ABF5862DFB22B9AF8DF7D5FE74E6245814643330B02C931B528B695B9694B851D604BFA01091010D55FA046CA1ACEC2CDA2B1C6C6329A908710CD5A85A89186E775F2FB74EE1B3818D5A838250212DA229E19843945428A665086AC41D7F5DBEA9ADC49AD752F2FEC3448E9B208360ADFB6DB369DEE429201D60401383C6534877469885F;
    after_rnd[13] = 1600'hF204AB825EC1B98C032132932ED2960ED2E894A105CE76B075DA76BD87D37A738C6C05A408AFC4BAAE399B7B6C84633DA8EFB92313AC7E4483371DD98C8B09F17CF0F6DDAF592EE48AAD4677926B6A65F42645F1AEB8018941FF2CBC6C803FDD88669871E9407470E5BBDDF2601EA85B77129C370664D09638F5DE3ED1CBF84F99CEDBF1933437F0DE74AEB20A95DB03FA2D09F00F8B19BE04754B7B9FAEFF7BB3606DBE9DB6C47131B09E98DF7DB202BE340816F1A99ED01EA140C98AB9FAEF9D52CDC98B2A671A;
    after_rnd[14] = 1600'h06EE364E771B6BCFE658FEAA402F4BD5D9C51E50969AAB699473996FE1BB4CEBF51CB0626DA6F085D2EA3CAC414EB63BF55FD4DDBF081E7DF666C3286F380B1DC9E47EBE6F50EFB2D19DF82730EA16B503FB7294D1438D9B40B5BB60943D81FE65DEE655C35A419553E3C5F2892E6BDB908C33B016575E0BF135E2A8960F74E24C225DEA370A687D46230E694915F13E11C0069F4D34628050B4AD11E821C365A027D4E0E1CD84DA29FF28D8DA171496E5800698CB3AE5B5637658693C47003F8CBCFD35E82D3301;
    after_rnd[15] = 1600'h0294D0853009A2E96D4B92A0AFD4A76B86A9931DBBBE28205C3CE9B0EA86020E322C45CC79B07A6C2DFCA2B3CA5EDA718CA51C558E7B125F780C883422DEA4D03CEFE3BF645DC61FC54F3E2EF42A032E7E1BA84748E80BEEC777B862349466AE48EDAC5C5F026F978E5C9DB63E29F72ADC8E9AD663EB67F4C3D4C4C0A40022916CDAF1C7E7DDF7C070433FD50A2FCA56197659FF2EDCC466CF709311541F6F050189C40775351DCB39F99B067422B547747A4CE4EBD894712BD80F68CC4E6008C0C81D74EDB1B855;
    after_rnd[16] = 1600'h5D350F71494FC8F7E37BF573D8AAFE2D26C80C388310B9EDA284DF955F5574B83807BEB7E976FCA52F3B2AD03FBA7FB4B6EA17C2A22BCB5E8E03BDC59CF78585982733E2D63B636A7734677D193A25783525810E4EC2258FF1D6DFC015C6D99DE264ABBDDCF60D8E3CE653F16DC0283887BCB30FE85BD2809C4E438B1642898E10C59ECBC76705E46FB9736051442CC003C9B4BF3AF2DC5D84501B4167D1303F95407746B76FA5EEE9E1987C2EF60A705FF558F3797F4C782E9689056E4699B870702CD96A9E15BB;
    after_rnd[17] = 1600'hFBDF32A8511A215A077CC8C29C4070D1A1D7456DD43B2098628B689B07200E9567A8FA7CCAFB6FCC4BC8B925DB11FC4E795330566EFD965C12E5367BA3EC47776256066085A1C5099A956CBBB31FA97391282D2C07D3C3EA55C1963AD365F063471AB241A976B3358099B9E1F6F6E869321A2CFBB72874A4F35ACBBFB66C85CA56B6B30B89E0025584B0356A433BF9A8853D1F0E8D821215508C1B026DAFDC957345AE61EB7C80A287CCC9784DD9D4BF3A624359F6A8B2B56DA5463417CE143FC801EFF982630994;
    after_rnd[18] = 1600'h599D6EF52FD9AE41BF34C0D029D604E5088D5A13BFC74406FC80D28CC5CC542E3BE9B37A46DFA8238BF1357228F2736E66C66703BB4D90A6DF7213B7F0A141C9B409A8CA23C781EFA627237129EEE7A162E2CAFA15D2E5B2720FEDE69EF7331633DB8BAEAECB6F235211152025D6CFFA347937F914E655535CE481E8D139A7919330BDDE8CA5F7D910EE357FE56745858ED9BDD71948545ECD893F7ADABABC47A20E907479EB38FC63076CB5F51FCD4BC1932A104F10527A7C5FB2E3E371AEF99124FF3F29C7839C;
    after_rnd[19] = 1600'h1A1AD63EA6DE94CD76F7142D14DA9BFCA59D6CD06EB2AC2EE3B85E2E2FCCB614C36E991C1A383054689CBC39B01C0CB97A0765A0CD8D0B028B60D78ABFAE986135F1F6FE72E0A82F8F4EEFF944E0C2D4632B5576588A026D2B12597BAF864E64555EB1D169FA78086C5D7FD109030BD905EC69B93EE6CF971852407BDA60F6DCAB561F9C9BE28B10ABFE34CD40BB334A371AB1A61EFDCD8A58A7AC24EC3FFE99AA96C5DA7975161A21B79A41E0BC679BA8FC47E37729343D5DECAA3CDBD5C36E4B60687E620AE2B4;
    after_rnd[20] = 1600'hCB967722D7E719458E72C3B2DB12A66FEFF0AAC9862E6863CBCFE6FA8917F50FF0388AED4303557776C4EBD02ADAC11A88F1ABD844D153FD093CA1652DEF39A7AFBD5EAFAA2004123CB75A7D2F1410E15BBCB96CFEDE2E86EDB9F9068BF73FEFF29EE305774F5D41DF8594CB00C06448B22A75014D2FBB0896CF2F872C22D06150BCAC8B9823C48CCED2C9104A8BC9A61064930F71891B9D6A81CA651589B15EA256C27254A4EAA6F79BABACBA12D714A980D201AECC693BCB631A23ADCA9452DBDB6EE4E7362DC1;
    after_rnd[21] = 1600'h1DD2DA9769DA011F3E2C73CC1842B6EE11ACB1EB1AF15940DACF89EA70FDDB4276CD1ADA7BDDB3913329889348E3611E79822E30740F8A94274F2636A613DACD9B74448952711318841DE7CDC8F8BA3DF129D553258AC6C92ADE13FD70A45485843EA2B8AFE2F08BDEF7504FF47BD92EBFC5AE08ED82CF6B604B94BA87023FFA55660CE1001CC5F97E78EA0CAEAF0B0F084F23E7133A91975C0794EBAA3E4DFDB09F4BD1D370E12C50A2A1D79F1EF2B32BA8D5E7DB313E6ACC0258A30644E2230B96B2D8CB9B1E79;
    after_rnd[22] = 1600'h0E2E4980D944DA7703C4DFA24420069F4247F8944D4AE7FE602C35AFFE556148D8F2B86D8510572F04A77BFA126FC0933DDEAD3D8C1401B70EA0DDC0D9366302262012B5083C91ACE7FB7B40B7E90583FFB9FC9A0F77452E76004EA89B563E26D3D0C5789E1909A316E2AA8036B5013DE249AEB39C95D7DB58C5F58B0B1E40CEE1F0B375845FBD470D7175255383FC27F235E528401D5007C52E05CCF15F628F73CCA4AE07DA389DD6A59CD027A68607867EDB7567FC04C79D2FE354084DD32ACADBAB8C23A95C88;
    after_rnd[23] = 1600'hF1258F7940E1DDE784D5CCF933C0478AD598261EA65AA9EEBD1547306F80494D8B284E056253D057FF97A42D7F8E6FD490FEE5A0A44647C48C5BDA0CD6192E76AD30A6F71B19059C30935AB7D08FFC64EB5AA93F2317D635A9A6E6260D71210381A57C16DBCF555F43B831CD0347C82601F22F1A11A5569F05E5635A21D9AE6164BEFEF28CC970F2613670957BC46611B87C5A554FD00ECB8C3EE88A1CCF32C8940C7922AE3A26141841F924A2C509E416F53526E70465C275F644E97F30A13BEAF1FF7B5CECA249;
  end

  task check;
    input [0:1599] state;
    begin
      if (state !== round_out) begin
        $display("Error: round %d", round_ir);
      end else begin
        $display("round %d: OK", round_ir);
      end
    end
  endtask

  initial begin
    #10;
    for (int i = 0; i < 24; i++) begin
      round_ir = i;
      round_in = (i == 0) ? 1600'h0 : after_rnd[i-1];
      #10 check(after_rnd[i]);
    end
    $finish;
  end
endmodule
    
  
