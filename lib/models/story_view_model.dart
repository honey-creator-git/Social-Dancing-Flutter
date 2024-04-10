class StoryViewModel{
  final String name;
  final String img;

  StoryViewModel({this.name,this.img});

}

List<Map> _storyData = [
  {"james": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP26cjkW6LqNqSJmP1qq-nmy112EdssG6AC7fV8JYvCD-oTcsGY0gtBYgFhVbCs2T3nnA&usqp=CAU"},
  {"williams": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4Lf7wdlXTOR9yqBpWtuo2pid1EilQ0bxnRTSBZvPPkhlDBGlBQee7QraOponv6JSgf4c&usqp=CAU"},
  {"martin": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCwHF4W1YpjtRVl3u_2lRnzrbqPwYSltyRzkGthXRmgQ&s"},
  {"john":"https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg"},
  {"ibram":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXUdZHEIh62u6gLJUM4dybb83j4DzSD4zcKKfvmQkttAKaRY8qJskarlA7SWzaEE78KSg&usqp=CAU"},
  {"moedin":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-ngJBzgC87qJ4Bfp7kqULVMRhsxsALwaqjdIOzkoBxgBiDv7-8KwiupW3-D1lAtbbrw8&usqp=CAU"},
  {"arunsmoki":"https://thumbs.dreamstime.com/b/woman-laying-grass-5455137.jpg"},
  {"mani":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRM-s5JJFWxcD9623Xk8besdStfRp4YasZQy54dbeuyFEGGkTpTyIm1L_dyOxvxpuC03w&usqp=CAU"},
  {"aniz":"https://www.perfocal.com/blog/content/images/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg"},
  {"ramgov":"https://blog.photofeeler.com/wp-content/uploads/2017/09/instagram-profile-picture-maker.jpg"},
  {"edwin21":"https://i.pinimg.com/736x/5d/e1/84/5de184caac6ed1ed08c1dcecabcd1fc8.jpg"},
  {"karthikks":"https://i.pinimg.com/originals/63/f9/d5/63f9d5fd5f34c8544a31c22c3e909cec.jpg"},
  {"peterpark":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_oCSpNyceseWF8FaomiEv5k6QEfZq1Ck0HAFzFqFer7dIDYnU2l1IbDFbM8WmQLiL8Z4&usqp=CAU"},
];



List<StoryViewModel>StoryViewData = [
  StoryViewModel(name: _storyData[0].keys.toList()[0],img: _storyData[0].values.toList()[0]),
  StoryViewModel(name: _storyData[1].keys.toList()[0],img: _storyData[1].values.toList()[0]),
  StoryViewModel(name: _storyData[2].keys.toList()[0],img: _storyData[2].values.toList()[0]),
  StoryViewModel(name: _storyData[3].keys.toList()[0],img: _storyData[3].values.toList()[0]),
  StoryViewModel(name: _storyData[4].keys.toList()[0],img: _storyData[4].values.toList()[0]),
  StoryViewModel(name: _storyData[5].keys.toList()[0],img: _storyData[5].values.toList()[0]),
  StoryViewModel(name: _storyData[6].keys.toList()[0],img: _storyData[6].values.toList()[0]),
  StoryViewModel(name: _storyData[7].keys.toList()[0],img: _storyData[7].values.toList()[0]),
  StoryViewModel(name: _storyData[8].keys.toList()[0],img: _storyData[8].values.toList()[0]),
  StoryViewModel(name: _storyData[9].keys.toList()[0],img: _storyData[9].values.toList()[0]),
  StoryViewModel(name: _storyData[10].keys.toList()[0],img: _storyData[9].values.toList()[0]),
  StoryViewModel(name: _storyData[11].keys.toList()[0],img: _storyData[9].values.toList()[0]),
  StoryViewModel(name: _storyData[12].keys.toList()[0],img: _storyData[9].values.toList()[0]),
];

