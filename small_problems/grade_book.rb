GRADES = [["A", 90], ["B", 80], ["C", 70], ["D", 60], ["F", 0]]

def get_grade(int1, int2, int3)
  average = (int1 + int2 + int3) / 3.0
  grade = ''
  GRADES.each do |grade_arr|
    if average.between?(grade_arr[1], (grade_arr[1] + 10))
      grade = grade_arr[0]
    end
  end
  grade
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"