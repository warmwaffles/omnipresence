defmodule Omnipresence.TupleTest do
  use ExUnit.Case, async: true

  describe "present?/1" do
    test "empty tuple" do
      refute Omnipresence.present?({})
    end

    test "ok tuple" do
      assert Omnipresence.present?({:ok, 1})
    end
  end

  describe "blank?/1" do
    test "empty tuple" do
      assert Omnipresence.blank?({})
    end

    test "ok tuple" do
      refute Omnipresence.blank?({:ok, 1})
    end
  end

  describe "presence/1" do
    test "empty tuple" do
      assert Omnipresence.presence({}) == nil
    end

    test "ok tuple" do
      assert Omnipresence.presence({:ok, 1}) == {:ok, 1}
    end
  end
end
