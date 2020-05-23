input = [ { id: 1, title: "heading1", heading_level: 0 },
{ id: 4, title: "heading2", heading_level: 1 },
{ id: 2, title: "heading3", heading_level: 0 },
{ id: 4, title: "heading4", heading_level: 2 },
{ id: 3, title: "heading5", heading_level: 1 },
{ id: 4, title: "heading6", heading_level: 0 }
]
    prev_level = 0
    prev_heading = "1."
    input.each do |inp|
if prev_level < inp[:heading_level]

    (inp[:heading_level]).times do
        prev_heading += "1."
    end

    prev_level = inp[:heading_level]
elsif prev_level > inp[:heading_level]
    if inp[:heading_level] == 0
        tmp_var = prev_heading.gsub(".","")
        prev_heading = tmp_var[0].to_i+1
        prev_heading = prev_heading.to_s+"."
    else
        diff = prev_level - inp[:heading_level]
        tmp = prev_heading.gsub(".","")
        diff_of_levels = prev_level - inp[:heading_level]
       # puts "diff_of_levels is #{diff_of_levels}"
        count_tmp = tmp.split("").count - diff_of_levels - 1
        tmp = tmp[0..count_tmp]
       # puts "tmp value is #{tmp} count is #{tmp.split("").count}"
        #  pos = inp[:heading_level] - prev_level - 1
        pos =   prev_level - inp[:heading_level] 
        prev_heading = (tmp.to_i + 1).to_s
        prev_heading = prev_heading.to_s.split("").join('.')
        #puts "prev_heading value is #{prev_heading}"
        # prev_heading = prev_heading[0..pos*2+1] 
        prev_heading = prev_heading[0..pos*2+1] 
    end

    prev_level = inp[:heading_level]
end 
    puts "#{prev_heading} #{inp[:title]}"
end