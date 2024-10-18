import 'package:flutter_dotenv/flutter_dotenv.dart';


const String apodDefaultDate = "1995-06-16";
const String apodDefaultImageUrl = "https://cdn.pixabay.com/photo/2017/02/12/21/29/false-2061131_1280.png";
const String apodBaseUrl = "https://api.nasa.gov/planetary/apod";

// ENV
final String apodAPIkey = dotenv.env['APOD_API_KEY'] ?? "";
final String astroJsonUrl = dotenv.env['ASTRO_JSON_URL'] ?? "";
final String unsplashClientId = dotenv.env['UNSPLASH_CLIENT_ID'] ?? "";

// DATA (Temporary , LAZY)
List<List<String>> imagesList = [
  [
    "https://i.pinimg.com/564x/0a/87/9b/0a879ba970cca4320329849a72e75b22.jpg",
    "https://i.pinimg.com/564x/b2/e7/73/b2e7736d6ef3689f1e4657341c695e17.jpg",
    "https://i.pinimg.com/564x/b9/4b/77/b94b77c1ced58699c65d19da732f4b05.jpg",
    "https://i.pinimg.com/564x/45/d3/75/45d375c3deaf19603c78cca1ed29b66f.jpg",
    "https://i.pinimg.com/564x/7e/77/ea/7e77eaa8683897f94a444e2c2d18dd7f.jpg",
    "https://i.pinimg.com/564x/86/14/8c/86148c369c88553ab402433b19ec51cd.jpg",
    "https://i.pinimg.com/564x/ed/fe/66/edfe66d7c9a62ace1984e9f32390fb09.jpg",
    "https://i.pinimg.com/564x/fd/fb/5e/fdfb5e279dc80f319718fa5ead788207.jpg",
    "https://i.pinimg.com/564x/17/8d/32/178d32f1d9ae922b089ab915291c193b.jpg",
    "https://i.pinimg.com/564x/54/78/3a/54783a3a6907575e63224837cf88ad0d.jpg",
    "https://i.pinimg.com/564x/e1/c2/49/e1c249c1fe34126d3f4e64fe6f6c0be0.jpg",
    "https://i.pinimg.com/564x/c8/78/27/c878278803a03a7297dd260664ca3501.jpg",
    "https://i.pinimg.com/564x/5b/ae/06/5bae060080717bf9ffbe0132b1f23b13.jpg",
    "https://i.pinimg.com/736x/ee/6c/6e/ee6c6ef185f0107b477697441451e7a5.jpg",
    "https://i.pinimg.com/564x/3d/8a/d4/3d8ad4cedd12db41b905911379e2356f.jpg",
    "https://i.pinimg.com/564x/94/91/cd/9491cdf5578245525c536a00e76b5ab5.jpg",
    "https://i.pinimg.com/564x/ed/96/77/ed96771291a4d730d775b7cf425271c2.jpg",
    "https://i.pinimg.com/564x/80/d1/a8/80d1a8901239054a97ce3f9e3c5817ee.jpg",
    "https://i.pinimg.com/564x/11/80/e2/1180e2cd7179debd764f1e1e70856d7a.jpg",
    "https://i.pinimg.com/564x/c8/f2/fd/c8f2fd059006a10e5194f927d58ff0cb.jpg",
    "https://i.pinimg.com/564x/fd/a0/c3/fda0c38e5e64bb83df35481a7a1b17ed.jpg",
    "https://i.pinimg.com/564x/28/ba/6b/28ba6bf6a0790dc6ab173823d38eb7e9.jpg",
    "https://i.pinimg.com/564x/e0/72/0f/e0720fc5250f622d55291d7943fce1c9.jpg",
    "https://i.pinimg.com/564x/fb/7a/46/fb7a46eee03467496ff27950635cc2fb.jpg",
    "https://i.pinimg.com/564x/a8/bd/10/a8bd103902ffddb7e9a5ee8167af38b8.jpg",
    "https://i.pinimg.com/564x/aa/c4/67/aac4672dc35605e6118898997ca021f1.jpg",
    "https://i.pinimg.com/564x/fc/e6/cf/fce6cf6a8933efe25517cf0e7379909e.jpg",
    "https://i.pinimg.com/564x/bb/4a/08/bb4a0815cd39417a42b0c36fe713d350.jpg",
    "https://i.pinimg.com/564x/0f/a4/29/0fa429f7f0ceefbaf7929e83aaf6b086.jpg",
  ],
  [
    "https://i.pinimg.com/236x/36/2d/9f/362d9fbcf2fb2971ea8e25217c655a87.jpg",
    "https://i.pinimg.com/236x/0b/da/5a/0bda5a5ad4e2e9fbdf98843942d25e0f.jpg",
    "https://i.pinimg.com/236x/87/b7/b1/87b7b1834bbf1c6f6b96f75d9a522a83.jpg",
    "https://i.pinimg.com/236x/69/f7/4e/69f74e0fea8c5e37a1ab340b89e258c3.jpg",
    "https://i.pinimg.com/236x/b5/d1/e0/b5d1e031a8c43bbf3c6d386929acff20.jpg",
    "https://i.pinimg.com/236x/6a/f7/9f/6af79fced45ec2e8e6da002f3f6b607a.jpg",
    "https://i.pinimg.com/736x/fd/77/98/fd7798b947560785dcd4369da8a7416a.jpg",
    "https://i.pinimg.com/564x/ab/1f/50/ab1f501b14d8d98ea0fb9fc71f381f14.jpg",
    "https://i.pinimg.com/564x/91/de/4b/91de4b4555c3a831af444e06fdc129cf.jpg",
    "https://i.pinimg.com/236x/a2/0c/7a/a20c7a1a213f53c3c215610f37bf40e5.jpg",
    "https://i.pinimg.com/236x/e5/b7/c3/e5b7c38825b9e459b2ddb20b5d5f9ff8.jpg",
    "https://i.pinimg.com/236x/57/4c/3d/574c3dc03cdd06040eb8bad0fa6a2d94.jpg",
    "https://i.pinimg.com/236x/49/18/e4/4918e40dc70d8d5fc9452c7b10d21810.jpg",
    "https://i.pinimg.com/236x/4b/7b/9c/4b7b9c8929389f14f35362bd695a62ce.jpg",
    "https://i.pinimg.com/564x/0a/b8/c8/0ab8c8187732f1988142c4d9a169d789.jpg",
  ],
  [
    "https://i.pinimg.com/236x/2b/d9/f2/2bd9f2b78c8963965ba6247c520ad807.jpg",
    "https://i.pinimg.com/236x/00/b4/f5/00b4f57d08b452fa6c6741c3bfd94f8e.jpg",
    "https://i.pinimg.com/236x/0e/02/37/0e0237e3a6e3aa50eb56bef313d8b2d8.jpg",
    "https://i.pinimg.com/236x/42/e0/f4/42e0f4cfafad2d8b5fc02545888387a4.jpg",
    "https://i.pinimg.com/236x/99/47/96/9947961f1b408b1e1dad9d00bfb47a45.jpg",
    "https://i.pinimg.com/736x/2b/c1/a1/2bc1a1a6ebd82416f495a809fcbf79ea.jpg",
    "https://i.pinimg.com/236x/e7/a9/b9/e7a9b9bffb0634744724a41389172feb.jpg",
    "https://listverse.com/wp-content/uploads/2019/04/6a-Phaeton.jpg",
  ],
  [
    "https://i.pinimg.com/236x/98/28/12/982812c7191c27c131800916ced581f9.jpg",
    "https://i.pinimg.com/236x/0a/d7/d5/0ad7d58caa1be443168f7a163752307c.jpg",
    "https://i.pinimg.com/236x/bf/f4/11/bff41170fafd8a04f6cdccd7c499472e.jpg",
    "https://i.pinimg.com/236x/33/63/50/336350073bfa8d83176cea3596d002a4.jpg",
    "https://i.pinimg.com/236x/22/6b/07/226b0753a5c4ae7389e72049c83fdcd5.jpg",
    "https://i.pinimg.com/236x/cc/98/7d/cc987d73aa0f0ff273014a2c8873cb45.jpg",
    "https://i.pinimg.com/236x/c9/d0/35/c9d035252e0299103a51375543281183.jpg",
    "https://i.pinimg.com/236x/f9/59/63/f95963a1a00d4142cc82ef16ce896bc6.jpg",
    "https://i.pinimg.com/236x/3c/f0/80/3cf0803216aff542fbee5d6695f9e28d.jpg",
  ],
];


