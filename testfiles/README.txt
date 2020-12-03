Explanation of the test files
test-correct.ccl    |this testfile is used to show that there are no 
					|errors if the syntax is correctly used.
					|
test-duplicate.ccl  |this testfile is used to show that our grammar is
					|able to detect duplicate MI's that have different 
					|labels.
					|
test-engine.ccl     |this testfile is used to show that the storage 
					|unit should have a valid engine, in this case 
					|"YourSQL" is given which is not in the list.
					|
test-memory.ccl     |this testfile is used to show that the memory of 
					|an MI is not allowed to be higher than 64 GB, in
					|this file the memoy is set to 65 GB.
					|
test-region1.ccl    |This testfile is used to show that an MI should 
					|have a valid region that is in the given list, 
					|in this test it fails because the storage has 
					|the region Tilburg, which is not in the list.
					|
test-region2.ccl    |This testfile is used to show that all MI's in a 
					|resource should have the same region, in this 
					|file the regions are the same, but the regions 
					|are not valid so it should still fail.
					|
test-region3.ccl    |This testfile is used to show that all MI's 
					|should have the same region, in this file the 
					|regions used are valid but not the same so it 
					|should fail.
					|
test-storage1.ccl   |This testfile is used to show that the storage of
					|an MI should be greater than 0, in this file the 
					|storage size is set to 0 so it should fail.
					|
test-storage2.ccl   |This testfile is used to show that the storage of
					|an MI should be less or equal than 1024 GB, in 
					|this file the storage size is set to 1025 so it 
					|should fail.
					|	
test-uniquelabel.ccl|This testfile is used to show that the labels of 
					|each MI within a storage should be unique, in 
					|this case the labels given are both "my_db" so 
					|it should fail.
