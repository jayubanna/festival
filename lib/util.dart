import 'dart:typed_data';

List<Map<String,dynamic>> festivalList = [
  {
    "img":"https://d1csarkz8obe9u.cloudfront.net/posterpreviews/holi-poster-design-template-745f9c6c74e4c19a1cd215ac38bb2854_screen.jpg?ts=1583377007",
    "text":"Holi",
  },
  {
    "img":"https://t3.ftcdn.net/jpg/03/74/08/60/360_F_374086050_NoBMS0X0StaNEzTFVcaLsCtELnQ3o0d1.jpg",
    "text":"Navratri ",
  },
  {
    "img":"https://img.freepik.com/free-vector/happy-raksha-bandhan-festival-white-background-design_1017-32965.jpg",
    "text":"Raksha Bandhan",
  },
  {
    "img":"https://rukminim2.flixcart.com/image/850/1000/k16qzrk0/poster/g/p/3/large-kd-full-white-background-happy-diwali-m-sticker-poster-original-imafkf2jaznqnjgf.jpeg?q=90&crop=false",
    "text":"Diwali",
  },
  {
    "img":"https://img.freepik.com/free-vector/makar-sankranti-cultural-indian-festival-greeting-card-vector_1055-11789.jpg",
    "text":"Makar Sankranti",
  },
  {
    "img":"https://img.freepik.com/premium-vector/indian-15-august-76-independence-day-orange-green-torn-paper-background-social-media-post-banner-poster-design_665888-1930.jpg",
    "text":"Independence Day",
  },
  {
    "img":"https://img.freepik.com/free-vector/illustration-lord-rama-killing-ravana-happy-dussehra-festival-background_1035-25003.jpg",
    "text":"Dussehra",
  },
  {
    "img":"https://img.freepik.com/premium-vector/happy-ram-navami-festival-india_498048-1491.jpg",
    "text":"Ram Navami",
  },
  {
    "img":"https://www.shutterstock.com/image-vector/creative-poster-design-nation-hero-600nw-2359837411.jpg",
    "text":"Bhagatsingh Jayanti",
  },
  {
    "img":"https://img.freepik.com/free-vector/happy-guru-nanak-jayanti-greeting-card-background-vector_1055-19162.jpg?size=626&ext=jpg&ga=GA1.1.1700460183.1712534400&semt=ais",
    "text":"Gurpurab",
  },
  {
    "img":"https://i.pinimg.com/736x/71/c6/c4/71c6c4805c1f463a03903bbbf25ec6ff.jpg",
    "text":"Happy Janmashtami",
  },
  {
    "img":"https://t4.ftcdn.net/jpg/04/53/65/93/360_F_453659371_4KFaYDWRDodecJWafuWbqETzd6VSDRWN.jpg",
    "text":"Ganesh Chaturthi",
  },
  {
    "img":"https://i.pngimg.me/image_by_url?url=https://image.freepik.com/free-vector/creative-christmas-background-with-landscape-scene-made-with-dots_1017-11610.jpg",
    "text":"Merry Christmas",
  },
  {
    "img":"https://t4.ftcdn.net/jpg/04/85/02/93/360_F_485029389_KNkYUB0D5VWobXyUrmadEamNCnfVc3sH.jpg",
    "text":"Maha Shivratri",
  }
];


class infoData {
  String? name="";
  String? email="";
  String? companyname="";
  String? mobileNo="";
  String? emailAddress="";
  String? companyaddress="";
  String? website="";

}

infoData InfoData = infoData();

List<String> fontStyle = [

"Rubik",
"BebasNeue",
"Caveat",
"ChakraPetch",
"DancingScript",
"IndieFlower",
"Jersey20",
];

Uint8List? savedImg;

