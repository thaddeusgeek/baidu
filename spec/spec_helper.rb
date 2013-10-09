require 'baidu'
require 'time'
#请根据自己实际情况填写
BAIDU_MAP_KEY = '' #百度地图TOKEN
BAIDU_TRANSLATE_KEY = '' #百度翻译APIKEY
$searchWord = '' #根据Word查已投放关键词
$searchAdgroupName = '' #根据Adgroup查已投放的单元
$searchCampaignName = '' #根据Campaign查已投放的计划
$username = '' #账户 id=13
$password = '' #密码
$token = '' #token
$auth = Baidu::Auth.new
$auth.username = $username
$auth.password = $password
$auth.token = $token
$startDate = (Time.now - 24*3600).utc.iso8601
$endDate = Time.now.utc.iso8601
$pcDestinationUrl = 'http://www.elong.com/'
$mobileDestinationUrl = 'http://www.elong.com/'


cs = Baidu::SEM::CampaignService.new($auth)
campaigns = cs.getAllCampaign
campaign = campaigns.body[:campaign_types].first
$campaign_id = campaign[:campaign_id]
$campaign_name = campaign[:campaign_name]

ac = Baidu::SEM::AdgroupService.new($auth)
adgroups = ac.getAdgroupIdByCampaignId({:campaignIds=>[$campaign_id]})
$adgroup_id = adgroups.body[:campaign_adgroup_ids][:adgroup_ids].first

class ApiResponse
  class << self
    def verify(hash)
      hash.each do |k,v|
        k = k.to_s
        next if k.start_with?'@xmlns'
        send(k,v)
      end
    end
    def changed_creative_ids(changed_creative_ids)
    end
    def creative_types(creative_types)
    end
    def result(result)
    end

    def campaign_types(campaign_types)
    end
    def money(money)
      raise "money:#{money}" unless money =~ /\d+\.\d{2}/
    end
    alias :balance :money
    alias :cost :money
    alias :payment :money

    def budget(budget)
    end

    alias :budget_type :budget

    def region_target(region_target)
    end

    def open_domains(open_domains)
    end

    def reg_domain(reg_domain)
    end

    def account_info_type(account_info_type)
      raise "account_info_type:#{account_info_type}" if %w(userid balance cost payment budget_type budget region_target open_domains reg_domain).any?{|key|!account_info_type.has_key?key.to_sym}
      verify(account_info_type)
    end

    def scale(scale)
      raise "scale:#{scale}" unless scale.size == 2 and scale.is_a?Array
    end
    alias :changed_campaign_scale :scale
    alias :changed_adgroup_scale :scale
    alias :changed_keyword_scale :scale
    alias :changed_creative_scale :scale

    def campaign_infos(campaign_infos)
      if campaign_infos.is_a?Hash
        raise "campaign_infos#{campaign_infos}" if %w(campaign_id campaign_name).any?{|key|!campaign_infos.has_key?key.to_sym}
        verify(campaign_infos)
      else
        raise "campaign_infos#{campaign_infos}"
      end
    end

    def campaign_adgroups(campaign_adgroups)
      if campaign_adgroups.is_a?Array
        campaign_adgroups.each do |campaign_adgroup|
          campaign_adgroup(campaign_adgroup)
        end
      elsif campaign_adgroups.is_a?Hash
        verify(campaign_adgroups)
      else
        raise "campaign_adgroups:#{campaign_adgroups}"
      end
    end

    def campaign_adgroup(campaign_adgroup)
      raise 'campaign_adgroup' if %w(campaign_id adgroup_types).any?{|key|!campaign_adgroup.has_key?key.to_sym}
      verify(campaign_adgroup)
    end

    def exact_negative_words(exact_negative_words)
      raise "exact_negative_words:#{exact_negative_words}" unless exact_negative_words.is_a?Array or exact_negative_words.is_a?String
    end

    def negative_words(negative_words)
      raise "negative_words:#{negative_words}" unless negative_words.is_a?Array or negative_words.is_a?String
    end

    def adgroup_types(adgroup_types)
      if adgroup_types.is_a?Array #multiple adgroup_types
        adgroup_types.each do |adgroup_type|
          adgroup_type(adgroup_type)
        end
      elsif adgroup_types.is_a?Hash #single adgroup_type
        adgroup_type(adgroup_types)
      else
        raise "adgroup_types:#{adgroup_types}"
      end
    end

    def campaign_adgroup_ids(campaign_adgroup_ids)
      if campaign_adgroup_ids.is_a?Array
        campaign_adgroup_ids.each do |campaign_adgroup_id|
          campaign_adgroup_id(campaign_adgroup_id)
        end
      elsif campaign_adgroup_ids.is_a?Hash
        campaign_adgroup_id(campaign_adgroup_ids)
      else
        raise "campaign_adgroup_ids:#{campaign_adgroup_ids}"
      end
    end

    def campaign_adgroup_id(campaign_adgroup_id)
      raise "campaign_adgroup_id:#{campaign_adgroup_id}" if %w(campaign_id adgroup_ids).any?{|key|!campaign_adgroup_id.has_key?key.to_sym}
      verify(campaign_adgroup_id)
    end

    def adgroup_type(adgroup_type)
      raise "adgroup_type:#{adgroup_type}" if %w(adgroup_id campaign_id adgroup_name max_price pause status).any?{|key|!adgroup_type.has_key?key.to_sym}
      verify(adgroup_type)
    end

    def adgroup_ids(adgroup_ids)
      if adgroup_ids.is_a? String
        adgroup_id(adgroup_ids)
      elsif adgroup_ids.is_a?Array
        adgroup_ids.each do |adgroup_id|
          adgroup_id(adgroup_id)
        end
      else
        raise "adgroup_ids:#{adgroup_ids}"
      end
    end

    def adgroup_infos(adgroup_infos)
      if adgroup_infos.is_a?Array
        adgroup_infos.each do |adgroup_info|
          adgroup_info(adgroup_info)
        end
      elsif adgroup_infos.is_a?Hash
        adgroup_info(adgroup_infos)
      else
        raise "adgroup_infos:#{adgroup_infos}"
      end
    end

    def adgroup_info(adgroup_info)
      raise "adgroup_info:#{adgroup_info}" if %w(adgroup_id adgroup_name campaign_id campaign_name).any?{|key|!adgroup_info.has_key?key.to_sym}
      verify(adgroup_info)
    end

    def keyword_infos(keyword_infos)
      if keyword_infos.is_a?Array
        keyword_infos.each do |keyword_info|
          keyword_info(keyword_info)
        end
      elsif keyword_infos.is_a?Hash
        keyword_info(keyword_info)
      else
        raise "keyword_infos:#{keyword_infos}"
      end
    end

    def keyword_info(keyword_info)
       raise "keyword_info:#{keyword_info}" if %w(keyword_id keyword adgroup_id adgroup_name campaign_id campaign_name).any?{|key|!keyword_info.has_key?key.to_sym}
       verify(keyword_info)
    end

    def id(id)
      raise "id:#{id}" unless id =~ /\d+/
    end
    alias :campaign_id :id
    alias :adgroup_id :id
    alias :keyword_id :id
    alias :item_id :id
    alias :userid :id

    def name(name)
      raise "name:#{name}" unless name =~ /.+/
    end

    alias :campaign_name :name
    alias :adgroup_name :name


    def keyword(keyword)
      raise "keyword:#{keyword}" unless keyword =~ /.+/
    end

    def more(more)
      raise "more:#{more}" unless more == '1' or more == '0'
    end

    alias :more_word :more
    alias :more_campaign :more
    alias :more_adgroup :more

    def max_price(max_price)
      raise "max_price:#{max_price}" unless max_price.to_f.to_s == max_price
    end

    def pause(pause)
      raise "pause:#{pause}" unless !!pause == pause
    end

    def status(status)
      raise "status:#{status}" unless status =~ /\d+/
    end

    def file_id(file_id)
      raise "file_id:#{file_id}" unless file_id =~ /[0-9a-z]{32}/
    end
    alias :report_id :file_id

    def file_paths(file_paths)
      if file_paths.is_a?Array
        file_paths.each do |file_path|
          file_path(file_path)
        end
      else
        raise "file_paths:#{file_paths}"
      end
    end

    def file_path(file_path)
      raise "file_path:#{file_path}" unless URI.parse(file_path)
    end

    alias :account_file_path :file_path
    alias :campaign_file_path :file_path
    alias :adgroup_file_path :file_path
    alias :keyword_file_path :file_path
    alias :creative_file_path :file_path

    def file_md5(file_md5)
      raise "file_md5:#{file_md5}" unless file_md5 =~ /[0-9a-z]{32}/
    end
    alias :account_file_md5 :file_md5
    alias :campaign_file_md5 :file_md5
    alias :adgroup_file_md5 :file_md5
    alias :keyword_file_md5 :file_md5
    alias :creative_file_md5 :file_md5

    def is_generated(is_generated)
      raise "is_generated:#{is_generated}" unless is_generated =~ /\d+/
    end

    def end_time(end_time)
      end_time.is_a?DateTime
    end


    def changed_campaign_ids(changed_campaign_ids)
      if changed_campaign_ids.is_a?Array
        changed_campaign_ids.each do |changed_campaign_id|
          changed_campaign_id(changed_campaign_id)
        end
      elsif changed_campaign_ids.is_a?Hash
        changed_campaign_id(changed_campaign_ids)
      else
        raise "changed_campaign_ids:#{changed_campaign_ids}"
      end
    end

    def changed_campaign_id(changed_campaign_id)
      raise "changed_campaign_id:#{changed_campaign_id}" unless changed_campaign_id.has_key?(:campaign_id) and changed_campaign_id.has_key?(:operator)
      verify(changed_campaign_id)
    end

    def changed_adgroup_ids(changed_adgroup_ids)
      if changed_adgroup_ids.is_a?Array
        changed_adgroup_ids.each do |changed_adgroup_id|
          changed_adgroup_id(changed_adgroup_id)
        end
      elsif changed_adgroup_ids.is_a?Hash
        changed_adgroup_id(changed_adgroup_ids)
      else
        raise "changed_adgroup_ids:#{changed_adgroup_ids}"
      end
    end

    def changed_adgroup_id(changed_adgroup_id)
      raise "changed_adgroup_id:#{changed_adgroup_id}" unless changed_adgroup_id.has_key?(:adgroup_id) and changed_adgroup_id.has_key?(:operator)
      verify(changed_adgroup_id)
    end

    def changed_keyword_ids(changed_keyword_ids)
      if changed_keyword_ids.is_a?Array
        changed_keyword_ids.each do |changed_keyword_id|
          changed_keyword_id(changed_keyword_id)
        end
      elsif changed_keyword_ids.is_a?Hash
        # p changed_keyword_ids
        changed_keyword_id(changed_keyword_ids)
      else
        raise "changed_keyword_ids:#{changed_keyword_ids}"
      end
    end

    def changed_keyword_id(changed_keyword_id)
       raise "changed_keyword_id:#{changed_keyword_id}" if [:operator, :item_id, :campaign_id, :adgroup_id].any?{|key|!changed_keyword_id.has_key?key}
       verify(changed_keyword_id)
    end

    def operator(operator)
      raise "operator:#{operator}" unless operator =~ /\d+/
    end

    def response(response)
      raise "response:#{response}" unless response == 'placeholder'
    end
  end
  # def account_file_md5(file_md5)
  #   file_md5(file_md5)
  # end
  # def campaign_file_md5(file_md5)
  #   file_md5(file_md5)
  # end
  # def adgroup_file_md5(file_md5)
  #   file_md5(file_md5)
  # end
  # def keyword_file_md5(file_md5)
  #   file_md5(file_md5)
  # end
  # def creative_file_md5(file_md5)
  #   file_md5(file_md5)
  # end
end