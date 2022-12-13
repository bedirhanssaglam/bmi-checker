enum NavigationEnums {
  splash('/splash'),
  intro('/intro'),
  home('/home'),
  blog('/blog/:isSportBlog'),
  result('/result/:bmi/:name/:status/:explanation/:gender'),
  gettingFat('/gettingFat'),
  weaken('/weaken');

  final String routeName;
  const NavigationEnums(this.routeName);
}
