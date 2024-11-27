class Product {
  final String imageUrl;
  final String name;
  final String description;
  final String price;

  Product({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });
}

List<Product> machins = [
  Product(
    imageUrl: 'images/machins/laSpedialist.jpg',
    name: 'آلة قهوة لا سبازيالي',
    description: 'القهوة من لا سبازيالي: تجربة استثنائية في كأس واحد',
    price: '988.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/machins/Brecille2.jpg',
    name: 'برافيل',
    description:
        'استمتع بتجربة قهوة فائقة الجودة في منزلك مع آلة إسبريسو برافيل المتطورة.',
    price: '876.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/machins/Beeville.jpg',
    name: 'برافيل',
    description: 'تجربة قهوة بتميز احترافي في متناول يدك',
    price: '880.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/machins/nova.jpg',
    name: 'Cafe Machine',
    description:
        'مكينة الاسبريسو نوفا سيمونيلي ابيا لايف بمجموعتين - أسود Nuova Simonelli, Appia Life',
    price: '6000.000 ر.ي',
  ),
];

List<Product> cups = [
  Product(
    imageUrl: 'images/cups/BatmaCup.jpg',
    name: 'كوب باتمان',
    description:
        'كوب باتمان الأنيق والأنيق - حافظ على سر هويتك البطولية بينما تتمتع بكوب قهوتك المفضل',
    price: '5000 ر.ي',
  ),
  Product(
    imageUrl: 'images/cups/batmancups.jpg',
    name: 'كوبين شخصيات خيالية',
    description: 'كوبان باتمان المميز - أنت البطل الذي يستحق كوبًا يليق به!',
    price: '10000 ر.ي',
  ),
  Product(
    imageUrl: 'images/cups/blueCup.jpg',
    name: 'كوب صغير',
    description:
        'عشاق الشاي والقهوة يستحقون الحصول على أفضل تجربة شرب - تمتع بلحظات الراحة المثالية مع كوب الشاي الفاخر هذا.',
    price: '2500 ر.ي',
  ),
  Product(
    imageUrl: 'images/cups/cuplesCup.jpg',
    name: 'كوبان مميزان',
    description:
        'الكوبان المميزان لعشاق البطولة - احتفل بقهوتك كالبطل المفضل لديك، سواء كان سوبرمان أم باتمان..',
    price: '15000 ر.ي',
  ),
  Product(
    imageUrl: 'images/cups/GirlsCup.jpg',
    name: 'I,M JUST A GIRL',
    description:
        'أداة شرب أنيقة تضيف اللمسة النسائية المميزة لبدء يومك بتناول مشروبك المفضل.',
    price: '3000 ر.ي',
  ),
  Product(
    imageUrl: 'images/cups/JGcup.jpg',
    name: 'Pinke Cup',
    description:
        'كوب ساحر للاستمتاع بنقاء شرب المشروبات الساخنة بلمسة أنثوية جذابة.',
    price: '3500 ر.ي',
  ),
  Product(
    imageUrl: 'images/cups/miniCups4.jpg',
    name: 'طقم اكواب صغير',
    description:
        'مجموعة أكواب وصحون القهوة الأنيقة والعملية. تتميز بتصميم بسيط ومحايد لتوفر تجربة شرب مريحة ومريحة للقهوة أو الشاي.',
    price: '20000 ر.ي',
  ),
  Product(
    imageUrl: 'images/cups/PinkCup.jpg',
    name: 'كوب رخامي وردي',
    description:
        ' أشرب الفخامة في كل جرعة بهذا الكوب ذي التصميم المرمري الأنيق',
    price: '4500 ر.ي',
  ),
  Product(
    imageUrl: 'images/cups/whitecup.jpg',
    name: 'كوب رخامي ابيض',
    description:
        'هذا الكوب المصنوع بعناية مزيج بديع من الألوان الفاتحة والتصميم الأنيق. سيضفي طابعًا جماليًا لطيفًا على لحظات الاسترخاء مع مشروبك المفضل.',
    price: '4500 ر.ي',
  ),
  Product(
    imageUrl: 'images/cups/HogwartsCup.jpg',
    name: 'مدرسة هاري بوتر',
    description:
        'هذا الكوب المصنوع بعنايةأنغمس في عالم هوغوارتس السحري مع هذا الكوب المبهر المزين بشعار المدرسة الشهير وختم الشمع الأحمر الناصع..',
    price: '6000 ر.ي',
  ),
  Product(
    imageUrl: 'images/cups/SlytherinCup.jpg',
    name: 'كوب سليذرين',
    description:
        'اغمر حواسك بروح هوغوارتس مع هذا الكوب المذهل المزين بشعار دار سليذرين الشهير.',
    price: '2500 ر.ي',
  ),
  Product(
    imageUrl: 'images/cups/whitColdCup.jpg',
    name: ' كوب ستار بكس ',
    description:
        'تجربة لذيذة مع هذا الكوب الأبيض البسيط والأنيق من ستاربكس، يبرز الشعار الأيقوني للأخت سيرين في أناقته البالغة',
    price: '3000 ر.ي',
  ),
  Product(
    imageUrl: 'images/cups/whiteHotCup.jpg',
    name: ' كوب قهوة ابيض ',
    description:
        'تضفي هذه المجموعة البيضاء البسيطة والأنيقة من الفنجان والطبق طابعًا راقيًا وأنيقًا على طقوس الشاي والقهوة',
    price: '3000 ر.ي',
  ),
];
List<Product> filter = [
  Product(
    imageUrl: 'images/fillter/BlackJug.jpg',
    name: 'ابريق ماء ',
    description: 'ابريق ماء قهوة v60 اسود بمقبض بني غامق',
    price: '80000 ر.ي',
  ),
  Product(
    imageUrl: 'images/fillter/fltteringPapers.jpg',
    name: 'مرشح قهوة',
    description: '100 قطعة من مرشح القهوة ورق طبيعي لا يبيّض لقهوة v60',
    price: '3500 ر.ي',
  ),
  Product(
    imageUrl: 'images/fillter/woodjug.jpg',
    name: '  مصفاة قهوة',
    description: 'قطعة واحدة من مصفاة قهوة سيراميك بشكل زهرة بلون عشوائي ',
    price: '18000 ر.ي',
  ),
  Product(
    imageUrl: 'images/fillter/filtercoffee.png',
    name: 'مرشح قهوة',
    description:
        ' قطعة مرشح قهوة أو قدر قهوة مع مرشح ، من زجاج مقاوم للحرارة مطلي باللون الرمادي ',
    price: '12.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/fillter/woodjug.jpg',
    name: ' ابريق ماء',
    description: 'ابريق ماء حار اسود بمسكة خشبية لصب قهوة v60',
    price: '18000 ر.ي',
  ),
  Product(
    imageUrl: 'images/fillter/paper155.jpg',
    name: 'ورق ترشيح',
    description: '1055 قطة مرشحات قهوة مخروطية مقاس 02',
    price: '4000 ر.ي',
  ),
  Product(
    imageUrl: 'images/fillter/paperFilter.jpg',
    name: 'فلاتر قهوة',
    description: '200 قطعة من فلاتر القهوة v60 شكل مخروطي',
    price: '5500 ر.ي',
  ),
];
List<Product> crups = [
  Product(
    imageUrl: 'images/crops/black_braz.png',
    name: 'قهوة برازيلي / سانتا أنطونيو',
    description:
        'قهوة محمصة من منطقة سانتا أنطونيو في البرازيل، تتميز بجودة عالية ونكهة غنية. تأتي هذه القهوة في عبوة وزنها 250 جرام، مع تصميم عصري يجسد فن تحضير القهوة',
    price: '21.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/crops/black_colom.png',
    name: 'قهوة كولومبية / لا كابانا',
    description:
        'قهوة محمصة من منطقة لا كابانا في كولومبيا، تتميز بنكهة غنية ومتوازنة وجودة عالية. تأتي هذه القهوة في عبوة وزنها 250 جرام، مع تصميم عصري يعكس فن تحضير القهوة',
    price: '21.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/crops/black_ogan.png',
    name: 'قهوة أوغندية / ماما بيتي',
    description:
        'قهوة محمصة من منطقة ماما بيتي في أوغندا، تتميز بنكهة فريدة وجودة عالية. تأتي هذه القهوة في عبوة وزنها 250 جرام، مع تصميم عصري يعكس فن تحضير القهوة',
    price: '21.500 ر.ي',
  ),
  Product(
    imageUrl: 'images/crops/Hadab_colom100.png',
    name: 'قهوة كولومبيا مونتانا - هذب',
    description:
        'قهوة محمصة من منطقة مونتانا في كولومبيا، تتميز بنكهة غنية ومتوازنة. تأتي هذه القهوة في عبوة بتصميم عصري، حيث تعكس الجودة العالية وفن تحضير القهوة',
    price: '15.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/crops/Hadab_ethi.png',
    name: 'قهوة إثيوبيا هيمبلا - هذب',
    description:
        ' قهوة محمصة من منطقة هيمبلا في إثيوبيا، تتميز بنكهة فريدة ومعالجة متقنة. تأتي هذه القهوة في عبوة بتصميم عصري، تعكس الجودة العالية وفن تحضير القهوة',
    price: '18.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/crops/Hadab_salv.png',
    name: 'قهوة سلفادور فيانكا -هذب',
    description:
        'قهوة محمصة من سلفادور، تتميز بنكهة غنية ومعالجة احترافية. تأتي في عبوة بتصميم عصري، تعكس الجودة العالية وفن تحضير القهوة.',
    price: '18.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/crops/Hadab_yem.png',
    name: ' قهوة يمني حراز - هذب',
    description:
        'قهوة محمصة من منطقة حراز في اليمن، تتميز بنكهة غنية ومعالجة متقنة. تأتي في عبوة بتصميم عصري، تعكس الجودة العالية وفن تحضير القهوة',
    price: '28.000 ر.ي',
  ),
];
List<Product> matcha = [
  Product(
    imageUrl: 'images/macha/machaceremony.png',
    name: ' ماتشا ميرلينبيرد',
    description:
        'ماتشا احتفالية فاخرة، تأتي من مزارع مختارة بعناية. تتميز بنكهة غنية وقوام ناعم، وعبوة أنيقة تسلط الضوء على جودتها العالية. مثالية للاستخدام في المناسبات الخاصة',
    price: '48.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/macha/matchapowder.png',
    name: 'ماتشا كاجوشيما',
    description:
        'ماتشا يابانية عالية الجودة من كاجوشيما، تتميز بنكهة غنية ولون أخضر زاهي. تأتي في عبوة عصرية، مثالية للاستخدام في المناسبات الاحتفالية',
    price: '40.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/macha/packeg.png',
    name: 'مجموعة أدوات شاي الماتشا',
    description:
        ' تتضمن المجموعة وعاءً خزفيًا، ومضرب شاي (تشا وا) من الخيزران، ومغرفة شاي (شاك) لتسهيل تحضير شاي الماتشا. مثالية للاستمتاع بتجربة شاي يابانية تقليدية',
    price: '18.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/macha/set.png',
    name: 'مجموعة أدوات شاي الماتشا الفاخرة',
    description:
        'تتضمن المجموعة وعاءً خزفيًا، وكوبًا، ومضرب شاي (تشا وا) من الخيزران. تأتي في عبوة أنيقة، مثالية لتجربة شاي الماتشا التقليدية',
    price: '40.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/macha/things.png',
    name: 'مجموعة أدوات تحضير شاي الماتشا',
    description:
        ' تتضمن المجموعة مغرفة شاي (شاك) ومضرب شاي (تشا وا) من الخيزران، مع عبوة شفافة لحفظ الأدوات. مثالية لتحضير شاي الماتشا بطريقة تقليدية',
    price: '15.000 ر.ي',
  ),
];
List<Product> scale = [
  Product(
    imageUrl: 'images/scale/sc1.png',
    name: 'ميزان تايمور مين',
    description:
        'ميزان Black Mirror Mini من تايمور عبارة عن ميزان قهوة ميسور التكلفة ومليء بالميزات مع حجم أصغر مع الحفاظ على التصميم البسيط',
    price: '48.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/scale/sc2.png',
    name: 'صحن جرعات قهوة أبيض',
    description:
        'متاز صحن جرعات القهوة بتصميمه الأنيق والعملي، وهو مُصنوع من السيراميك عالي الجودة بلون أبيض جذاب. يتسع لحوالي 20-25 جرام من حبوب',
    price: '8000 ر.ي',
  ),
  Product(
    imageUrl: 'images/scale/sc3.png',
    name: 'ميزان رقمي مع توقيت',
    description:
        'ميزان مع مؤقت يعمل يدويا. المميزات سهل الاستخدام لجميع طرق تحضير القهوةشاشة ديجيتال إل سي دي مع إضاءة خلفية',
    price: '12.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/scale/sc4.png',
    name: 'ميزان ميني برو MS-R20 PRO',
    description:
        'مواصفات المنتج:  الموديل: MS-R20 PRO. مناسب للاسبريسومرفق مع الميزان سلك الشحنيقيس حتى 2 كجم وبدقة 0.1',
    price: '33.000 ر.ي',
  ),
  Product(
    imageUrl: 'images/scale/sc5.png',
    name: 'ميزان للقهوة برو R40 PRO',
    description:
        'ميزان بحجم مناسب لتحضير القهوة المقطرة مع وضعية ذكية لتصفير الوزن وللبدء التلقائي لحساب الوقت عند نزول القهوة ',
    price: '20.000 ر.ي',
  ),
];
