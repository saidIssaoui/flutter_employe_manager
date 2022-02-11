class Employee {
  final String uid, name, lastname, image, job, status;
  final bool userStatus;

  static List<Employee> data = [];

  Employee({
    this.uid = '',
    this.name = '',
    this.lastname = '',
    this.image = '',
    this.job = '',
    this.status = 'done',
    this.userStatus = false,
  });

  // static Future<List<Employee>> getEventsFromFirestore() async {
  //   CollectionReference ref = FirebaseFirestore.instance.collection('users');
  //   QuerySnapshot eventsQuery = await ref.get();
  //
  //   HashMap<String, Employee> eventsHashMap = new HashMap<String, Employee>();

  //   eventsQuery.docs.forEach((document) {
  //     eventsHashMap.putIfAbsent(
  //         document['id'],
  //         () => new Employee(
  //             name: document['firstName'],
  //             image: document['Image'],
  //             job: document['job'],
  //             status: document['status']));
  //   });
  //   data = eventsHashMap.values.toList();
  //   return data;
  // }
}
