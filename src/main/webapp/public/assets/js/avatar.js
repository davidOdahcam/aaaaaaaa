class Avatar {
    constructor(skin, shadow, hair, eye, clothes) {
        this.skin = skin;
        this.shadow = shadow;
        this.hair = hair;
        this.eye = eye;
        this.clothes = clothes;
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
            eye.style.setProperty('fill', color, 'important')
        });
    }

    loadImage() {
        document.querySelector('#avatar .skin').src = `/TrabalhoWeb2/public/assets/avatar/skin-${this.skin}.svg`;
        
        const hairEl = document.querySelector('#avatar .hair');
        hairEl.data = `/TrabalhoWeb2/public/assets/avatar/hair-${this.hair.type}.svg`;
        hairEl.addEventListener('load', () => {
            this.setHairColor(this.hair.color);
        })

        const eyeEl = document.querySelector('#avatar .eye');
        eyeEl.data = `/TrabalhoWeb2/public/assets/avatar/eye-${this.eye.type}.svg`;
        eyeEl.addEventListener('load', () => {
            this.seteyeColor(this.eye.color);
        });
    }
}


window.onload = function(e) {
    const avatar = new Avatar(
        skin = '#FFCC99',
        shadow = '#E1AD7A',
        hair = {
            type: 1,
            color: '#663333'
        },
        eye = {
            type: 1,
            color: '#FFCC99'
        },
        clothes = {
            type: '',
            color: '#FFCC99'
        }
    );

    avatar.loadImage();

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
    
    const capture = document.getElementById('download');
    capture.addEventListener('click', function () {
        const avatarEl = document.querySelector("#avatar");
        html2canvas(avatarEl).then(canvas => {
            var myImage = canvas.toDataURL("image/png");
            downloadURI("data:" + myImage, "yourImage.png");
        });
    });
    
    function downloadURI(uri, name) {
        var link = document.createElement("a");
        link.download = name;
        link.href = uri;
        link.click();
    }
}
