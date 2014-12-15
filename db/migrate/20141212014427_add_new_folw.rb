# encoding: utf-8
class AddNewFolw < ActiveRecord::Migration
  def up
  f =FlowType.new
  f.code = 'pic'
  f.name = '截图'
  f.save

  f =FlowType.new
  f.code = 'db'
  f.name = '数据库比对'
  f.save
  end

  def down
  end
end
