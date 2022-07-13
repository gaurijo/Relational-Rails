require 'rails_helper'

RSpec.describe 'the student index page' do 
    it 'displays the name of each student' do 
        school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
        school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                ap_program: false)                          
        student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
        student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)

        visit '/students'

        expect(page).to have_content(student.name)
    end

    it 'displays true/false if the student is part of the honor roll' do
        school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
        school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
        student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
        student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)

        visit '/students'

        expect(page).to have_content(student.honor_roll)
    end

    it 'displays the student class rank' do 
        school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
        school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                ap_program: false)                          
        student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
        student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)
    
        visit '/students'

        expect(page).to have_content(student.class_rank)
    end

    it 'displays the school id associated with the student' do 
        school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
        school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
        student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
        student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)

        visit '/students'

        expect(page).to have_content(student.school_id)
    end

    it 'displays a link at the top of the page that takes user to the students index page' do 
        school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
        school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
        student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
        student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)
        
        visit '/students'
        click_link "Students"

        expect(page).to have_link("Students")
    end

    it 'displays a link at the top of the page that takes user to the schools index page' do 
        school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
        school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
        student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
        student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)
            
        visit '/students'
        click_link "Schools"
            
        expect(page).to have_link("Schools")
        expect(current_path).to eq('/schools')
    end

    it 'only shows student records where the student honor roll status is true' do 
        school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
        mandy = school.students.create!(name: "Mandy", honor_roll: true, class_rank: 4)
        noah = school.students.create!(name: "Noah", honor_roll: false, class_rank: 29)

        visit '/students'
        expect(page).to have_content("Mandy")
        expect(page).to_not have_content("Noah")
    end

    it 'displays a link to edit each student info' do 
        school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
        mandy = school.students.create!(name: "Mandy", honor_roll: true, class_rank: 4)
        noah = school.students.create!(name: "Noah", honor_roll: false, class_rank: 29) 

        visit '/students'
        find_link("Update Student")

        expect(page).to have_link("Update Student")
    end

    it 'links to the students edit page' do 
        monta = School.create!(name: "Monta Vista High School", national_rank: 12, 
                                ap_program: true)
        mandy = monta.students.create!(name: "Mandy", honor_roll: true, class_rank: 4)

        visit '/students'
        click_link "Update Student"

        expect(current_path).to eq("/students/#{mandy.id}/edit")
    end

    it 'displays a link to delete each student' do 
        school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
        mandy = school.students.create!(name: "Mandy", honor_roll: true, class_rank: 4)
        noah = school.students.create!(name: "Noah", honor_roll: false, class_rank: 29) 

        visit '/students'
        click_link("Delete Student")

        expect(current_path).to eq("/students")
    end
end