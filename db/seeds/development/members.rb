names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom)
fnames = ["佐藤", "鈴木", "高橋", "田中"]
gnames = ["太郎", "次郎", "花子"]
Member.create(number: 1, name: "aa", full_name: "test", email: "aiueo@co.jp", birthday: "1999-01-01", sex: 1,
	administrator: true, password: "aa", password_confirmation: "aa")
0.upto(9) do |idx|
	Member.create(
		number: idx + 10,
		name: names[idx],
		full_name: "#{fnames[idx%4]} #{gnames[idx%3]}",
		email: "#{names[idx]}@example.com",
		birthday: "1999-05-28",
		sex: [1, 1, 2][idx %3],
		administrator: (idx==0),
		password: "asagao",
		password_confirmation: "asagao"
	)
end
0.upto(29) do |idx|
	Member.create(
		number: idx + 20,
		name: "test#{idx + 1}",
		full_name: "test test#{idx + 1}",
		email: "test#{idx + 1}@example.com",
		birthday: "1999-05-28",
		sex: 1,
		administrator: false,
		password: "pass",
		password_confirmation: "pass"
	)
end

filename = "profile.png"
path = Rails.root.join(__dir__, filename)
m = Member.find_by!(number: 10)

File.open(path) do |f|
  m.profile_picture.attach(io: f, filename: filename)
end
