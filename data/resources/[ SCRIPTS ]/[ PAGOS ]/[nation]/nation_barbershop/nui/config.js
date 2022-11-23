const imgDir = "http://200.9.154.114/nation_barbershop/"; // DIRETÓRIO DAS IMAGENS

const pt_BR = {
    back: "voltar",
    confirm: "confirmar",
    opacity: "opacidade",
    buy: "comprar",
    yes: "sim",
    no: "não",
    title: "barbearia",
    bodyBlemishes: "manchas no corpo",
    addBodyBlemishes: "manchas no corpo 2",
    eyes: "olhos",
    eyesColor: "cor dos olhos",
    eyesOpenning: "abertura dos olhos",
    eyebrows: "sobrancelhas",
    eyebrowsStyle: "estilo das sobrancelhas",
    eyebrowsColor: "cor das sobrancelhas",
    complexion: "aspecto",
    sunDamage: "danos solares",
    freckles: "sardas",
    ageing: "rugas",
    blemishes: "manchas",
    hair: "cabelo",
    hairCut: "corte de cabelo",
    hairColor: "cor do cabelo",
    overlay: "micropigmentação",
    hairHighlightColor: "cor das mechas",
    facialHair: "barba",
    facialHairStyle: "estilo da barba",
    facialHairColor: "cor da barba",
    chestHair: "pelo corporal",
    chestHairStyle: "estilo do pelo corporal",
    chestHairColor: "cor do pelo corporal",
    blush: "blush",
    blushStyle: "estilo do blush",
    blushColor: "cor do blush",
    lipstick: "batom",
    lipstickStyle: "estilo do batom",
    lipstickColor: "cor do batom",
    makeup: "maquiagem",
    makeups: "maquiagens",
    makeupStyle: "estilo da maquiagem",
    makeupColor: "cor da maquiagem",
    skin: "pele"
}



const lang = pt_BR;



const icons = {
    body: `<?xml version="1.0" encoding="iso-8859-1"?>
    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
         viewBox="0 0 53.545 53.545" style="enable-background:new 0 0 53.545 53.545;" xml:space="preserve">
    <g>
        <g>
            <circle cx="26.686" cy="4.507" r="4.507"/>
            <path d="M28.256,11.163c-1.123-0.228-2.344-0.218-3.447,0.042c-7.493,0.878-9.926,9.551-9.239,16.164
                c0.298,2.859,4.805,2.889,4.504,0c-0.25-2.41-0.143-6.047,1.138-8.632c0,3.142,0,6.284,0,9.425c0,0.111,0.011,0.215,0.016,0.322
                c-0.003,0.051-0.015,0.094-0.015,0.146c0,7.479-0.013,14.955-0.322,22.428c-0.137,3.322,5.014,3.309,5.15,0
                c0.242-5.857,0.303-11.717,0.317-17.578c0.244,0.016,0.488,0.016,0.732,0.002c0.015,5.861,0.074,11.721,0.314,17.576
                c0.137,3.309,5.288,3.322,5.15,0c-0.309-7.473-0.32-14.949-0.32-22.428c0-0.232-0.031-0.443-0.078-0.646
                c-0.007-3.247-0.131-6.497-0.093-9.742c1.534,2.597,1.674,6.558,1.408,9.125c-0.302,2.887,4.206,2.858,4.504,0
                C38.678,20.617,36.128,11.719,28.256,11.163z"/>
        </g>
    </g>
    </svg>`,

    head: `<?xml version="1.0" standalone="no"?>
    <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 20010904//EN"
     "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
    <svg version="1.0" xmlns="http://www.w3.org/2000/svg"
     width="256.000000pt" height="256.000000pt" viewBox="0 0 256.000000 256.000000"
     preserveAspectRatio="xMidYMid meet">
    
    <g transform="translate(0.000000,256.000000) scale(0.100000,-0.100000)"
    stroke="none">
    <path d="M1162 2470 c-235 -43 -444 -226 -518 -454 -22 -67 -28 -106 -32 -222
    l-4 -140 -41 -15 c-66 -23 -87 -63 -87 -169 0 -141 38 -229 123 -286 23 -16
    43 -28 44 -29 1 0 11 -44 21 -97 22 -108 56 -190 102 -248 l30 -38 0 -184 0
    -183 -112 -40 c-110 -39 -113 -41 -113 -70 0 -43 26 -43 147 0 90 32 103 34
    111 20 17 -31 69 -84 100 -103 18 -11 103 -45 190 -77 l159 -56 156 56 c87 32
    171 66 189 77 31 19 83 72 100 103 8 14 20 12 109 -19 109 -39 136 -43 153
    -22 25 30 -4 52 -119 92 l-110 38 0 184 0 184 30 38 c46 58 80 140 102 248 10
    53 20 97 21 97 1 1 21 13 44 29 85 57 123 145 123 286 0 106 -21 146 -88 170
    l-42 14 0 117 c0 262 -105 468 -306 599 -133 87 -328 127 -482 100z m257 -85
    c204 -48 381 -225 436 -435 15 -56 17 -97 11 -295 -9 -342 -41 -610 -86 -713
    -38 -86 -212 -281 -313 -350 l-46 -32 -141 0 -141 0 -46 32 c-91 62 -263 250
    -306 333 -70 137 -126 836 -82 1024 48 204 224 380 435 435 72 19 199 19 279
    1z m-792 -967 c6 -84 8 -155 6 -158 -6 -7 -42 40 -59 77 -18 41 -19 204 -2
    221 7 7 19 12 28 12 14 0 18 -23 27 -152z m1361 140 c17 -17 16 -180 -2 -221
    -17 -37 -53 -84 -59 -77 -3 4 17 300 22 308 3 7 28 1 39 -10z m-924 -1039 l59
    -39 157 0 156 0 50 31 c27 17 82 61 122 96 l72 65 0 -131 c0 -140 -10 -183
    -53 -229 -30 -32 -56 -45 -212 -102 l-134 -49 -134 49 c-156 56 -184 69 -214
    102 -43 46 -53 89 -53 229 l0 131 63 -58 c34 -31 89 -74 121 -95z"/>
    <path d="M171 2386 c-8 -9 -11 -57 -9 -151 3 -119 5 -139 21 -149 12 -8 22 -8
    35 0 14 9 17 29 20 122 l3 111 111 3 c93 3 113 6 122 21 8 12 8 22 0 35 -10
    15 -31 17 -151 20 -111 2 -143 0 -152 -12z"/>
    <path d="M2092 2388 c-7 -7 -12 -19 -12 -28 0 -33 22 -40 132 -40 l107 0 3
    -111 c3 -94 6 -114 21 -123 12 -8 22 -8 35 0 15 10 17 30 20 149 2 93 -1 142
    -9 151 -15 19 -279 20 -297 2z"/>
    <path d="M172 468 c-18 -18 -17 -282 2 -297 9 -8 58 -11 151 -9 119 3 139 5
    149 21 8 12 8 22 0 35 -9 14 -29 17 -123 20 l-111 3 0 107 c0 110 -7 132 -40
    132 -9 0 -21 -5 -28 -12z"/>
    <path d="M2332 468 c-8 -8 -12 -49 -12 -120 l0 -107 -111 -3 c-94 -3 -114 -6
    -123 -21 -8 -12 -8 -22 0 -35 10 -15 30 -17 149 -20 93 -2 142 1 151 9 11 9
    14 44 14 148 0 140 -5 161 -40 161 -9 0 -21 -5 -28 -12z"/>
    </g>
    </svg>
    `,

    chest: `<?xml version="1.0" encoding="iso-8859-1"?>
    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
         width="40.143px" height="40.143px" viewBox="0 0 40.143 40.143" style="enable-background:new 0 0 40.143 40.143;"
         xml:space="preserve">
    <g>
        <g>
            <path d="M29.248,4.118l-0.502,0.503V4.118h-2.473c-1.115,1.723-3.469,2.914-6.202,2.914c-2.732,0-5.086-1.191-6.201-2.914h-2.473
                v0.503l-0.503-0.503L2,13.017l4.865,4.869l4.532-4.534v22.672h17.347V13.353l4.533,4.534l4.864-4.87L29.248,4.118z"/>
            <path d="M28.744,38.024H11.397c-1.104,0-2-0.896-2-2V18.182L8.279,19.3c-0.375,0.376-0.884,0.586-1.415,0.586c0,0,0,0,0,0
                c-0.53,0-1.04-0.211-1.415-0.586l-4.865-4.869c-0.78-0.781-0.78-2.046,0-2.828L9.48,2.704c0.434-0.435,1.061-0.646,1.665-0.57
                c0.083-0.01,0.167-0.016,0.252-0.016h2.473c0.678,0,1.311,0.344,1.679,0.913c0.787,1.216,2.562,2.001,4.522,2.001
                s3.736-0.785,4.523-2.001c0.368-0.569,1-0.913,1.679-0.913h2.473c0.085,0,0.169,0.005,0.252,0.016
                c0.082-0.01,0.165-0.016,0.249-0.016c0.001,0,0.001,0,0.001,0c0.53,0,1.039,0.211,1.415,0.586l8.894,8.898
                c0.78,0.781,0.78,2.046,0,2.828l-4.864,4.87c-0.375,0.375-0.884,0.586-1.414,0.586c-0.001,0-0.001,0-0.001,0
                c-0.53,0.001-1.039-0.21-1.414-0.585l-1.119-1.12v17.843C30.744,37.129,29.849,38.024,28.744,38.024z M13.397,34.024h13.347
                V13.353c0-0.809,0.487-1.538,1.234-1.848c0.748-0.311,1.607-0.139,2.18,0.434l3.118,3.118l2.038-2.04l-6.399-6.403
                c-0.319,0.029-0.633-0.021-0.934-0.145c-0.209-0.086-0.398-0.206-0.562-0.351h-0.172c-1.651,1.82-4.297,2.914-7.176,2.914
                c-2.879,0-5.524-1.094-7.176-2.914h-0.172c-0.163,0.145-0.352,0.264-0.561,0.351c-0.303,0.125-0.625,0.169-0.936,0.145l-6.4,6.404
                l2.038,2.04l3.117-3.119c0.572-0.573,1.432-0.744,2.18-0.434c0.748,0.31,1.235,1.039,1.235,1.848V34.024z"/>
        </g>
    </g>
    </svg>`,

    eye: `<i class="far fa-eye"></i>`,

    mouth: `<?xml version="1.0" encoding="iso-8859-1"?>
    <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
         viewBox="0 0 511.999 511.999" style="enable-background:new 0 0 511.999 511.999;" xml:space="preserve">
    <g>
        <g>
            <path d="M487.179,219.665c-7.942-2.804-29.788-15.017-86.867-65.319c-22.435-19.77-52.336-29.055-82.037-25.475
                c-23.759,2.865-45.689,13.75-62.275,30.548c-16.588-16.796-38.519-27.685-62.275-30.548c-29.705-3.582-59.602,5.704-82.037,25.475
                c-57.078,50.302-78.924,62.515-86.867,65.319L0,228.426l107.011,97.681c40.815,37.256,93.726,57.775,148.988,57.775
                c55.262,0,108.173-20.518,148.988-57.775l107.011-97.681L487.179,219.665z M383.734,302.824
                c-34.992,31.941-80.355,49.532-127.734,49.532s-92.742-17.591-127.734-49.532l-43.502-39.709
                c10.617-0.055,21.681-0.658,32.933-1.276c46.144-2.528,93.858-5.149,127.873,24.875L256,295.921l10.431-9.208
                c34.015-30.024,81.729-27.402,127.873-24.875c11.253,0.617,22.317,1.22,32.934,1.275L383.734,302.824z M396.03,230.361
                c-43.875-2.406-97.65-5.359-140.03,24.478c-42.379-29.838-96.152-26.886-140.031-24.478c-17.522,0.96-34.503,1.887-48.581,0.619
                c14.595-10.369,35.387-26.759,65.142-52.982c15.701-13.837,36.627-20.332,57.419-17.829c20.82,2.51,39.636,13.818,51.623,31.025
                l14.426,20.706l14.426-20.706c11.987-17.208,30.804-28.516,51.623-31.025c20.789-2.507,41.718,3.992,57.419,17.829
                c29.755,26.222,50.546,42.613,65.143,52.981C430.532,232.247,413.551,231.32,396.03,230.361z"/>
        </g>
    </g>
    </svg>`,

    rotate: `<?xml version="1.0" encoding="utf-8"?><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 45.59"
        style="enable-background:new 0 0 122.88 45.59" xml:space="preserve">
        <style type="text/css">
            <![CDATA[
            .st0 {
                fill-rule: evenodd;
                clip-rule: evenodd;
            }
            ]]>
        </style>
        <g>
            <path class="st0"
                d="M105.14,8.16c15.07,5.35,14.31,14.26-6.59,19.42c-4.28,1.06-8.52,2.04-13.64,2.64v6.07 c5.9-0.73,10.92-2.08,15.85-3.28c30.37-7.36,26.92-20.93,5.06-27.4C92.61,1.71,76.16,0.04,62.46,0 C49.59-0.04,35.04,1.16,22.43,4.38c-58.73,15,13.09,35.33,42.34,34.21v7l10.17-10.18v-2.16L64.77,23.09v7.47 c-14.93,0.13-86.53-8.93-41.68-23.5C33.44,3.7,51.73,2.71,62.72,2.73C74.93,2.75,93.62,4.07,105.14,8.16L105.14,8.16z" />
        </g>
    </svg>`,

};




const componentsImages = {
    "hair-section": "hair",
    "eyebrows-section": "eyebrows",
    "eyes": "eyes",
    "makeups-section": "makeup",
    "facialHair-section": "facialHair",
    "chestHair-section": "chestHair",
    "skin": "skin",

    "hair": "hair",
    "hair-color": "hair-color",
    "hair-highlightcolor": "hair-highlightcolor",
    "overlay": "overlay",

    "eyebrows": "eyebrows",
    "eyebrows-color": "eyebrows-color",

    "blush-section": "blush",
    "lipstick-section": "lipstick",
    "makeup-section": "makeup",

    "blush": "blush",
    "blush-color": "blush-color",

    "lipstick": "lipstick",
    "lipstick-color": "lipstick-color",
    
    "makeup": "makeup",
    "makeup-color": "makeup-color",

    "facialHair": "facialHair",
    "facialHair-color": "facialHair-color",

    "chestHair": "chestHair",
    "chestHair-color": "chestHair-color",
}