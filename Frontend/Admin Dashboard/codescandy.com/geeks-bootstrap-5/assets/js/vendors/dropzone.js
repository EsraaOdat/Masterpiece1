Dropzone.autoDiscover=!1;
const myDropzone=new Dropzone("#my-dropzone",{url:"https://httpbin.org/post",maxFilesize:5,acceptedFiles:"image/*",addRemoveLinks:!0,autoProcessQueue:!0});
// myDropzone.on("addedfile",function(o){console.log("File added: "+o.name) }),


// Event listeners
myDropzone.on("addedfile", function (file) {
    console.log("File added: " + file.name);
    
    // Check if the number of files has reached the maximum
    if (myDropzone.files.length > 5) {
        myDropzone.removeFile(file); // Remove the newly added file
        alert("You can only upload 5 files."); // Alert to inform the user
    }
});

myDropzone.on("removedfile",function(o){console.log("File removed: "+o.name)}),
myDropzone.on("success",function(o,e){console.log("File uploaded successfully:",e)});




