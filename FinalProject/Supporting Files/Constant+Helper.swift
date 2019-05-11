//
//  Constant+Helper.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 4/9/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation

typealias Rational = (num : Int, den : Int)
typealias RationalPurpose = (firstNum : Int, firstDen: Int, secondNum: Int, secondDen: Int)

var isResetButtonPressed = false

enum Status {
    case radd, aul, normal
}

func rationalApproximationOf(x0 : Double, withPrecision eps : Double = 1.0E-6) -> Rational {
    if x0 == 0.0 {
        return (0, 0)
    }
    var x = x0
    var a = floor(x)
    var (h1, k1, h, k) = (1, 0, Int(a), 1)
    
    while x - a > eps * Double(k) * Double(k) {
        x = 1.0/(x - a)
        a = floor(x)
        (h1, k1, h, k) = (h, k, h1 + Int(a) * h, k1 + Int(a) * k)
    }
    return (h, k)
}

func setRational(num: Int, den: Int) -> Rational{
    return (num,den)
}

func addRational(first: Rational, second:Rational) -> Rational {
    if first == rationalApproximationOf(x0: 0) {
        return second
    }
    else if second == rationalApproximationOf(x0: 0) {
        return first
    } else if first == rationalApproximationOf(x0: 0) && second == rationalApproximationOf(x0: 0) {
        return rationalApproximationOf(x0: 0)
    }
    
    let a = first.num
    let b = first.den
    let c = second.num
    let d = second.den
    
    var bigDen = 0
    var smallDen = 0
    var fixDen = 0
    
    if b > d {
        bigDen = b
        smallDen = d
    } else if b < d {
        bigDen = d
        smallDen = b
    } else if b == d {
        fixDen = b
    }
    
    if fixDen == 0 {
        if bigDen % smallDen == 0 {
            fixDen = bigDen
        } else {
            var arrayOfTempDen = [Int]()
            
            for i in 1...smallDen {
                let tempDen = bigDen * i
                if tempDen % smallDen == 0 {
                    arrayOfTempDen.append(tempDen)
                }
            }
            fixDen = arrayOfTempDen.min()!
        }
    }
    
    let num1 = fixDen / b * a
    let num2 = fixDen / d * c
    
    let fixNum = num1 + num2
    
    return (fixNum, fixDen)
}

func multiplyRational(first: Rational, second:Rational) -> Rational {
    var a = first.num
    var b = first.den
    var c = second.num
    var d = second.den
    
    if a == d {
        a = 1
        d = 1
    }
    
    if b == c {
        b = 1
        c = 1
    }
    
    let num = a * c
    let den = b * d
    return (num, den)
}

let ilmuWarisTitle1 = ["Hukum Waris Islam",
                       "Rukun Waris",
                       "Syarat Mewarisi",
                       "Ahli Waris",
                       "Ashabul Furudh",
                       "Ashabah",
                       "Hujub",
                       "Pentashihan Pokok Masalah",
                       "Masalah Aul dan Radd"]
let ilmuWarisDesc1 = ["Pengenalan singkat mengenai hukum waris yang sesuai syariat Islam",
                      "Berisi tentang segala hal yang harus ada di dalam hukum waris Islam",
                      "Syarat yang harus terpenuhi sebelum melakukan pembagian harta warisan",
                      "Setiap orang yang berhak untuk menerima harta warisan dari pewaris",
                      "Setiap ahli waris yang memiliki kadar bagian tersendiri yang sudah ditentukan sesuai syariat",
                      "Ahli waris yang hanya boleh menerima warisan dengan cara mengambil harta sisa",
                      "Sebab-sebab mengapa ahli waris tidak mendapatkan bagian warisan meski punya hak sesuai syariat",
                      "Mengetahui pokok masalah adalah hal yang sangat penting dalam ilmu waris agar mampu melakukan pembagian secara adil hingga menentukan Aul dan Radd",
                      "Pentingnya Aul dan Radd untuk menentukan kadar bagian secara adil dalam kondisi tertentu"]

let ashabulFurudhTitle = ["Ayah", "Ibu", "Pasangan", "Anak Perempuan", "Cucu Perempuan", "Kakek", "Nenek", "Saudara Kandung Perempuan", "Saudara Seayah Perempuan", "Saudara Seibu"]
let ashabulFurudhDesc = ["Ayah kandung dari pewaris", "Ibu kandung dari pewaris", "Suami atau Istri yang sah dan masih sah dari pewaris", "Keturunan perempuan kandung dari pewaris", "Anak perempuan dari keturunan laki-laki pewaris", "Ayah kandung dari ayah kandung pewaris", "Ibu kandung dari Ayah dan Ibu pewaris", "Saudara kandung perempuan dari pewaris", "Saudara perempuan pewaris yang bersaudara satu Ayah", "Saudara perempuan pewaris yang bersaudara satu Ibu"]

let ahliWarisDalil = ["Ayah", "Ibu", "Anak Laki-laki", "Anak Perempuan", "Suami", "Istri" , "Cucu Laki-laki", "Cucu Perempuan", "Kakek", "Nenek" ,"Saudara Seibu", "Saudara Kandung Perempuan", "Saudara Kandung Laki-Laki", "Saudara Seayah Perempuan", "Saudara Seayah Laki-Laki" , "Anak Laki-Laki dari Saudara Kandung Laki-Laki" , "Anak Laki-Laki dari Saudara Seayah Laki-Laki" , "Paman Kandung" , "Paman Sekakek", "Anak Laki-Laki Paman Kandung" , "Anak Laki-Laki Paman Sekakek"]

let dalilCode = [
    "Allah mensyariatkan (mewajibkan) kepadamu tentang (pembagian warisan untuk) anak-anakmu, (yaitu) bagian seorang anak laki-laki sama dengan bagian dua orang anak perempuan. Dan jika anak itu semuanya perempuan yang jumlahnya dua (atau lebih), maka bagian mereka dua pertiga dari harta yang ditinggalkan. Jika dia (anak perempuan) itu seorang saja, maka dia memperoleh separuh harta (yang ditinggalkan). Dan untuk kedua ibu-bapak, bagian masing-masing seperenam dari harta yang ditinggalkan, jika dia (yang meninggal) mempunyai anak. Jika dia (yang meninggal) tidak mempunyai anak dan dia diwarisi oleh kedua ibu-bapaknya (saja), maka ibunya mendapat sepertiga. Jika dia (yang meninggal) mempunyai beberapa saudara, maka ibunya mendapat seperenam. (Pembagian-pembagian tersebut di atas) setelah (dipenuhi) wasiat yang dibuatnya atau (dan setelah dibayar) utangnya. (Tentang) orang tuamu dan anak-anakmu, kamu tidak mengetahui siapa di antara mereka yang lebih banyak manfaatnya bagimu. Ini adalah ketetapan Allah. Sungguh, Allah Maha Mengetahui, Mahabijaksana.",
    "Dan bagianmu (suami-suami) adalah seperdua dari harta yang ditinggalkan oleh istri-istrimu, jika mereka tidak mempunyai anak. Jika mereka (istri-istrimu) itu mempunyai anak, maka kamu mendapat seperempat dari harta yang ditinggalkannya setelah (dipenuhi) wasiat yang mereka buat atau (dan setelah dibayar) utangnya. Para istri memperoleh seperempat harta yang kamu tinggalkan jika kamu tidak mempunyai anak. Jika kamu mempunyai anak, maka para istri memperoleh seperdelapan dari harta yang kamu tinggalkan (setelah dipenuhi) wasiat yang kamu buat atau (dan setelah dibayar) utang-utangmu. Jika seseorang meninggal, baik laki-laki maupun perempuan yang tidak meninggalkan ayah dan tidak meninggalkan anak, tetapi mempunyai seorang saudara laki-laki (seibu) atau seorang saudara perempuan (seibu), maka bagi masing-masing dari kedua jenis saudara itu seperenam harta. Tetapi jika saudara-saudara seibu itu lebih dari seorang, maka mereka bersama-sama dalam bagian yang sepertiga itu, setelah (dipenuhi wasiat) yang dibuatnya atau (dan setelah dibayar) utangnya dengan tidak menyusahkan (kepada ahli waris). Demikianlah ketentuan Allah. Allah Maha Mengetahui, Maha Penyantun.",
    "Mereka meminta fatwa kepadamu (tentang kalalah). Katakanlah: Allah memberi fatwa kepadamu tentang kalalah (yaitu), jika seseorang mati dan dia tidak mempunyai anak tetapi mempunyai saudara perempuan, maka bagiannya (saudara perempuannya itu) seperdua dari harta yang ditinggalkannya, dan saudaranya yang laki-laki mewarisi (seluruh harta saudara perempuan), jika dia tidak mempunyai anak. Tetapi jika saudara perempuan itu dua orang, maka bagi keduanya dua pertiga dari harta yang ditinggalkan. Dan jika mereka (ahli waris itu terdiri dari) saudara-saudara laki-laki dan perempuan, maka bagian seorang saudara laki-laki sama dengan bagian dua saudara perempuan. Allah menerangkan (hukum ini) kepadamu, agar kamu tidak sesat. Allah Maha Mengetahui segala sesuatu.",
    "Telah menceritakan kepada kami Abdurrahman bin Abdul Wahhab; telah menceritakan kepada kami Salam bin Qutaibah dari Syarik dari Laits dari Thawus dari Ibnu 'Abbas; Sesungguhnya Rasulullah shallallahu 'alaihi wasallam memberi bagian warisan kepada nenek seperenam." ,
    "Telah menceritakan kepada kami Amru bin 'Abbas telah menceritakan kepada kami Abdurrahman telah menceritakan kepada kami Sufyan dari Abu Qais dari Huzail mengatakan, Abdullah mengatakan; 'Sungguh aku putuskan perkara ini dengan keputusan Nabi shallallahu 'alaihi wasallam, ' atau ia mengatakan; Nabi shallallahu 'alaihi wasallam bersabda: 'bagi anak perempuan separo (1/2) harta, dan bagi cucu perempuan mendapat seperenam (1/6) sebagai pelengkap 2/3, dan sisanya untuk saudara perempuan pewaris'",
    "Telah menceritakan kepada kami Muslim bin Ibrahim telah menceritakan kepada kami Wuhaib telah menceritakan kepada kami Ibnu Thawus dari ayahnya dari Ibnu 'Abbas mengatakan, Rasulullah shallallahu 'alaihi wasallam bersabda: 'Berikanlah bagian peninggalan (warisan) kepada yang berhak, dan apa yang tersisa menjadi hak laki-laki yang paling utama (paling dekat nasabnya)"]
