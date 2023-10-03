//
//  CharacterAssets.swift
//  GenshinPizzaHepler
//
//  Created by ShikiSuen on 2023/10/3.
//

import Foundation
import SwiftUI

// MARK: - CharacterAsset

/// 原神名片清单，按照 Ambr.top 网页陈列顺序排列。
public enum CharacterAsset: Int, CaseIterable {
    case Hotaru = 10000089
    case Sora = 10000088
    case Sucrose = 10000086
    case Keqing = 10000087
    case Mona = 10000085
    case Chongyun = 10000083
    case Qiqi = 10000084
    case Noel = 10000061
    case Bennett = 10000081
    case Fischl = 10000082
    case Klee = 10000080
    case Ningguang = 10000079
    case Xingqiu = 10000077
    case Beidou = 10000078
    case Xiangling = 10000075
    case Venti = 10000076
    case Ambor = 10000074
    case Razor = 10000073
    case Diluc = 10000070
    case Kaeya = 10000071
    case Barbara = 10000072
    case Lisa = 10000068
    case Jean = 10000067
    case Diona = 10000069
    case Tartaglia = 10000059
    case Xinyan = 10000065
    case Zhongli = 10000060
    case Albedo = 10000066
    case Ganyu = 10000058
    case Xiao = 10000063
    case Hutao = 10000064
    case Rosaria = 10000055
    case Yanfei = 10000057
    case Eula = 10000050
    case Kazuha = 10000054
    case Ayaka = 10000052
    case Sayu = 10000056
    case Yoimiya = 10000062
    case Aloy = 10000049
    case Sara = 10000053
    case Ei = 10000002
    case Kokomi = 10000047
    case Thoma = 10000051
    case Itto = 10000048
    case Gorou = 10000045
    case Yunjin = 10000046
    case Shenhe = 10000026
    case Miko = 10000037
    case Ayato = 10000038
    case Yelan = 10000030
    case Shinobu = 10000044
    case Heizo = 10000033
    case Tighnari = 10000039
    case Collei = 10000003
    case Dori = 10000006
    case Candace = 10000014
    case Cyno = 10000015
    case Nilou = 10000016
    case Nahida = 10000020
    case Layla = 10000021
    case Faruzan = 10000022
    case Kunikuzushi = 10000023
    case Alhaitham = 10000024
    case Yaoyao = 10000025
    case Dehya = 10000027
    case Mika = 10000029
    case Baizhu = 10000031
    case Kaveh = 10000032
    case Kirara = 10000034
    case Lyney = 10000035
    case Lynette = 10000036
    case Freminet = 10000041
    case Neuvillette = 10000042
    case Wriothesley = 10000043
    case Charlotte = 10000005
    case Furina = 10000007
}

extension CharacterAsset {
    public var enkaId: Int { rawValue }

    public var localizedKey: String {
        var raw = String(describing: self)
        if AppConfig.useActualCharacterNames, raw.contains("Kunikuzushi") {
            raw = "Raiden" + raw
        }
        return "$asset.character:" + raw
    }

    public var localized: String {
        let raw = String(describing: self)
        if AppConfig.useActualCharacterNames, raw.contains("Kunikuzushi") {
            return localizedKey.localized
        }
        return localizedKey.localized.localizedWithFix
    }
}

extension CharacterAsset {
    public var photoFileName: String {
        switch self {
        case .Hotaru: return "UI_AvatarIcon_PlayerGirl"
        case .Sora: return "UI_AvatarIcon_PlayerBoy"
        case .Sucrose: return "UI_AvatarIcon_Sucrose"
        case .Keqing: return "UI_AvatarIcon_Keqing"
        case .Mona: return "UI_AvatarIcon_Mona"
        case .Chongyun: return "UI_AvatarIcon_Chongyun"
        case .Qiqi: return "UI_AvatarIcon_Qiqi"
        case .Noel: return "UI_AvatarIcon_Noel"
        case .Bennett: return "UI_AvatarIcon_Bennett"
        case .Fischl: return "UI_AvatarIcon_Fischl"
        case .Klee: return "UI_AvatarIcon_Klee"
        case .Ningguang: return "UI_AvatarIcon_Ningguang"
        case .Xingqiu: return "UI_AvatarIcon_Xingqiu"
        case .Beidou: return "UI_AvatarIcon_Beidou"
        case .Xiangling: return "UI_AvatarIcon_Xiangling"
        case .Venti: return "UI_AvatarIcon_Venti"
        case .Ambor: return "UI_AvatarIcon_Ambor"
        case .Razor: return "UI_AvatarIcon_Razor"
        case .Diluc: return "UI_AvatarIcon_Diluc"
        case .Kaeya: return "UI_AvatarIcon_Kaeya"
        case .Barbara: return "UI_AvatarIcon_Barbara"
        case .Lisa: return "UI_AvatarIcon_Lisa"
        case .Jean: return "UI_AvatarIcon_Qin"
        case .Diona: return "UI_AvatarIcon_Diona"
        case .Tartaglia: return "UI_AvatarIcon_Tartaglia"
        case .Xinyan: return "UI_AvatarIcon_Xinyan"
        case .Zhongli: return "UI_AvatarIcon_Zhongli"
        case .Albedo: return "UI_AvatarIcon_Albedo"
        case .Ganyu: return "UI_AvatarIcon_Ganyu"
        case .Xiao: return "UI_AvatarIcon_Xiao"
        case .Hutao: return "UI_AvatarIcon_Hutao"
        case .Rosaria: return "UI_AvatarIcon_Rosaria"
        case .Yanfei: return "UI_AvatarIcon_Feiyan"
        case .Eula: return "UI_AvatarIcon_Eula"
        case .Kazuha: return "UI_AvatarIcon_Kazuha"
        case .Ayaka: return "UI_AvatarIcon_Ayaka"
        case .Sayu: return "UI_AvatarIcon_Sayu"
        case .Yoimiya: return "UI_AvatarIcon_Yoimiya"
        case .Aloy: return "UI_AvatarIcon_Aloy"
        case .Sara: return "UI_AvatarIcon_Sara"
        case .Ei: return "UI_AvatarIcon_Shougun"
        case .Kokomi: return "UI_AvatarIcon_Kokomi"
        case .Thoma: return "UI_AvatarIcon_Tohma"
        case .Itto: return "UI_AvatarIcon_Itto"
        case .Gorou: return "UI_AvatarIcon_Gorou"
        case .Yunjin: return "UI_AvatarIcon_Yunjin"
        case .Shenhe: return "UI_AvatarIcon_Shenhe"
        case .Miko: return "UI_AvatarIcon_Yae"
        case .Ayato: return "UI_AvatarIcon_Ayato"
        case .Yelan: return "UI_AvatarIcon_Yelan"
        case .Shinobu: return "UI_AvatarIcon_Shinobu"
        case .Heizo: return "UI_AvatarIcon_Heizo"
        case .Tighnari: return "UI_AvatarIcon_Tighnari"
        case .Collei: return "UI_AvatarIcon_Collei"
        case .Dori: return "UI_AvatarIcon_Dori"
        case .Candace: return "UI_AvatarIcon_Candace"
        case .Cyno: return "UI_AvatarIcon_Cyno"
        case .Nilou: return "UI_AvatarIcon_Nilou"
        case .Nahida: return "UI_AvatarIcon_Nahida"
        case .Layla: return "UI_AvatarIcon_Layla"
        case .Faruzan: return "UI_AvatarIcon_Faruzan"
        case .Kunikuzushi: return "UI_AvatarIcon_Wanderer"
        case .Alhaitham: return "UI_AvatarIcon_Alhatham"
        case .Yaoyao: return "UI_AvatarIcon_Yaoyao"
        case .Dehya: return "UI_AvatarIcon_Dehya"
        case .Mika: return "UI_AvatarIcon_Mika"
        case .Baizhu: return "UI_AvatarIcon_Baizhuer"
        case .Kaveh: return "UI_AvatarIcon_Kaveh"
        case .Kirara: return "UI_AvatarIcon_Momoka"
        case .Lyney: return "UI_AvatarIcon_Liney"
        case .Lynette: return "UI_AvatarIcon_Linette"
        case .Freminet: return "UI_AvatarIcon_Freminet"
        case .Neuvillette: return "UI_AvatarIcon_Neuvillette"
        case .Wriothesley: return "UI_AvatarIcon_Wriothesley"
        case .Charlotte: return "UI_AvatarIcon_Charlotte"
        case .Furina: return "UI_AvatarIcon_Furina"
        }
    }

    public var namecard: NameCard {
        switch self {
        case .Hotaru: return .UI_NameCardPic_Bp2_P
        case .Sora: return .UI_NameCardPic_Bp2_P
        case .Sucrose: return .UI_NameCardPic_Sucrose_P
        case .Keqing: return .UI_NameCardPic_Keqing_P
        case .Mona: return .UI_NameCardPic_Mona_P
        case .Chongyun: return .UI_NameCardPic_Chongyun_P
        case .Qiqi: return .UI_NameCardPic_Qiqi_P
        case .Noel: return .UI_NameCardPic_Noel_P
        case .Bennett: return .UI_NameCardPic_Bennett_P
        case .Fischl: return .UI_NameCardPic_Fischl_P
        case .Klee: return .UI_NameCardPic_Klee_P
        case .Ningguang: return .UI_NameCardPic_Ningguang_P
        case .Xingqiu: return .UI_NameCardPic_Xingqiu_P
        case .Beidou: return .UI_NameCardPic_Beidou_P
        case .Xiangling: return .UI_NameCardPic_Xiangling_P
        case .Venti: return .UI_NameCardPic_Venti_P
        case .Ambor: return .UI_NameCardPic_Ambor_P
        case .Razor: return .UI_NameCardPic_Razor_P
        case .Diluc: return .UI_NameCardPic_Diluc_P
        case .Kaeya: return .UI_NameCardPic_Kaeya_P
        case .Barbara: return .UI_NameCardPic_Barbara_P
        case .Lisa: return .UI_NameCardPic_Lisa_P
        case .Jean: return .UI_NameCardPic_Qin_P
        case .Diona: return .UI_NameCardPic_Diona_P
        case .Tartaglia: return .UI_NameCardPic_Tartaglia_P
        case .Xinyan: return .UI_NameCardPic_Xinyan_P
        case .Zhongli: return .UI_NameCardPic_Zhongli_P
        case .Albedo: return .UI_NameCardPic_Albedo_P
        case .Ganyu: return .UI_NameCardPic_Ganyu_P
        case .Xiao: return .UI_NameCardPic_Xiao_P
        case .Hutao: return .UI_NameCardPic_Hutao_P
        case .Rosaria: return .UI_NameCardPic_Rosaria_P
        case .Yanfei: return .UI_NameCardPic_Feiyan_P
        case .Eula: return .UI_NameCardPic_Eula_P
        case .Kazuha: return .UI_NameCardPic_Kazuha_P
        case .Ayaka: return .UI_NameCardPic_Ayaka_P
        case .Sayu: return .UI_NameCardPic_Sayu_P
        case .Yoimiya: return .UI_NameCardPic_Yoimiya_P
        case .Aloy: return .UI_NameCardPic_Aloy_P
        case .Sara: return .UI_NameCardPic_Sara_P
        case .Ei: return .UI_NameCardPic_Shougun_P
        case .Kokomi: return .UI_NameCardPic_Kokomi_P
        case .Thoma: return .UI_NameCardPic_Tohma_P
        case .Itto: return .UI_NameCardPic_Itto_P
        case .Gorou: return .UI_NameCardPic_Gorou_P
        case .Yunjin: return .UI_NameCardPic_Yunjin_P
        case .Shenhe: return .UI_NameCardPic_Shenhe_P
        case .Miko: return .UI_NameCardPic_Yae1_P
        case .Ayato: return .UI_NameCardPic_Ayato_P
        case .Yelan: return .UI_NameCardPic_Yelan_P
        case .Shinobu: return .UI_NameCardPic_Shinobu_P
        case .Heizo: return .UI_NameCardPic_Heizo_P
        case .Tighnari: return .UI_NameCardPic_Tighnari_P
        case .Collei: return .UI_NameCardPic_Collei_P
        case .Dori: return .UI_NameCardPic_Dori_P
        case .Candace: return .UI_NameCardPic_Candace_P
        case .Cyno: return .UI_NameCardPic_Cyno_P
        case .Nilou: return .UI_NameCardPic_Nilou_P
        case .Nahida: return .UI_NameCardPic_Nahida_P
        case .Layla: return .UI_NameCardPic_Layla_P
        case .Faruzan: return .UI_NameCardPic_Faruzan_P
        case .Kunikuzushi: return .UI_NameCardPic_Wanderer_P
        case .Alhaitham: return .UI_NameCardPic_Alhatham_P
        case .Yaoyao: return .UI_NameCardPic_Yaoyao_P
        case .Dehya: return .UI_NameCardPic_Dehya_P
        case .Mika: return .UI_NameCardPic_Mika_P
        case .Baizhu: return .UI_NameCardPic_Baizhuer_P
        case .Kaveh: return .UI_NameCardPic_Kaveh_P
        case .Kirara: return .UI_NameCardPic_Kirara_P
        case .Lyney: return .UI_NameCardPic_Liney_P
        case .Lynette: return .UI_NameCardPic_Linette_P
        case .Freminet: return .UI_NameCardPic_Freminet_P
        case .Neuvillette: return .UI_NameCardPic_Neuvillette_P
        case .Wriothesley: return .UI_NameCardPic_Wriothesley_P
        case .Charlotte: return .UI_NameCardPic_Bp2_P // .UI_NameCardPic_Charlotte_P // 原神 4.2
        case .Furina: return .UI_NameCardPic_Bp2_P // .UI_NameCardPic_Furina_P // 原神 4.2
        }
    }

    /// 显示角色的扑克牌尺寸肖像，以身份证素材裁切而成。
    func cardIcon(_ size: CGFloat) -> some View {
        EnkaWebIcon(iconString: photoFileName)
            .scaledToFill()
            .frame(width: size * 0.74, height: size)
            .clipped()
            .scaledToFit()
            .background(
                EnkaWebIcon(
                    iconString: namecard.rawValue
                )
                .scaledToFill()
                .offset(x: size / -3)
            )
            .clipShape(RoundedRectangle(cornerRadius: size / 10))
            .contentShape(RoundedRectangle(cornerRadius: size / 10))
    }
}