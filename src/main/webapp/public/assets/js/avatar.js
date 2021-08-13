class Avatar {
    constructor(skin, shadow, hair, eye, mouth, clothes) {
        this.skin = skin;
        this.shadow = shadow;
        this.hair = hair;
        this.eye = eye;
        this.mouth = mouth;
        this.clothes = clothes;
    }

    init() {
        document.getElementById('skin_color').value = this.skin;
        document.getElementById('clothes_color').value = this.clothes;
        document.getElementById('hair_color').value = this.hair.color;
        document.getElementById('eye_color').value = this.eye.color;
        this.loadImage();
    }

    setSkinColor(color) {
        this.skin = color;
        const skin_object = document.querySelector('#avatar #skin-object');
        skin_object.contentDocument.querySelector('.skinSVG').style.setProperty('fill', color, 'important');

        const shadow_color = this.lightenDarkenColor(color, -20);
        const shadows = skin_object.contentDocument.querySelectorAll('.shadowSVG');
        shadows.forEach(shadow => {
            shadow.style.setProperty('fill', shadow_color, 'important');
        });
    }

    setClothesColor(color) {
        this.clothes = color;
        const clothes_object = document.querySelector('#avatar #clothes-object');
        clothes_object.contentDocument.querySelector('.clothesSVG').style.setProperty('fill', color, 'important');
    }

    setHair(code) {
        this.hair.type = code;
        this.loadImage();
    }

    setHairColor(color) {
        this.hair.color = color;
        const hair_object = document.querySelector('#avatar #hair-object');
        hair_object.contentDocument.querySelector('.hairSVG').style.setProperty('fill', color, 'important');
    }

    setEye(code) {
        this.eye.type = code;
        this.loadImage();
    }

    setEyeColor(color) {
        this.eye.color = color;
        const eye_object = document.querySelector('#avatar #eye-object');
        const eyes = eye_object.contentDocument.querySelectorAll('.eyeSVG');
        eyes.forEach(eye => {
            eye.style.setProperty('fill', color, 'important');
        });
    }

    setMouth(code) {
        this.mouth = code;
        this.loadImage();
    }

    loadImage() {
        document.querySelector('#avatar .skin').src = `/TrabalhoWeb2/public/assets/avatar/skin-${this.skin}.svg`;

        const skinEl = document.querySelector('#avatar .skin');
        skinEl.addEventListener('load', () => {
            this.setSkinColor(this.skin);
        });

        const clothesEl = document.querySelector('#avatar .clothes');
        clothesEl.addEventListener('load', () => {
            this.setClothesColor(this.clothes);
        });

        const hairEl = document.querySelector('#avatar .hair');
        hairEl.data = `/TrabalhoWeb2/public/assets/avatar/hair-${this.hair.type}.svg`;
        hairEl.addEventListener('load', () => {
            this.setHairColor(this.hair.color);
        });

        const eyeEl = document.querySelector('#avatar .eye');
        eyeEl.data = `/TrabalhoWeb2/public/assets/avatar/eye-${this.eye.type}.svg`;
        eyeEl.addEventListener('load', () => {
            this.setEyeColor(this.eye.color);
        });

        const mouthEl = document.querySelector('#avatar .mouth');
        mouthEl.data = `/TrabalhoWeb2/public/assets/avatar/mouth-${this.mouth}.svg`;
    }

    lightenDarkenColor(color, amt) {
        var usePound = false;

        if (color[0] == "#") {
            color = color.slice(1);
            usePound = true;
        }

        var num = parseInt(color, 16);

        var red = (num >> 16) + amt;

        if (red > 255) red = 255;
        else if (red < 0) red = 0;

        var blue = ((num >> 8) & 0x00FF) + amt;

        if (blue > 255) blue = 255;
        else if (blue < 0) blue = 0;

        var green = (num & 0x0000FF) + amt;

        if (green > 255) green = 255;
        else if (green < 0) green = 0;

        return (usePound ? "#" : "") + (green | (blue << 8) | (red << 16)).toString(16);
    }
}

function blobToDataURL(blob, callback) {
    const a = new FileReader();
    a.onload = function(e) {callback(e.target.result);}
    a.readAsDataURL(blob);
    a.onloadend = (e) => {
    	console.log(e.target.result);
    }
}

window.onload = function (e) {	
    const avatar = new Avatar(
        skin = '#FFCC99',
        shadow = '#E1AD7A',
        hair = {
            type: 1,
            color: '#663333'
        },
        eye = {
            type: 1,
            color: '#663333'
        },
        mouth = 1,
        clothes = '#FFCC99'
    );

    avatar.init();

    document.getElementById('skin_color').onchange = function () {
        avatar.setSkinColor(this.value);
    }

    document.getElementById('clothes_color').onchange = function () {
        avatar.setClothesColor(this.value);
    }

    document.getElementById('hair').onchange = function () {
        avatar.setHair(this.value);
    }

    document.getElementById('hair_color').onchange = function () {
        avatar.setHairColor(this.value);
    }

    document.getElementById('eye').onchange = function () {
        avatar.setEye(this.value);
    }

    document.getElementById('eye_color').onchange = function () {
        avatar.setEyeColor(this.value);
    }

    document.getElementById('mouth').onchange = function () {
        avatar.setMouth(this.value);
    }
}

const submit = document.getElementById('submit');
submit.addEventListener('click', function () {

    const avatar_image = document.createElement('div');
    avatar_image.id = 'avatar_image';
    avatar_image.classList.add('avatar');

    const skin_div = document.createElement('div');
    const skin_object = document.querySelector('#avatar #skin-object');
    const skin_svg = skin_object.contentDocument.querySelector('svg');
    skin_div.appendChild(skin_svg);

    const hair_div = document.createElement('div');
    const hair_object = document.querySelector('#avatar #hair-object');
    const hair_svg = hair_object.contentDocument.querySelector('svg');
    hair_div.appendChild(hair_svg);

    const eye_div = document.createElement('div');
    const eye_object = document.querySelector('#avatar #eye-object');
    const eye_svg = eye_object.contentDocument.querySelector('svg');
    eye_div.appendChild(eye_svg);

    const mouth_div = document.createElement('div');
    const mouth_object = document.querySelector('#avatar #mouth-object');
    const mouth_svg = mouth_object.contentDocument.querySelector('svg');
    mouth_div.appendChild(mouth_svg);

    const clothes_div = document.createElement('div');
    const clothes_object = document.querySelector('#avatar #clothes-object');
    const clothes_svg = clothes_object.contentDocument.querySelector('svg');
    clothes_div.appendChild(clothes_svg);

    avatar_image.appendChild(skin_div);
    avatar_image.appendChild(hair_div);
    avatar_image.appendChild(eye_div);
    avatar_image.appendChild(mouth_div);
    avatar_image.appendChild(clothes_div);

    document.body.append(avatar_image);

    const avatarEl = document.querySelector("#avatar_image");

    html2canvas(avatarEl).then(canvas => {
        canvas.toBlob(function(blob) {
            const formData = new FormData();
       		
			const a = new FileReader();
		    
		    a.readAsDataURL(blob);
		    a.onloadend = (e) => {
		    	//formData.append('blob', e.target.result);
				//console.log(e.target.result);
				
				let length = 0;
				let dataQuery = ""
				
				for(let i = 0; i < e.target.result.length; i += 255) {
					dataQuery += `blob_${i/255}=${e.target.result.slice(i, i + 255)}&`;
					
					length++;
				}
				
				dataQuery += `length=${length}`;
				console.log(dataQuery);
			   	$.ajax({
	                url: '/TrabalhoWeb2/avatar',
	                method: 'POST',
	                /*data: {
	                	blob: e.target.result,
	                	teste: "10",
	                },*/
	                data: dataQuery,
	                cache: false,
	                processData: false
	            }).done(function (response) {
	                console.log(response);
	            });
		    }

            

        }, 'image/png');
    });
});
