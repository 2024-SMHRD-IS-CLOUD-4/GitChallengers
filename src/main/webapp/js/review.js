function previewImage(event) {
    const preview = document.getElementById('preview-image');
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            preview.src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
}

function previewAuthImage(event) {
    const file = event.target.files[0];
    if (file) {
        // Handle the uploaded authentication image if needed
        console.log("Auth image uploaded: ", file.name);
    }
}

function toggleSelection(type) {
    const personalButton = document.getElementById('personal-button');
    const groupButton = document.getElementById('group-button');

    if (type === 'personal') {
        personalButton.classList.add('active');
        groupButton.classList.remove('active');
    } else {
        personalButton.classList.remove('active');
        groupButton.classList.add('active');
    }
}

// Show or hide the green checkmark based on a condition
function setCheckmarkStatus(isChecked) {
    const checkmark = document.getElementById('checkmark');
    if (isChecked) {
        checkmark.style.display = 'inline';
    } else {
        checkmark.style.display = 'none';
    }
}

// Example usage: setCheckmarkStatus(true or false)
setCheckmarkStatus(true); // Set to true or false to control the checkmark visibility
